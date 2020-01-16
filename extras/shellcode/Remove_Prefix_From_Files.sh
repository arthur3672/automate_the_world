# This removes all letters before the _ character (including)
FILES=*; for f in $FILES; do temp=$(echo "$f" | perl -pe 's/.*?_//'); echo $temp;mv $f $temp;done
