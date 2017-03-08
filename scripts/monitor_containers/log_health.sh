#!/bin/bash
#TODO Add column for number of compromises

if [ $# != 1 ]; then
   echo "Usage: log_data Host/container_id"
   exit 1
fi

time=$(date)

if [ $1 == "Host" ]; then
   disk=$(df -m | awk -F " " '{print $3}' | head -n2 | tail -n1)
   memory=$(free -m | awk -F " " '{print $3}' | head -n2 | tail -n1)
   load1=$(uptime | awk -F "load average: " '{print $2}' |awk -F " " '{print $1}' | cut -d',' -f1)
   load5=$(uptime | awk -F "load average: " '{print $2}' | awk -F " " '{print $2}' | cut -d',' -f1)
   load15=$(uptime | awk -F "load average: " '{print $2}' | awk -F " " '{print $3}')
   compromises="Host: N/A"
   log -k "/shared/HACS Group 1H-342adb336467.json" -s "https://docs.google.com/spreadsheets/d/1zbpgSaftlirRkyR6TC-KDnwT0fyXbANy8KriHwDacgw/edit#gid=0" -d "Host, $time, $disk, $memory, >>>, $load1, $load5, $load15, $compromises"
else
   # Check if container is running
   stat=$(sudo vzlist $1 | awk -F " " '{print $3}' | grep -v "STATUS")
   compromises="HonSSH Container: N/A"

   if [ $1 == "201" -o $1 == "202" -o $1 == "203" -o $1 == "204" ]; then
		compromises=$(cat /shared/counter/$1.count)
   fi

   if [ $stat != "running" ]; then
      log -k "/shared/HACS Group 1H-342adb336567.json" -s "https://docs.google.com/spreadsheets/d/1zbpgSaftlirRkyR6TC-KDnwT0fyXbANy8KriHwDacgw/edit#gid=0" -d "Container $1, $time,,,,,,, $compromises, $stat"
   else
      disk=$(sudo vzctl exec $1 df -m | awk -F " " '{print $3}' | head -n2 | tail -n1)
      memory=$(sudo vzctl exec $1 free -m | awk -F " " '{print $3}' | head -n2 | tail -n1)
      load1=$(sudo vzctl exec $1 uptime | awk -F "load average: " '{print $2}' | awk -F " " '{print $1}' | cut -d',' -f1)
      load5=$(sudo vzctl exec $1 uptime | awk -F "load average: " '{print $2}' | awk -F " " '{print $2}' | cut -d',' -f1)
      load15=$(sudo vzctl exec $1 uptime | awk -F "load average: " '{print $2}' | awk -F " " '{print $3}')
      log -k "/shared/HACS Group 1H-342adb336467.json" -s "https://docs.google.com/spreadsheets/d/1zbpgSaftlirRkyR6TC-KDnwT0fyXbANy8KriHwDacgw/edit#gid=0" -d "Container $1, $time, $disk, $memory, >>>, $load1, $load5, $load15, $compromises, $stat"
   fi
fi
