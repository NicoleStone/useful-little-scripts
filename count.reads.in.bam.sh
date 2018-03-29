cd /data/home/nstone/20180108_chip.figure.bams/bam.rmdup.sorted

for f in *rem_dups.sort.bam; do echo -n "$f   " ; samtools view $f | wc -l ; done >> count.reads.in.chip.bam.txt
