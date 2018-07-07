#!/bin/bash
##usage
## curl -sSL https://raw.githubusercontent.com/JoeY34kaze/mochimo/master/LimitFix.sh | bash 
## A.B. 2018
pkill mochimo
rm mochi.log
rm runminer.sh
rm -r mochimo -f
git clone https://github.com/JoeY34kaze/mochimo
chmod -R a+rwx mochimo
nohup ~/mochimo/cpuLimit.sh mochimo &

cat << EOF > ~/runminer.sh
#/bin/bash
cd mochimo/mochimo/mochi/bin/
~/mochimo/mochimo/mochi/bin/gomochi d -t3 >> ~/mochi.log
EOF
chmod 777 ~/runminer.sh
screen -dmS Miner -c `~/runminer.sh`
