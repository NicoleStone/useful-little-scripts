#!/bin/bash
# run like: qplz -t 99 -m 24 20171102_ngsplot.chip.gata4.sh

#set environments first before each session
export PATH=~/ngsplot/bin:$PATH
source ~/.bash_profile

WORKING="/data/home/nstone/20171108_chip.ngsplot.homer/ngsplot.16"

REGIONS="/data/home/nstone/20171108_chip.ngsplot.homer/intersect16.gmtc.GMT.3rc.allchips.txt"
CONFIG="20171108.config.16.sh"

LEN=3000
PLOTNAME="ATAC signal at GMT 3rc ChIP Peaks"
OUTNAME="atac.chip.16"
#FRAGLEN=#optional to list fragment length
 
cd $WORKING
 
ngs.plot.r -G mm9 -R bed -E $REGIONS -C $CONFIG -O $OUTNAME -T $PLOTNAME -L $LEN -GO km -CO black


# IF YOU WANT TO BE ABLE TO PULL OUT ROW IDENTITIES FROM HEATMAP CLUSTERS LATER, 
# MAKE SURE TO FORMAT YOUR REGION FILE WITH A 4TH COLUMN UNIQUE IDENTIFIER, LIKE SO:
# chr1	10131460	10132087	chr1;10131460-10132087	ENSMUSG00000067851	Arfgef1	4121.5
# DON'T USE A COLON, BC NGSPLOT SPLITS ON COLONS.

####################################################################################
# After complete, run the following from 
# https://github.com/shenlab-sinai/ngsplot/wiki/HowtoMakeThingsRight
# to extract row identitites from clusters!
# Usage: Rscript ExtractGName.R ngsres

#fname <- commandArgs(T)

#zip.fname <- paste(fname, 'zip', sep='.')
#heatmap.dat <- file.path(fname, 'heatmap.RData')
#load(unz(zip.fname, heatmap.dat))

#gene.list <- strsplit(go.list[[1]], ':')
#gname.list <- sapply(gene.list, function(x) x[1])
#write.table(gname.list, file=paste(fname, 'gname.txt', sep='.'),
#            col.names=F, row.names=F)
####################################################################################
