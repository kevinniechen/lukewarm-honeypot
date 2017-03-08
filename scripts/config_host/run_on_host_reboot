#!/bin/bash

sudo brctl addif br0 veth101.0
sudo brctl addif br0 veth102.0
sudo brctl addif br0 veth103.0
sudo brctl addif br0 veth104.0

ipconfigure_honssh 101 201
ipconfigure_honssh 102 202
ipconfigure_honssh 103 203
ipconfigure_honssh 104 204

sudo /etc/rc.firewall
