

WorkerIp=
ping -c 1 -W 2 $WorkerIp &> /dev/null
if [[ $? != 0 ]]
then
    logger "Could not connect to server"
    exit 2
fi
