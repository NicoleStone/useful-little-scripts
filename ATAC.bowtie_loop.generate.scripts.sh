### MAKE SCRIPTS TO RUN BOWTIE ON ALL ATAC-SEQ FASTQ IN A DIRECTORY ###
###
WORKING="/data/home/nstone/HiSeq4000_data/NS16"
cd $WORKING
multimapping=4
pair_dist=600
OUTDIR=$WORKING
bwt2_idx="/data/info/genome/mm9_ensembl_igenome_with_chr/mm9.chr"

for x in  *R1_001.fastq.gz; do 
	basefilename=`echo $x | sed 's/_R1_001.fastq.gz//'`
	fastq1=$basefilename'_R1_001.fastq.gz' #same as x (redundant but whatevs!)
	fastq2=$basefilename'_R2_001.fastq.gz' 
	log=$basefilename'.log.txt'
	#MAPSAM=$basefilename'.mapped.sam'
	ALLSAM=$basefilename'.everything.sam'
	filecmds=$basefilename'_cmds_bowtie.sh'
	
	echo 'bowtie2 --threads=4 --mm -x' $bwt2_idx' -X' $pair_dist' --no-mixed --no-discordant -1 '$fastq1 ' -2 ' $fastq2 '-S' $ALLSAM '2>'$log > $filecmds
qplz --background -c 4 -t 99 $filecmds

done

###