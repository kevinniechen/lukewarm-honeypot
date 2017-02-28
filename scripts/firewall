#!/bin/bash

#COLOR CODEY
RED=`tput setaf 1`
GREEN=`tput setaf 2`
RESET=`tput sgr0`

NO_FIREWALL=\
"Chain INPUT (policy ACCEPT * packets, * bytes)
 pkts bytes target     prot opt in     out     source               destination
 
Chain FORWARD (policy ACCEPT * packets, * bytes)
 pkts bytes target     prot opt in     out     source               destination
  
Chain OUTPUT (policy ACCEPT * packets, * bytes)
 pkts bytes target     prot opt in     out     source               destination"

STATE=`(sudo iptables -L -n -v)`

diff -ZBb -I ^Chain <(echo "$NO_FIREWALL") <(echo "$STATE") > /dev/null 2>&1
if [ $? -eq 0 ]; then
    echo "${RED}FIREWALL DOWN!!!${RESET}"
    exit 1
else
    echo "${GREEN}FIREWALL RUNNING${RESET}"
    exit 0
fi
