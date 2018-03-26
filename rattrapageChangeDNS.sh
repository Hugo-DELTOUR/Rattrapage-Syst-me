#!/bin/bash
#IP DNS
echo "IP du DNS:"
read IP

#Changement DNS
sed -i "3 s|.*|nameserver $IP|" /etc/resolv.conf

exit 0
