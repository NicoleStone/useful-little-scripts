#############################################
##pulling out 2/3 replicate concordant regions
##written by Nicole Stone 2017.04.12
#############################################
#############################################
## to run: 
## 	python 20170411.atac.rc.py
#############################################
#############################################
## WHAT'S IT DO?
## Pull out lines where at least 2/3 replicates have a peak within the region, and 
## print to an output file containing part of the column name (condition name as written here)
## File must be in this format: bed followed by triplicate data
#			ENCODE_MACS_p0.1_narrow.Browser.sort.Fibc_d2.138.mapped.bam.rem_dups.bam_peaks.narrowPeak.sort	ENCODE_MACS_p0.1_narrow.Browser.sort.Fibc_d2.143.mapped.bam.rem_dups.bam_peaks.narrowPeak.sort	ENCODE_MACS_p0.1_narrow.Browser.sort.Fibc_d2.157.mapped.bam.rem_dups.bam_peaks.narrowPeak.sort	ENCODE_MACS_p0.1_narrow.Browser.sort.Fib_w1.038.mapped.bam.rem_dups.bam_peaks.narrowPeak.sort	ENCODE_MACS_p0.1_narrow.Browser.sort.Fib_w1.039.mapped.bam.rem_dups.bam_peaks.narrowPeak.sort	ENCODE_MACS_p0.1_narrow.Browser.sort.Fib_w1.040.mapped.bam.rem_dups.bam_peaks.narrowPeak.sort	ENCODE_MACS_p0.1_narrow.Browser.sort.GMTc_d2.102.mapped.bam.rem_dups.bam_peaks.narrowPeak.sort	ENCODE_MACS_p0.1_narrow.Browser.sort.GMTc_d2.136.mapped.bam.rem_dups.bam_peaks.narrowPeak.sort	ENCODE_MACS_p0.1_narrow.Browser.sort.GMTc_d2.138.mapped.bam.rem_dups.bam_peaks.narrowPeak.sort	ENCODE_MACS_p0.1_narrow.Browser.sort.GMTc_d3.097.mapped.bam.rem_dups.bam_peaks.narrowPeak.sort	ENCODE_MACS_p0.1_narrow.Browser.sort.GMTc_d3.107.mapped.bam.rem_dups.bam_peaks.narrowPeak.sort	ENCODE_MACS_p0.1_narrow.Browser.sort.GMTc_d3.121.mapped.bam.rem_dups.bam_peaks.narrowPeak.sort	ENCODE_MACS_p0.1_narrow.Browser.sort.GMTc_w1.096.mapped.bam.rem_dups.bam_peaks.narrowPeak.sort	ENCODE_MACS_p0.1_narrow.Browser.sort.GMTc_w1.101.mapped.bam.rem_dups.bam_peaks.narrowPeak.sort	ENCODE_MACS_p0.1_narrow.Browser.sort.GMTc_w1.114.mapped.bam.rem_dups.bam_peaks.narrowPeak.sort	ENCODE_MACS_p0.1_narrow.Browser.sort.GMTc_w2.109.mapped.bam.rem_dups.bam_peaks.narrowPeak.sort	ENCODE_MACS_p0.1_narrow.Browser.sort.GMTc_w2.112.mapped.bam.rem_dups.bam_peaks.narrowPeak.sort	ENCODE_MACS_p0.1_narrow.Browser.sort.GMTc_w2.116.mapped.bam.rem_dups.bam_peaks.narrowPeak.sort	ENCODE_MACS_p0.1_narrow.Browser.sort.GMTc_w3.126.mapped.bam.rem_dups.bam_peaks.narrowPeak.sort	ENCODE_MACS_p0.1_narrow.Browser.sort.GMTc_w3.127.mapped.bam.rem_dups.bam_peaks.narrowPeak.sort	ENCODE_MACS_p0.1_narrow.Browser.sort.GMTc_w3.147.mapped.bam.rem_dups.bam_peaks.narrowPeak.sort	ENCODE_MACS_p0.1_narrow.Browser.sort.GMT_w1.063.mapped.bam.rem_dups.bam_peaks.narrowPeak.sort	ENCODE_MACS_p0.1_narrow.Browser.sort.GMT_w1.080.mapped.bam.rem_dups.bam_peaks.narrowPeak.sort	ENCODE_MACS_p0.1_narrow.Browser.sort.GMT_w1.084.mapped.bam.rem_dups.bam_peaks.narrowPeak.sort	ENCODE_MACS_p0.1_narrow.Browser.sort.GMT_w2.085.mapped.bam.rem_dups.bam_peaks.narrowPeak.sort	ENCODE_MACS_p0.1_narrow.Browser.sort.GMT_w2.095.mapped.bam.rem_dups.bam_peaks.narrowPeak.sort	ENCODE_MACS_p0.1_narrow.Browser.sort.GMT_w2.130.mapped.bam.rem_dups.bam_peaks.narrowPeak.sort	ENCODE_MACS_p0.1_narrow.Browser.sort.GMT_w4.082.mapped.bam.rem_dups.bam_peaks.narrowPeak.sort	ENCODE_MACS_p0.1_narrow.Browser.sort.GMT_w4.088.mapped.bam.rem_dups.bam_peaks.narrowPeak.sort	ENCODE_MACS_p0.1_narrow.Browser.sort.GMT_w4.105.mapped.bam.rem_dups.bam_peaks.narrowPeak.sort	ENCODE_MACS_p0.1_narrow.Browser.sort.GMT_w6.059.mapped.bam.rem_dups.bam_peaks.narrowPeak.sort	ENCODE_MACS_p0.1_narrow.Browser.sort.GMT_w6.086.mapped.bam.rem_dups.bam_peaks.narrowPeak.sort	ENCODE_MACS_p0.1_narrow.Browser.sort.GMT_w6.106.mapped.bam.rem_dups.bam_peaks.narrowPeak.sort	ENCODE_MACS_p0.1_narrow.Browser.sort.neoCM.1.mapped.bam.rem_dups.bam_peaks.narrowPeak.sort	ENCODE_MACS_p0.1_narrow.Browser.sort.neoCM.2.mapped.bam.rem_dups.bam_peaks.narrowPeak.sort	ENCODE_MACS_p0.1_narrow.Browser.sort.neoCM.3.mapped.bam.rem_dups.bam_peaks.narrowPeak.sort
#chr1	3000806	3001970	1	1	1	0	2	0	0	0	1	0	0	0	0	0	0	0	0	0	0	0	0	0	1	0	1	1	2	0	1	0	2	0	0	0	1	1
#chr1	3002114	3002978	0	0	0	0	0	1	0	0	0	1	1	1	0	1	1	1	0	0	1	1	0	0	0	0	1	0	1	0	1	0	1	1	0	1	1	1
#chr1	3003109	3003399	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	1	0	0	0	1	0	0	0	0	0	0	0
#############################################
#############################################

