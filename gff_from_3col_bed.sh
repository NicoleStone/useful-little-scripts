

#!/bin/bash

#making gff for featureCounts input from ChIP-seq peak set, not for genome annotation
for f in masterPeaks_*; do awk -F"\t" '{print $1 "\t" "method" "\t" "exon" "\t" $2 "\t" $3 "\t" "." "\t" "." "\t" "." "\t" "group" }' $f > $f.gff.txt; done


