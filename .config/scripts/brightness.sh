#!/bin/bash
bfile=/sys/class/backlight/intel_backlight/brightness
curr=$(cat $bfile)
new=$curr
if [ $1 == "up" ]
then
    new=$((curr + 40))
elif [ $1 == "down" ]
then
    new=$((curr - 40))
fi
sudo echo $new > $bfile
