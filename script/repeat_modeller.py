from snakemake.shell import shell

genome = snakemake.input.db
db = snakemake.output.classified

shell(f"""repeatmodeler -engine blast -species bacterium {wildcards.genome} > {output.classified}""")



