 _       _                                      
| |_   _| | _______      ____ _ _ __ _ __ ___   
| | | | | |/ / _ \ \ /\ / / _` | '__| '_ ` _ \  
| | |_| |   <  __/\ V  V / (_| | |  | | | | | | 
|_|\__,_|_|\_\___| \_/\_/ \__,_|_|  |_| |_| |_| 
                                                
 _                                          _   
| |__   ___  _ __   ___ _   _   _ __   ___ | |_ 
| '_ \ / _ \| '_ \ / _ \ | | | | '_ \ / _ \| __|
| | | | (_) | | | |  __/ |_| | | |_) | (_) | |_ 
|_| |_|\___/|_| |_|\___|\__, | | .__/ \___/ \__|
                        |___/  |_|              

# An SSH-honeypot system built off OpenVZ containers and HonSSH
Note: The documentation is extremely lacking because this project is still in progress (and is mostly just a collection of shell and python scripts).

### TODO ###
- Set up data compilation script
- Create container specific password setup script

### NOTES ###
- HonSSH is installed on containers 101, 102, 103, 104
- Honeypot containers will be 201, 202, 203, 204
- Internet works on HonSSH containers, but not on honeypot containers
- Do NOT DELETE any containers :>
- Do NOT change the name/permissions of Announcements or shared/
- If you break your symlinks run "ln -s /Announcements; ln -s /shared"
- shared/scripts is under git version control

Built by Yeojun Yoon, Kenneth Jiang and Kevin Chen
