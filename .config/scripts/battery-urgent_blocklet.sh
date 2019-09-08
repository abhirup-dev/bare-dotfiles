#!/bin/bash
btmod=/usr/local/libexec/i3blocks/battery
thresh=15
msg="⚡"
# msg="Battery Low "
curr=$($btmod | sed -nre 's/^([0-9]{1,2})%.*/\1/p' -e 1q)
# echo $curr
if [ $curr -lt $thresh ]
then
    echo $msg
fi

