#!/bin/bash
# term=st
DIR=$(cat /tmp/whereami)
PWD=$DIR
if [[ $TERMINAL =~ \/.*\/termite ]]
then
    $TERMINAL --directory="$DIR"
elif [[ $TERMINAL =~ \/.*\/alacritty ]]
then
    $TERMINAL --working-directory "$DIR"
fi
