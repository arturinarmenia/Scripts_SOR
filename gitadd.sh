#!/bin/bash
git add $1
git commit -a -m "add $1"
git push -u $origen master
if [ "$2" == "github" ]; then
	origen=origin
else
	if [ "$2" == "bitbucket" ]; then
		origen=originbit
	else
		if [ "$2" == "" ]; then
			origen=origin
		else
			echo "Parametros incorrectos"
			return 0
		fi
	fi
fi
