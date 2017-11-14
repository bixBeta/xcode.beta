#!/bin/sh -l

#  star.alignment.loop.sh
#  BiX - beta
#
#  Created by BiX on 11/14/17.
#  

#SBATCH -J star.align
#SBATCH -o out.star.align
#SBATCH -e err.star.align
#SBATCH -n 10
#SBATCH -t 23:59:59
#SBATCH --nodes=2
#SBATCH --mem-per-cpu=20000

# declare an array of all fastq.gz file names
declare -a fasta=("FIBROB-DMSO-K27Ac_S7_R1_001.fastq.gz"
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

for i in "${fasta[@]}"
do

# set appropriate outFileNamePrefix schema
iSUB=`echo "$i" | cut -d'_' -f1`

FASTQ="$i"
# set appropriate ref genome index
DIR=/network/rit/lab/ahmedlab/genomes/ucsc/Homo_sapiens/hg19/genomeDir


/network/rit/lab/ahmedlab/bin/STAR \
--runThreadN 12 \
--genomeDir $DIR \
--readFilesIn $FASTQ \
--readFilesCommand zcat \
--outSAMstrandField intronMotif \
--outFilterIntronMotifs RemoveNoncanonical \
--outSAMtype BAM SortedByCoordinate \
--outFileNamePrefix "$iSUB". \
--limitBAMsortRAM 61675612266

done
