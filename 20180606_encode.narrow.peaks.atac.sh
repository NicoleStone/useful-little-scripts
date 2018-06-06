#calling narrow peaks encode style

#!/bin/bash
cd /data/home/nstone/HiSeq4000_data/bam.browser

outdir="/data/home/nstone/HiSeq4000_data/peaks"
source=Browser.sort.*.rem_dups.bam

pval_thresh=0.1 #high false positives at this threshold -- follow with 2/3 concordance
prefix="ENCODE_MACS_p0.1_narrow.ATAC"
smooth_window=200
shiftsize=100 


for file in $source
do
	#basefilename=`echo $file | sed 's/_R1_001.fastq.gz//'`
	basefilename=`echo $file | sed 's/.everything.sam.mapped.sam.bam.sort.bam.rem_dups.bam//'`

	qplz --background --mem=16 "macs2 callpeak -t $file -f BAM -n "$prefix.$basefilename.txt" -g mm -p $pval_thresh --nomodel --shift -$shiftsize --extsize $smooth_window -B --SPMR --call-summits --outdir $outdir"
	
done
   

   