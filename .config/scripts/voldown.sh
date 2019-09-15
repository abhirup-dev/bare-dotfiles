#!/bin/bash
x=$(pamixer --get-volume);
pactl set-sink-volume 0 -5%;
x=$(($x-5))
echo $x
if [ $x -gt 100 ]
then
    volnoti-show 100;
else
    volnoti-show $x;
fi
