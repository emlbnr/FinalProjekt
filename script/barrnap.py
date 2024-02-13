from snakemake.shell import shell

genome = snakemake.input.genome
rRNA = snakemake.output.rRNA

shell(f"""barrnap --kingdom bac --quiet {genome} > {rRNA}""")











