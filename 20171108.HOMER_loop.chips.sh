#!/bin/bash
#########################################################
# BASIC HOMER LOOP SCRIPT FOR ATAC-SEQ REGION SETS 		#
# Nicole Stone 20170605									#
#########################################################
# 	run as:						#
# 	qplz homerMotif_forloop.sh	#
#################################

#want de novo calls here. add "-nomotif" option if you don't want de novo motif finding done. faster.

SOURCEDIR="/data/home/nstone/20171108_chip.ngsplot.homer"
#use bg all ATAC peaks open in all conditions (excluding neoCM)
BG="/data/home/nstone/homer/background_rc.common.all.excludingneocm.forGREAT.txt"

ALLMOTIFS=/data/home/nstone/homer/data/knownTFs/vertebrates/known.motifs #contains BB custom motifs

cd $SOURCEDIR
for file in *.txt
do 
	TEMP="$file.tmp"
	FOLDER="$file.motif/"
	TARGET="$file.bed"
	echo $TEMP
	echo $FOLDER
	echo $TARGET
	awk 'BEGIN {FS="\t"}; {$(NF+1)="peak"++i FS "." FS "+";}1' $file > $TEMP
	tr ' ' '\t' < $TEMP > $TARGET
	findMotifsGenome.pl $TARGET mm9 $FOLDER -size 200 -mask -h -len 5,6,8,10,12 -bg $BG -mknown $ALLMOTIFS
	rm $TEMP  
done

