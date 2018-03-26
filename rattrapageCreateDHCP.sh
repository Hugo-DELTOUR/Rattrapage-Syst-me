#!/bin/bash

#Installation serveur DHCP
apt-get install isc-dhcp-server

#Creation d'une etendue DHCP
echo "option domain-name 'rattrapagefr';
default-lease-time 86400;
max-lease-time 604800;
subnet 192.168.1.0 netmask 255.255.255.0{
range 192.168.1.100 192.168.1.200;
option subnet-mask 255.255.255.0;
option broadcast-address 192.168.1.255;
}" >> /etc/dhcp/dhcpd.conf

exit 0
