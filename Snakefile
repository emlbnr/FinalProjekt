organismas=["B_longum", "L_delbureckii"]

rule all:
    input:
         expand("output/barrnap/{genome}_rrna.gff", genome=["B_longum", "L_delbureckii"]),
         expand("output/repeatmodeler/{genome}/{genome}_rmdb.nhr", genome=["B_longum", "L_delbureckii"]),
         expand("output/repeatmodeler/{genome}/{genome}_rmdb-families.fa", genome=["B_longum", "L_delbureckii"]),
         expand("output/repeatmodeler/{genome}/{genome}_rmdb-families.stk", genome=["B_longum", "L_delbureckii"]),
         #expand("output/repeatmasker/{genome}/{genome}_masked.fa", genome=["B_longum", "L_delbureckii"]),
         #expand("output/repeatmasker/{genome}/{genome}_repeatmasker_summary.out", genome=["B_longum", "L_delbureckii"])
         expand("output/repeatmasker/RES_REPEATMASKING/{genome}.fasta.bed", genome=["B_longum", "L_delbureckii"])


rule barrnap:
    input:
        genome="resource/genome/{genome}.fasta"
    output:
        rRNA="output/barrnap/{genome}_rrna.gff"
    conda:
        "envs/env.yaml"
    script:
        "script/barrnap.py"
    #shell:
        #"""barrnap --kingdom bac --quiet {input.genome} > {output.rRNA}"""

rule build_database:
    input:
        genome = "/Users/emelbiner/PycharmProjects/FinalProjekt/resource/genome/{genome}.fasta"
    output:
        nhr = "output/repeatmodeler/{genome}/{genome}_rmdb.nhr"
    shell:
        """
        mkdir -p output/repeatmodeler/{wildcards.genome}
        cd output/repeatmodeler/{wildcards.genome} 
        BuildDatabase -engine ncbi -name {wildcards.genome}_rmdb {input.genome}"""

rule repeatmodeler:
    output:
        fa = "output/repeatmodeler/{genome}/{genome}_rmdb-families.fa",
        stk = "output/repeatmodeler/{genome}/{genome}_rmdb-families.stk"
    shell:
        """
        mkdir -p output/repeatmodeler/{wildcards.genome}
        cd output/repeatmodeler/{wildcards.genome}
        RepeatModeler -engine ncbi -database {wildcards.genome}_rmdb -pa 4
        """

#rule repeatmasker:
    #input:
        #genome = "/Users/emelbiner/PycharmProjects/FinalProjekt/resource/genome/{genome}.fasta",
        #repeat_library = "/Users/emelbiner/PycharmProjects/FinalProjekt/output/repeatmodeler/{genome}/consensi.fa"
    #output:
        #masked_genome = "output/repeatmasker/{genome}_masked.fa",
        #output_summary = "output/repeatmasker/{genome}_repeatmasker_summary.out"
    #shell:
        #"""
        #RepeatMasker -lib {input.repeat_library} -pa 4 -gff -s -no_is -nolow -dir output {input.genome}
        #"""

rule repeatmasker:
    input:
        assembly = "/Users/emelbiner/PycharmProjects/FinalProjekt/resource/genome/{genome}.fasta",
        library = "/Users/emelbiner/PycharmProjects/FinalProjekt/output/repeatmodeler/B_longum/RM_48969.FriFeb232327442024/consensi.fa"
    #params:
        #pa=config['REPEATMASKER']['pa']
    output:
        bed=f"output/repeatmasker/RES_REPEATMASKING/{{genome}}.fasta.bed"
    envmodules:
        "bioinfo/RepeatMasker/4.1.0",
        "system/python/3.7.2"
    shell:
        """
        RepeatMasker  -gff -dir output/repeatmasker/RES_REPEATMASKING -lib {input.library} {input.assembly}
        /usr/local/RepeatMasker-4.1.0/util/RM2Bed.py output/repeatmasker/RES_REPEATMASKING/.out
        mv.bed output/repeatmasker/RES_REPEATMASKING/
        """




















