#!/bin/bash
x=$(pamixer --get-volume);
if [ $x -lt 5 ]
then
    volnoti-show $x;
else
    pactl set-sink-volume 0 -5%;
    x=$(($x-5))
    echo $x
    volnoti-show $x
fi
