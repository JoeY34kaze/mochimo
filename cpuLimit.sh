#!/bin/bash
apt-get install cpulimit -y
touch joe
while /bin/true;do
        pkill cpulimit
        rm joe
        touch joe
        chmod 777 joe
        ps aux | grep $1 > joe
        IFS=$'\n'
        line_no=$(wc -l < joe)
        set -f
        for i in $(cat < joe); do
                OIFS="$IFS"
                IFS=' '
                read -a arr <<< "${i}"
                echo ${arr[1]} >> cpuLimit.log
                cpulimit -p ${arr[1]} -l  20 &
                IFS="$OIFS"
        done
        sleep 5
done


