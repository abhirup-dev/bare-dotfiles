#!/bin/bash
if  command -v i3-layout-manager > /dev/null ; then
    layouts=$(ls ~/.layouts | grep "layout.*json" | sed -nr 's/layout-(.*)\.json/\1/p' | sed 's/\s/\n/g')
    option=$(echo $layouts | sed 's/ /\n/g' | rofi -dmenu -p "select")

    i3-layout-manager $option
else
    echo "i3-layout-manager executable not found!"
fi
