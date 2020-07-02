NUMNODES=15 
LINES=`fping -q -c1 -g 10.0.0.2 10.0.0.254 2>&1 | grep -m $NUMNODES --color="never" "min/avg/max" | sed 's/ \+/_/g'`
IPS=`for line in $LINES; do echo $line | cut -d '_' -f 1; done`
NUMIPS=`echo $IPS | wc -w`
