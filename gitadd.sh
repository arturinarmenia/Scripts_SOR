#!/bin/bash
git add $1
git commit -a -m "add $1"
git push -u origin master
