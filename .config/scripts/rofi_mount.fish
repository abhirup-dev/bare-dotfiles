#!/bin/fish
set prompt "Removable drives"
set choice (lsblk | grep -v "sda" | sed -n "s/\(|\|`\)-//gp" | awk '{print $1" ("$4") "$7}' |
    rofi  -i  -dmenu  -no-custom  -p $prompt)
set props (echo $choice | sed "s/ /\n/g")
# echo $props[1]"--"$props[2]"--"$props[3]
if [ -n $props[3] ]
    echo "Already mounted at "$props[3]
end
