#!/bin/bash

i=0
echo "$USER@$HOSTNAME"
while [ $i -ne $((${#USER} + ${#HOSTNAME} + 1)) ]; do
    echo -n "-"
    i=$(($i+1))
done
echo ""
echo "OS: $OSTYPE"
echo "Kernel: $(uname -r)"
echo "Uptime:$(uptime)"
echo "Shell: $(bash --version | cut -d$'\n' -f1)"
echo -n "CPU: "
y=3
while [ 1 ]; do
    i=$(cat /proc/cpuinfo | grep "model name" -m1 | cut -d' ' -f$y)
    if [ -z $i ]; then
        break
    fi
    echo -n "$i "
    y=$(($y+1))
done
echo ""
echo -n "Memory: "
z=$(cat /proc/meminfo | grep MemTotal -m1 | tr -s ' ' | cut -d' ' -f2)
z=$(($z/1024))
k=$(cat /proc/meminfo | grep MemAvailable -m1 | tr -s ' ' | cut -d' ' -f2)
k=$(($k/1024))
echo "$k Mib / $z MiB"