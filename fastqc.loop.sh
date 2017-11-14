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
#SBATCH --nodes=1
#SBATCH --mem-per-cpu=18000

declare -a fastq=("FIBROB-DMSO-K27Ac_S7_R1_001.fastq.gz"
                "FIBROB-DMSO-p53_S6_R1_001.fastq.gz"
                "FIBROB-NUTLIN-K27Ac_S3_R1_001.fastq.gz"
                "FIBROB-NUTLIN-p53_S12_R1_001.fastq.gz"
                "HUVEC-DMSO-K27Ac_S2_R1_001.fastq.gz"
                "HUVEC-DMSO-p53_S5_R1_001.fastq.gz"
                "HUVEC-NUTLIN-K27Ac_S9_R1_001.fastq.gz"
                "HUVEC-NUTLIN-p53_S1_R1_001.fastq.gz"
                "MCF10A-DMSO-K27Ac_S4_R1_001.fastq.gz"
                "MCF10A-DMSO-p53_S10_R1_001.fastq.gz"
                "MCF10A-NUTLIN-K27Ac_S11_R1_001.fastq.gz"
                "MCF10A-NUTLIN-p53_S8_R1_001.fastq.gz")

BIN=/network/rit/lab/ahmedlab/bin/FastQC/fastqc # location of FASTQC

for i in "${fastq[@]}"
do
$BIN "$i"
done
