#!/bin/bash
usuario=$1
if [ "$usuario" == "" ]; then
    echo "escribe un usuario"
else
    echo "Añadiendo el Usuario $usuario"
    useradd $usuario
    echo "Creando Directorio personal en /home/$usuario"
    mkdir /home/$usuario
    chown $usuario:$usuario /home/$usuario
    echo "Copiando ficheros de /etc/skel"
    cp /etc/skel /home/$usuario
    echo "Escriba la contraseña del Usuario $usuario"
    passwd $usuario
    echo "Esciba la configuracion de $usuario"
    echo -n "Nombre Completo "
    read
    echo -n "Ciudad "
    read
    echo -n "Telegono del Trabajo "
    read
    echo -n "Telefono de Casa "
    read
    echo -n "otra infomacion "
    read
    echo -n "¿Es correcta esta informacion? [S/n] "
    read respuesta
    if [ "$respuesta" == "S" ]; then
        : 
    else
        if [ "$respuesta"  == "n" ]; then
            echo "Cancelando cracion de Usuario"
            userdel $usuario
            rm -R -f /home/$usuario
        else
            echo "Respuesta erronea se tomara como afirmativa"
        fi
    fi
fi
