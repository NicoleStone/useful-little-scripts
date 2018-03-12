#compress peaks

cd /data/home/nstone/20170403_ATAC.align.final/peaks

for f in *.bed; do sort-bed $f | bzip2 --stdout > $f.finished.bz2; done

for f in *.bdg; do sort-bed $f | bzip2 --stdout > $f.finished.bz2; done
