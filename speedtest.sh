#!/bin/sh

echo "Sarting new scan..."

#path="/root/Speedtest"
path=$1

# Run the speedtest (https://raw.githubusercontent.com/sivel/speedtest-cli/master/speedtest.py)
if python $path/speedtest.py --csv >> $path/log/speedtest_results.csv;
then
   # Scan LAN for active devices
   echo "Searching for active LAN-devices..."
   nmap -sn 192.168.2.0/24 | egrep 'report|Starting' >> $path/log/lan_devices.txt
else
   e=$?; echo "$@" > /dev/stderr
   exit 1
fi

echo "Done!"

exit 0
