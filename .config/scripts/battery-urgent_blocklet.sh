#!/bin/bash
btmod=/usr/local/libexec/i3blocks/battery
thresh=20
# msg="⚡"
msg=""
curr=($($btmod | awk -F"[ %]" 'NR==1{print $1" "$3}'))
# echo $curr
charge=${curr[0]}
stat=${curr[1]}
# echo $charge"+"$stat
if [[ $charge -lt $thresh && $stat == "DIS" ]]
then
    echo $msg
fi

