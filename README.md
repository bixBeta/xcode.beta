# xcode.beta
SLURM jobs @ UALBANY

Run the alignment script from the ../working.dir/ with all fastq.gz files.

Run the htseq-count script with all bam files present in the path of the script.

To execute the scripts on headnode7:

$ sbatch scriptName 


Run multiQC in the directory with all FASTQC results to generate one final .html report with all quality control metrics for visualization.

