# This renames all files in directory with the prefix specified as the first bash argument (eg ./Rename_All_Files_With_Prefix.sh 123_ --> 192.168.1.10_233.txt becomes 123_192.168.1.10_233.txt)
FILES=*; for f in $FILES; do mv $f $1$f;done
