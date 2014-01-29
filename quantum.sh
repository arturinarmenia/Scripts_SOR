#bin/bash!
pid=$1
nice1=$(ps -eo pid,nice | grep "^ *$pid" | cut -c6-10)
q1=$[(20-$nice1)*20]
q2=$[(20-$nice1)*5]
if [ $q1 -ge "0" ]; then
  q=$[(20-$nice1)*5]
else
  q=$[(20-$nice1)*20]
fi
echo $q
