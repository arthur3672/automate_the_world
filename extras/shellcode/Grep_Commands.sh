# Greps the first OR second string, and get the file count
grep "SSLv2:\|SSLv3:" * | wc -l;
echo "===========================================";
# Greps the file that does not match a certain string
grep -L "SSLv2:\|SSLv3:" * | wc -l;
echo "===========================================";
# List the files that matches a certain string
grep "SSLv2:\|SSLv3:" * 
echo "===========================================";
# List the files that does not match a certain string
grep -L "SSLv2:\|SSLv3:" *
echo "===========================================";
