#!/bin/fish
set prompt "Removable drives"
set choice (lsblk -no kname,label,size| awk '$1 ~ /sd[b-z][0-9]/ {printf "%-7s %-10s %-7s\n", $1, $2, $3}' |
    rofi  -i  -dmenu  -no-custom  -p $prompt)
# echo $choice
set props (echo $choice | sed -e "s/\s\+/\n/g")
set label (echo $props[2])
set kname (echo $props[1])
# echo $kname
set mntpt ( lsblk -no kname,label,mountpoint | awk -v l=$label -v n=$kname '$1 ~ kname && $2 ~ l {print $3}' )
if [ -n $mntpt ]
    echo "Already mounted at "$mntpt
else
    set mntroot "/run/media/abhirup"
    sudo mkdir -p "$mntroot/$label"
    sudo mount /dev/"$kname" "$mntroot/$label"
    # echo $kname $label
end
