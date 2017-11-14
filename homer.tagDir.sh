#!/bin/sh

#  homer.tagDir.sh
#  BiX - beta
#
#  Created by BiX on 11/14/17.
#  

#SBATCH -J tagdir
#SBATCH -o out.tagdir
#SBATCH -e err.tagdir
#SBATCH -n 10
#SBATCH -t 23:59:59
#SBATCH --nodes=2
#SBATCH --mem-per-cpu=20000

declare -a fasta=("FIBROB-DMSO-K27Ac.Aligned.sortedByCoord.out.bam"
"FIBROB-DMSO-p53.Aligned.sortedByCoord.out.bam"
"FIBROB-NUTLIN-K27Ac.Aligned.sortedByCoord.out.bam"
"FIBROB-NUTLIN-p53.Aligned.sortedByCoord.out.bam"
"HUVEC-DMSO-K27Ac.Aligned.sortedByCoord.out.bam"
"HUVEC-DMSO-p53.Aligned.sortedByCoord.out.bam"
"HUVEC-NUTLIN-K27Ac.Aligned.sortedByCoord.out.bam"
"HUVEC-NUTLIN-p53.Aligned.sortedByCoord.out.bam"
"MCF10A-DMSO-K27Ac.Aligned.sortedByCoord.out.bam"
"MCF10A-DMSO-p53.Aligned.sortedByCoord.out.bam"
"MCF10A-NUTLIN-K27Ac.Aligned.sortedByCoord.out.bam"
"MCF10A-NUTLIN-p53.Aligned.sortedByCoord.out.bam")

for i in "${fasta[@]}"
do

BIN=/network/rit/lab/ahmedlab/bin/anaconda2/bin/makeTagDirectory
iSUB=`echo "$i" | cut -d'.' -f1`

$BIN "$iSUB".tag.dir "$i"
























