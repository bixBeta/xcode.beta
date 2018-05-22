#!/bin/sh -l

#  htseq.count.loop.sh
#  BiX - beta
#
#  Created by BiX on 11/14/17.
#  

#SBATCH -J htseq.count
#SBATCH -o out.htseq.count
#SBATCH -e err.htseq.count
#SBATCH -n 10
#SBATCH -t 23:59:59
#SBATCH --mem-per-cpu=20000

# declare an array of all bam file names

for i in *.bam

do
    iSUB=`echo "$i" | cut -d'.' -f1`  # set appropriate out file name schema

    htseq-count -f bam -s yes -t exon -i gene_id -m intersection-strict \
    "$i" \
    genes.gtf > "$iSUB".htseq.counts # select appropriate genome annotation file

done
