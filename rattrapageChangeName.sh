#!/bin/bash

#Modification du nom de la machine
echo "Nom de la machine"
read nom_machine

sed -i "1 s|.*|$nom_machine|" /etc/hostname

exit 0
