#!/bin/sh -l

#  fastqc.loop.sh
#  BiX - beta
#
#  Created by BiX on 11/14/17.
#  
#SBATCH -J fastqc
#SBATCH -o out.fastqc
#SBATCH -e err.fastqc
#SBATCH -n 8
#SBATCH -t 23:59:59
#SBATCH -p batch
#SBATCH -w rhea-09
#SBATCH --mem-per-cpu=18000

for i in *.fastq.gz

do
    fastqc -o ../FastQC.Results "$i" # saves all result files in FastQC.Results folder

done
