#!/bin/sh -l

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
#SBATCH --mem-per-cpu=20000


ls -1 *.bams > List.Bams   # creates a list of all BAM files and saves it in the List.Bams file
bams=( `cat "List.Bams" `) # uses List.Bams lines as array elements

# samtools has to be in the $PATH

for i in "${bams[@]}"

do

    iSUB=`echo "$i" | cut -d'.' -f1` # subset to rename
    makeTagDirectory "$iSUB".tag.dir "$i"

done

























