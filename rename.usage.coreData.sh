#!/bin/sh

#  rename.usage.coreData.sh
#  BiX - beta
#
#  Created by BiX on 11/1/17.
#  

# rename the fastq files to append PI name and PIN (Project Identifier Number)
for i in *; do mv "$i" Morgan.Sammons.0002."$i"; done




