#!/bin/bash

#Checks the IP address from ip.txt (from previously run script or initial run) and compares it with the current IP address. If different, uses Pushover API to send new IP to all devices

OLDIP=$(cat /home/user/ip.txt)
IP=$(wget http://ipinfo.io/ip -qO -)
URL="https://api.pushover.net/1/messages.json"
APP_KEY="aaaabbbbccccdddd1111"
USER_KEY="eeeeffffgggghhhh2222"

if [ "$OLDIP" != "$IP" ]
then
    curl -s --data token=$APP_KEY --data user=$USER_KEY --data-urlencode title="Notification" --data priority=0 --data-urlencode message="Your new IP is $IP" $URL > /dev/null 2>&1
    echo "$IP" > /home/user/ip.txt
fi
