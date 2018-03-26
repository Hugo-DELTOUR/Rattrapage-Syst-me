#!/bin/bash

# installation Bind9
apt-get install bind9
# installation Apache2
apt-get install apache2 apache2-mpm-prefork apache2-prefork-dev libapr1-dev libaprutil1-dev libfcgi-dev libssl-dev zlib1g-dev libcurl4-openssl-dev
#installation DHCP
apt-get install isc-dhcp-server

echo "Installation terminer !"

exit 0
