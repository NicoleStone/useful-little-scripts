for f in *.bed; do awk '{OFS="\t"} { print $1, $2, $3 }' $f > $f.threecol.bed; done
