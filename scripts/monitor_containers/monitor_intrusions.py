#!/usr/bin/python

"""
HACS102 OpenVZ Container Recycle Script
Kevin Chen

Script will wait until first container gets an attacker
then executes a script
"""

import os
import subprocess
import time
from multiprocessing import Process

# PATH NAMES
root = "/var/lib/vz/root/"
containers = ["101/", "102/", "103/", "104/"]
relative_path = "/honssh/logs/honssh.log"

def monitor(container):

    active = False

    with open(os.path.join(root + container + relative_path)) as f:
        while True:
                
            line = f.readline()

            if line:
                if "password match" in line:
                    connected = True
                    active = True
                    print("Container " + container " Log: " + line)
                    print("Connection!")

                if active:
                    print("Execute script after 3600s!")

                    # reset variables
                    active = False

                    # execute recycle script (that will wait 3600s)
                    time.sleep(3600)
                    subprocess.call("/shared/scripts/recycle_container/recycle 2" + container[1:3], shell=True)

if __name__ == '__main__':
    for container in containers:
        Process(target=monitor(container)).start()

