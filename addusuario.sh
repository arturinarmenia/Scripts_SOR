#!/bin/bash
if [ "$1" == "" ]; then
echo "escribe un usuario"
else
useradd $1
mkdir /home/$1
chown $1:$1 /home/$1
passwd $1
fi
