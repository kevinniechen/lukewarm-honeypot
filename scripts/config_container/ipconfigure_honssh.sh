#!/bin/bash

if [ $# != 2 ]
then
	echo "Usage: iptables_for_honssh honssh_container_id honeypot_container_id"
	exit 1
fi

sudo vzctl exec $1 iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
sudo vzctl exec $1 iptables -A FORWARD -i eth1 -o eth0 -m state --state RELATED,ESTABLISHED -j ACCEPT
sudo vzctl exec $1 iptables -A FORWARD -i eth0 -o eth1 -j ACCEPT
sudo vzctl exec $1 ifup eth0
sudo vzctl exec $1 ifup eth1
sudo vzctl exec $2 ifup eth0
