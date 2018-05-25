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


# create a list of input fastq files
ls -1 *R1* > Read1.list # for SE library

# ls -1 *R2* > Read2.list  # for PE library (un-comment line 21 and 22 and comment line 19 for PE usage)

paste -d" " Read1.list Read2.list > Reads.list # for SE and PE library

fastqs=( `cat "Reads.List" ` ) # reads each line as element of fastqs array

for i in "${fastqs[@]}"
do

# set appropriate outFileNamePrefix schema
iSUB=`echo "$i" | cut -d' ' -f1`
FASTQ="$i"

# set appropriate ref genome index
DIR=../genomes/ucsc/Homo_sapiens/hg19/genomeDir

STAR \
--runThreadN 12 \
--genomeDir $DIR \
--readFilesIn $FASTQ \
--readFilesCommand zcat \
--outSAMstrandField intronMotif \
--outFilterIntronMotifs RemoveNoncanonical \
--outSAMtype BAM SortedByCoordinate \
--outFileNamePrefix "$iSUB". \
--limitBAMsortRAM 61675612266
--quantMode GeneCounts

done
