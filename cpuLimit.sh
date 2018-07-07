#!/bin/bash
while /bin/true;do
        pkill cpulimit
        rm joe
        touch joe
        chmod 777 joe
        ps aux | grep $1 | grep -v cpulimit | grep -v grep | grep -v a.sh  > joe
        IFS=$'\n'
        line_no=$(wc -l < joe)
        set -f
        for i in $(cat < joe); do
                OIFS="$IFS"
                IFS=' '
                read -a arr <<< "${i}"
                echo ${arr[1]} > cpulimit.log
                cpulimit -p ${arr[1]} -l  10 &
                IFS="$OIFS"
        done
        sleep 30
done

