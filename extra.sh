read mpi_command
# mpirun np 4 test.exec

NUMNODES=`echo $mpi_command | cut -d ' ' -f 3`

LINES=`fping -q -c1 -g 172.27.1.3 172.27.1.254 2>&1 | grep -m $NUMNODES --color="never" "min/avg/max" | sed 's/ \+/_/g'`
IPS=`for line in $LINES; do echo $line | cut -d '_' -f 1; done`
NUMIPS=`echo $IPS | wc -w`

if [ $NUMNODES \=< $NUMIPS ]
then 
    rest_of_command=`cut -d ' ' -f 4-`
    mpirun -np $NUMNODES rest_of_command 
else 
    echo "ERROR: There aren't enough nodes available"
fi




