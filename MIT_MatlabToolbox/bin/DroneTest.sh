#!/bin/bash

# 1. change folder to where this script is
cd `dirname $0`

# 2. Telnet into drone, adjust PowerGain in paramsEDU.dat and start the SpiderFlight.sh
# send "sed -i \"s/POWERGAIN : \[1-9\]\[0-9\]*;/POWERGAIN : 10;/\" /data/edu/params/paramsEDU.dat\r";
# send "sed -i \"s/POWERGAIN : \[0-9\]*;/POWERGAIN : 0;/\" /data/edu/params/paramsEDU.dat\r";
/usr/bin/expect <<SCRIPT
set timeout -1;
spawn telnet 192.168.1.1;
expect "RS.edu] \$ ";
send "sed -i \"s/POWERGAIN : \[0-9\]*;/POWERGAIN : 0;/\" /data/edu/params/paramsEDU.dat\r";

expect "RS.edu] \$ ";
send "sed -i \"s/FEAT_NOSAFETY : \[0-1\];/FEAT_NOSAFETY : 1;/\" /data/edu/params/paramsEDU.dat\r";

expect "RS.edu] \$ ";
send "killall dragon-prog\r"; expect "RS.edu] \$ ";
send "SpiderFlight.sh\r";
expect "RS.edu] \$ ";
send "exit\r";
expect eof
SCRIPT
