#bin/bash!
usuario=$1
grupo=$(cat /etc/group | grep -P "^$usuario:" | cut -d ":" -f4 )
if [ "$usuario" == "" ]; then
 echo "Escriba un usuario correcto"
else
 echo "$grupo"
fi
