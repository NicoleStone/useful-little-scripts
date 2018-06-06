#!/bin/bash

# Calling ATAC-seq peaks ENCODE style (https://github.com/ENCODE-DCC/atac-seq-pipeline)

cd /data/home/nstone/HiSeq4000_data/bam.browser

outdir="/path/to/peaks"
source=Browser*.rem_dups.bam

pval_thresh=0.1 # high false positives at this threshold -- follow with 2/3 concordance
prefix="ENCODE_MACS_p0.1_narrow.ATAC" # prefix you want to add to output files
smooth_window=200
shiftsize=100 


for file in $source
do
	basefilename=`echo $file | sed 's/COMMON.FILENAME.PORTION.rem_dups.bam//'` # use this in case you want to shorten your output peak file names
	qplz --background --mem=16 "macs2 callpeak -t $file -f BAM -n "$prefix.$basefilename.txt" -g mm -p $pval_thresh --nomodel --shift -$shiftsize --extsize $smooth_window -B --SPMR --call-summits --outdir $outdir"
done
   

   
