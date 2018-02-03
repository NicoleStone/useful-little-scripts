#!/bin/bash

WORKING="/data/home/nstone/20180108_chip.figure.bams/peaks.original/masterPeaks/gff"
cd $WORKING

#featureCounts [options] -a <annotation_file> -o <output_file> input_file1 [input_file2] ...

ANNOT="masterPeaks_tbx5.txt.gff.txt"
OUTFILE="featureCounts.raw_chip.tbx5.txt"

#replicate 3
IN01="/data/home/nstone/20180108_chip.figure.bams/bam.rmdup.sorted/input.R3.sorted.bam.rem_dups.bam.sort.bam"
IN02="/data/home/nstone/20180108_chip.figure.bams/bam.rmdup.sorted/gata4.R3.sorted.bam.rem_dups.bam.sort.bam"
IN03="/data/home/nstone/20180108_chip.figure.bams/bam.rmdup.sorted/mef2c.R3.sorted.bam.rem_dups.bam.sort.bam"
IN04="/data/home/nstone/20180108_chip.figure.bams/bam.rmdup.sorted/tbx5.R3.sorted.bam.rem_dups.bam.sort.bam"

#replicate 4
IN05="/data/home/nstone/20180108_chip.figure.bams/bam.rmdup.sorted/input.R4.sorted.bam.rem_dups.bam.sort.bam"
IN06="/data/home/nstone/20180108_chip.figure.bams/bam.rmdup.sorted/gata4.R4.sorted.bam.rem_dups.bam.sort.bam"
IN07="/data/home/nstone/20180108_chip.figure.bams/bam.rmdup.sorted/mef2c.R4.sorted.bam.rem_dups.bam.sort.bam"
IN08="/data/home/nstone/20180108_chip.figure.bams/bam.rmdup.sorted/tbx5.R4.sorted.bam.rem_dups.bam.sort.bam"

#replicate 5
IN09="/data/home/nstone/20180108_chip.figure.bams/bam.rmdup.sorted/input.R5.rem_dups.sort.bam"
IN10="/data/home/nstone/20180108_chip.figure.bams/bam.rmdup.sorted/gata4.R5.rem_dups.sort.bam"
IN11="/data/home/nstone/20180108_chip.figure.bams/bam.rmdup.sorted/mef2c.R5.rem_dups.sort.bam"
IN12="/data/home/nstone/20180108_chip.figure.bams/bam.rmdup.sorted/tbx5.R5.rem_dups.sort.bam"

#gata's and input's
featureCounts -f -s 0 -B -P -C --ignoreDup -a $ANNOT -o $OUTFILE $IN04 $IN08 $IN12 $IN01 $IN05 $IN09 


# -B                  Count read pairs that have both ends successfully aligned 
#                       only.
# 
# -P                  Check validity of paired-end distance when counting read 
#                       pairs. Use -d and -D to set thresholds.
# 
# -d <int>            Minimum fragment/template length, 50 by default.
# 
# -D <int>            Maximum fragment/template length, 600 by default.
# 
# -C                  Do not count read pairs that have their two ends mapping 
#                       to different chromosomes or mapping to same chromosome 
#                       but on different strands.
# 
# --primary           Count primary alignments only. Primary alignments are 
#                       identified using bit 0x100 in SAM/BAM FLAG field.
# 
# --ignoreDup         Ignore duplicate reads in read counting. Duplicate reads 
#                       are identified using bit Ox400 in BAM/SAM FLAG field. The 
#                       whole read pair is ignored if one of the reads is a 
#                       duplicate read for paired end data.
# 
# # Strandness
# 
#   -s <int>            Perform strand-specific read counting. Acceptable values:
#                       0 (unstranded), 1 (stranded) and 2 (reversely stranded).
#                       0 by default.
# Level of summarization
# 
#   -f                  Perform read counting at feature level (eg. counting 
#                       reads for exons rather than genes).

