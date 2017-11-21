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
#SBATCH --nodes=2
#SBATCH --mem-per-cpu=20000

# declare an array of all bam file names

declare -a bam=("FIBROB_DMSO_1.Aligned.sortedByCoord.out.bam"
                "FIBROB_DMSO_2.Aligned.sortedByCoord.out.bam"
                "FIBROB_DMSO_3.Aligned.sortedByCoord.out.bam"
                "FIBROB_Nutlin_1.Aligned.sortedByCoord.out.bam"
                "FIBROB_Nutlin_2.Aligned.sortedByCoord.out.bam"
                "FIBROB_Nutlin_3.Aligned.sortedByCoord.out.bam"
                "HUVEC_DMSO_1.Aligned.sortedByCoord.out.bam"
                "HUVEC_DMSO_2.Aligned.sortedByCoord.out.bam"
                "HUVEC_DMSO_3.Aligned.sortedByCoord.out.bam"
                "HUVEC_Nutlin_1.Aligned.sortedByCoord.out.bam"
                "HUVEC_Nutlin_2.Aligned.sortedByCoord.out.bam"
                "HUVEC_Nutlin_3.Aligned.sortedByCoord.out.bam"
                "MCF10A_DMSO_1.Aligned.sortedByCoord.out.bam"
                "MCF10A_DMSO_2.Aligned.sortedByCoord.out.bam"
                "MCF10A_DMSO_3.Aligned.sortedByCoord.out.bam"
                "MCF10A_Nutlin_1.Aligned.sortedByCoord.out.bam"
                "MCF10A_Nutlin_2.Aligned.sortedByCoord.out.bam"
                "MCF10A_Nutlin_3.Aligned.sortedByCoord.out.bam")

for i in "${bam[@]}"
do

iSUB=`echo "$i" | cut -d'.' -f1`  # set appropriate out file name schema


BIN=/network/rit/lab/ahmedlab/bin/anaconda2/bin/htseq-count # location of htseq-count 
GTF=/network/rit/lab/ahmedlab/genomes/ucsc/Homo_sapiens/hg19/Annotation/Genes/genes.gtf

$BIN -f bam -s yes -t exon -i gene_id -m intersection-strict \
"$i" \
$GTF > "$iSUB".htseq.counts

done
