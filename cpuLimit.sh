#!/bin/bash
cat << EOF > ~/runLimit.sh
#/bin/bash
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
                echo ${arr[1]} > cpulimit.log
                cpulimit -p ${arr[1]} -l  10 &
                IFS="$OIFS"
        done
        sleep 30
done
EOF
chmod 777 ~/runLimit.sh
nohup ~/runLimit.sh mochimo & > limit.log


