####################################################################################
# run_GEO_md5_checksum_loop.sh
# Written by Nicole Stone 20190912
#
# These three lines of code run md5 checksum on all files with *.fastq in your directory
# and spits out a file with your md5 codes listed, ready to include in your GEO metadata
#
# This command works on a mac. Google how to run it on a windows machine if you need to.
#
####################################################################################

# First, in the terminal, navigate to the directory containing your files of interest
# Replace FILENAME.txt below with your preferred output file name
# Replace .fastq with whatever file type you want to run this on
# Paste the below lines into your terminal and run it!


OUTSUMMARYFILE="FILENAME.txt" 	# Replace FILENAME on this line
touch $OUTSUMMARYFILE 			# Creates a new blank file
for f in *.fastq; do md5 $f >> $OUTSUMMARYFILE; done 
