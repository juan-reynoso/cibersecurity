#!/bin/bash


while true; do

 target=$(netstat -tapn |awk '{print $5}' |grep -E ^[0-9] |cut -d: -f1|sort|uniq -c|sed -r 's/^[[:space:]]+//g' |sort -k1 -n -r |head -1)


 number_of_connections=$(echo "$target" | awk  '{print $1}')
 ip_target=$(echo "$target" | awk  '{print $2}')


echo "Numero de conexiones: $number_of_connections"
echo "IP target: $ip_target"



if [ $number_of_connections  -gt 99 ]; then
    echo "Bloquear IP"
else
    echo "Todo bien"
fi

   sleep 30
done
