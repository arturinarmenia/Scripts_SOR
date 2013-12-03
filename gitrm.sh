#!/bin/bash
git rm $1 
git commit -a -m "Borrado el Fichero $1"
git push -u origin master
