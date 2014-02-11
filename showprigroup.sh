#!/bin/bash
usuario=$1
idgrupo=$(cat /etc/passwd | grep -P "^$usuario:" | cut -d ":" -f4 )
grupo=$(cat /etc/group | grep -P "$idgrupo" | cut -d ":" -f1)

if [ "$grupo" == "" ]; then
	echo "Error"
else
	echo "$grupo"
fi
