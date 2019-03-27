telnet_generator.sh
This is the bash script to automatically generate the scripts for the servers to be telnetted to and from. Edit/refer to the telnet_list.csv file to match the list of servers to telnet to. 

Instructions:
1. Edit the telnet_list.csv to populate the .csv file with the list of IPs and ports to be telnetted from each servers.
2. Run telnet_generator.sh (simply double click it on Windows, or sh telnet_generator.sh)
3. filename.sh files will be generated if the telnet_list.csv is populated correctly. 
4. Move the filename.sh file into the respective server to be run.