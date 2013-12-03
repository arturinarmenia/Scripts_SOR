#!/bin/bash
git add $1
git commit -a -m "creado bucket $1"
git push -u originbit master