import numpy as np
from numpy import inf

i = int(raw_input("Enter condition number: "))

start_col 	= (i * 3)
mid_col 	= (i * 3) + 1
end_col 	= (i * 3) + 2

#####  read through MASTER file #####
MASTERCOUNTS = open('/Users/nicolestone/Desktop/20170503_atac.rc/masterPeaks.FIB.bed.annotatedCounts.txt')
#MASTERCOUNTS = open('/Users/nicolestone/Desktop/20170503_atac.rc/masterPeaks.FIBC.bed.annotatedCounts.txt')

MASTERline_count = 0
printcount = 0

for line in MASTERCOUNTS:
	MASTERline_count += 1 # line count
#	print "Reading line#:", MASTERline_count
	
	if (MASTERline_count == 1):
	 	MASTERline = line.rstrip('\n').split("\t") # split on tabs
	 	HEADERfilename = MASTERline[start_col].split(".") # split on periods
	 	
	 	#outfilename = "/Users/nicolestone/Desktop/20170418_ATAC.rc/"+HEADERfilename[4]+".atac.rc.txt"
		#outfile = open(outfilename, 'w')
		outfile = open("rc.FIB.txt", 'w')
		#outfile = open("rc.FIBC.txt", 'w')

	if (MASTERline_count > 1):
	 	MASTERline = line.rstrip('\n').split("\t") # split on tabs
	 	
		
		REPCOUNT = 0
		R1 = int(MASTERline[start_col])
		R2 = int(MASTERline[mid_col])
		R3 = int(MASTERline[end_col])
		if (R1 > 0):
			REPCOUNT += 1
		if (R2 > 0):
			REPCOUNT += 1
		if (R3 > 0):
			REPCOUNT += 1
			
		if (REPCOUNT > 1):
			outfile.write(line)
			
			printcount += 1
			if (printcount == 1):
				print "\n"+"!!!Found some data you want!!!"+"\n\n"
			if (printcount < 10):
				#print line
				print MASTERline[0]+"\t"+MASTERline[1]+"\t"+MASTERline[2]+"\t"+MASTERline[start_col]+"\t"+MASTERline[mid_col]+"\t"+MASTERline[end_col]
					
print "\n\n"
outfile.close()
MASTERCOUNTS.close()

