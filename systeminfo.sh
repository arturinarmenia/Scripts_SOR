#!/bin/bash
valor=$1
if [ "$valor" == "" ]; then
  echo "por favor introduzca uno de los siguientes valores"
  echo "[-cpumodel | -ramMB | -cacheMB | -ramocupadaMB]"
else
  if [ "$valor" == "-cpumodel" ]; then
    busca=$(cat /proc/cpuinfo | grep -P "^model name" | cut -d":" -f2)
  else
    if [ "$valor" == "-ramMB" ]; then
      encuentra=$(cat /proc/meminfo | grep -P "^MemTotal:" | cut -d":" -f2 | cut -c1-15)
      division=$[$encuentra/1024]
      busca="$division MB"
    else
      if [ "$valor" == "-cacheMB" ]; then
        encuentra=$(cat /proc/cpuinfo | grep -P "^cache size" | cut -d":" -f2 | cut -c2-5)
        division=$[$encuentra/1024]
        busca="$encuentra MB"
      else
        if [ "$valor" == "-ramocupadaMB" ]; then
          libre=$(cat /proc/meminfo | grep -P "^MemFree:" | cut -d":" -f2 | cut -c1-15)
          total=$(cat /proc/meminfo | grep -P "^MemTotal:" | cut -d":" -f2 | cut -c1-15)
          division=$[($total-$libre)/1024]
          busca="$division MB"
        fi
      fi
    fi
  fi
  echo "el resultado de $valor es $busca"
fi
