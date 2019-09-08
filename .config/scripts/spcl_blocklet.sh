#!/bin/bash
player=$SCRIPTS/spcl
case $BLOCK_BUTTON in
    1) $player play ;; # left click
    4) $player next ;; # scroll up
    5) $player prev ;; # scroll down
esac

if $player status | grep 'Paused' > /dev/null; then
    printf '\xef\x81\x8c ' # fa-pause
else
    printf '\xef\x81\x8b ' # fa-play
fi
$player current-oneline
