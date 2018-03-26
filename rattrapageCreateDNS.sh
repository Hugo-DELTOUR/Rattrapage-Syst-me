#!/bin/bash

#Création d'un DNS cesi.local

sed -i "2 s|.*|127.0.1.1	www.cesi.local" /etc/hosts
echo "127.0.1.1		dns1.cesi.local" >> /etc/hosts
echo "192.168.1.230	www.cesi.local" >> /etc/hosts
echo "192.168.1.230	dns1.cesi.local" >> /etc/hosts



#Création de la zone pour cesi.local
echo 'zone "cesi.local" { type master; file "/etc/bind/db.cesi.local"; forwarders{};};' >> /etc/bind/named.conf.local
echo '$TTL 10800' >> /etc/bind/db.cesi.local
echo '$ORIGIN cesi.local' >> /etc/bind/db.cesi.local
echo '@		IN SOA  dns1.cesi.local. root.cesi.local.(20160505;3h;1h;1w;1h);' >> /etc/bind/db.cesi.local
echo '@		IN NS 	dns1.cesi.local' >> /etc/bind/db.cesi.local
echo 'dns1	IN A	192.168.1.230' >> /etc/bind/db.cesi.local
echo 'www	IN A	192.168.1.230' >> /etc/bind/db.cesi.local

#Création de la zone inverse
echo 'zone "1.168.192.in-addr.arpa"{ type master; file "/etc/bind/db.1.168.192.in-addr.arpa"; forwarders{};};' >> /etc/bind/named.conf.local
echo '$TTL 10800' >> /etc/bind/db.1.168.192.in-addr.arpa
echo '$ORIGIN 1.168.192.in-addr.arpa' >> /etc/bind/db.1.168.192.in-addr.arpa
echo '@		IN SOA  dns1.cesi.local. root.cesi.local. (20160505;3h;1h;1w;1h);' >> /etc/bind/db.1.168.192.in-addr.arpa
echo '@		IN NS	dns1.cesi.local' >> /etc/bind/db.1.168.192.in-addr.arpa
echo '230	IN PTR	dns1.cesi.local' >> /etc/bind/db.1.168.192.in-addr.arpa
echo '230	IN PTR	www.cesi.local' >> /etc/bind/db.1.168.192.in-addr.arpa

exit 0

