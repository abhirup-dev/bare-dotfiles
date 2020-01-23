#!/bin/bash
mkdir ~/.bash_completion.d
curl "https://raw.githubusercontent.com/rupa/z/master/{z.sh}" \
    -o ~/.bash_completion.d/"#1"
curl "https://raw.githubusercontent.com/changyuheng/fz/master/{fz.sh}" \
    -o ~/.bash_completion.d/z"#1"

sudo apt-get install xdotool
