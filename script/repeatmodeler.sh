#!/bin/bash

# Replace the following paths with your genome file path and output directory
genome_file="/Users/emelbiner/PycharmProjects/FinalProjekt/resource/genome/B_longum.fasta"
output_dir="/Users/emelbiner/PycharmProjects/FinalProjekt/resource/database"

# Change to the output directory
mkdir -p "$output_dir"
cd "$output_dir"

# Run RepeatModeler with the specified genome file
#RepeatModeler -database "xdf_database" -species "Bifidobacterium longum" -LTRStruct -pa 4 -s "$genome_file"
RepeatModeler -database "xdf_database" -engine ncbi -pa 4 -srand 42 -s "$genome_file"

#/Users/emelbiner/anaconda3/envs/repeatmodeller_env/bin/RepeatModeler

