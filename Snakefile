rule all:
    input:
         expand("output/barrnap/{genome}_rrna.gff", genome=["B_longum", "L_delbureckii"])

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





