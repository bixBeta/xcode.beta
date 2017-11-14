#!/bin/sh

#  hello.world.sh
#  BiX - beta
#
#  Created by BiX on 11/1/17.
#  

# housekeeping ---------------------------------------------------------------------------------------------------
export PATH="/network/rit/lab/ahmedlab/bin/anaconda2/bin/:$PATH"
export PATH="/network/rit/lab/ahmedlab/bin/:$PATH"
export PATH="/network/rit/lab/ahmedlab/bin/homebrew/bin/:$PATH"
export PATH="/network/rit/lab/ahmedlab/bin/bcl2fastq/usr/local/bin/:$PATH"



# rename the fastq files to append PI name and PIN (Project Identifier Number) ------------------------------------
for i in *; do mv "$i" Morgan.Sammons.0002."$i"; done



# multiQC usage ---------------------------------------------------------------------------------------------------
/network/rit/lab/ahmedlab/bin/anaconda2/bin/multiqc ${FASTQC} \
-n Morgan.Sammons.0001.multiQC.fastqc



# awk usage -------------------------------------------------------------------------------------------------------
awk '{OFS="\t";if(NR==1) {print;} else if(NR >= 4819050 && NR <= 4835639) {print;} else {$1="chr"$1; print;}}'



# unzip .rpm files
rpm2cpio ../file.rpm | cpio -idmv  #extract mkdir preserve verbose



# homer usage -----------------------------------------------------------------------------------------------------
makeUCSCfile S1.tag.dir/ -o auto -fsize 5e7 -res 1 -color 106,42,73 -style chipseq

    # homer configure.pl script location
    /network/rit/lab/ahmedlab/bin/anaconda2/pkgs/homer-4.9.1-pl5.22.0_5/share/homer-4.9.1-5



# count lines of fastq.gz files ------------------------------------------------------------------------------------
for i in ./*; do echo 'working with' $i; zcat $i | wc -l ; done



# rename the fastq files to append PI name and PIN (Project Identifier Number)--------------------------------------
for i in *; do mv "$i" Morgan.Sammons.0002."$i"; done



# use cases coreData -----------------------------------------------------------------------------------------------
for D in /network/rit/lab/ahmedlab/projects/Morgan.Sammons.0003/Morgan.Sammons.0003.fastq/*; do
    if [ -d "$D" ]; then
    cd "$D"
    mv * ..
    cd ..
    fi
done

# For single end reads!
cd /network/rit/lab/ahmedlab/projects/Morgan.Sammons.0001/coreData/loop2/ &&
for dir in Morgan.Sammons.0001*/; do
    for r in R1; do
    outfile=${dir%/}_${r}.fastq.gz
    glob=*_${r}_*.fastq.gz
    cat "$dir"/$glob > "$dir/$outfile" &&
    rm -f "$dir"/$glob
    done
done

#------


