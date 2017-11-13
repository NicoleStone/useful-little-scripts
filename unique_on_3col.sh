FILE="bed.plus.more.txt"
awk -F"\t" '!uniq[$1 FS $2 FS $3]++' $FILE > $FILE.unique.txt
