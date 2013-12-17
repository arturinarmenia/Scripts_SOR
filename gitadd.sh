#!/bin/bash
git add $1
git commit -a -m "add $1"
git push $origen master
if [ "$2" == "github" ]; then
	origen=origin
else
	if [ "$2" == "bitbucket" ]; then
		origen=originbit
	else
		echo "introduce github o bitbucket"
		exit 1
	fi
fi
