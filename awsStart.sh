#!/bin/bash
##usage
## curl -sSL https://raw.githubusercontent.com/JoeY34kaze/mochimo/master/awsStart.sh | bash 
## A.B. 2018
git clone https://github.com/JoeY34kaze/mochimo
chmod -R a+rwx mochimo

cat << EOF > ~/runminer.sh
#/bin/bash
cd mochimo/mochi/bin/
~/mochimo/mochi/bin/gomochi d -t3 >> ~/mochi.log
EOF
chmod 777 ~/runminer.sh
screen -dmS Miner -c `~/runminer.sh`
