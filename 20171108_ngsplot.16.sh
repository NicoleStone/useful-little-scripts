# run like: qplz -t 99 -m 24 20171102_ngsplot.chip.gata4.sh

#!/bin/bash

#set environments first before each session
export PATH=~/ngsplot/bin:$PATH
source ~/.bash_profile

WORKING="/data/home/nstone/20171108_chip.ngsplot.homer/ngsplot.16"

REGIONS="/data/home/nstone/20171108_chip.ngsplot.homer/intersect16.gmtc.GMT.3rc.allchips.txt"
CONFIG="20171108.config.16.sh"

LEN=3000
PLOTNAME="ATAC signal at GMT 3rc ChIP Peaks"
OUTNAME="atac.chip.16"
#FRAGLEN=
#optional to list fragment length
 
cd $WORKING
 
ngs.plot.r -G mm9 -R bed -E $REGIONS -C $CONFIG -O $OUTNAME -T $PLOTNAME -L $LEN -GO km -CO black

