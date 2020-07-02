LINES = `fping -a -c1 -t500 -g 172.27.1.1 172.27.1.254 2>&1 | grep --color="never" "min/avg/max"`

for lines in $LINES
do 
    echo $line | cut -d ' <space>' -f <field number>
done 
