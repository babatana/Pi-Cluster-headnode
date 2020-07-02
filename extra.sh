# Test connection to node
ping -c 1 -W 2 $SERVERIP &> /dev/null
if [[ $? != 0 ]]
then
    logger "Could not connect to server"
    exit 2
fi
