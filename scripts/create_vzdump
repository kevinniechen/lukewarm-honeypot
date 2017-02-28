#!/bin/bash

if [ $# != 1 ]
then
    echo "Usage: create_vzdump container_id"
    exit 1
fi

sudo vzctl stop $1
sudo vzdump --compress $1
sudo vzctl start $1
