LINES=`fping -a -c1 -t500 -g 172.27.1.1 172.27.1.254 2>&1 | grep --color="never" "min/avg/max" | sed 's/ \+/_/g'`

for lines in $LINES
do 
    echo $line | cut -d ' ' -f 
done 
