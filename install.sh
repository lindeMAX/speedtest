#!/bin/sh


workingDir=$(pwd)
systemdPath="/etc/systemd/system"

### Setup systemd timer and service
echo "Installing systemd timer and service..."
# copy speedtest.timer to the systems systemd path
cp systemd/speedtest.timer $systemdPath/
# copy speedtest.service to the systems systemd path AND set the working directory for the script
cat systemd/speedtest.service | sed "s|path|$workingDir|g" > $systemdPath/speedtest.service
# enable
systemctl enable speedtest.timer
systemctl enable speedtest.service
# start
systemctl start speedtest.timer
systemctl start speedtest.service

echo "Done!"
