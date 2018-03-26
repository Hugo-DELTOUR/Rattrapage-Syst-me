#!/bin/bash
#Changement adresse IP

echo "Adresse IP de la machine :"
read IP

sed -i "13 s|.*|	address	$IP|" /etc/network/interfaces

echo "Bravo vous avez changé votre adresse IP"
exit 0
