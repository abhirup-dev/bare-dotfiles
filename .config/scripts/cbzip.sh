#!/bin/bash
cp ~/Downloads/comics/Tux-header.png $1/0.png
find $1 -regex ".*jpeg\|.*jpg\|.*png" -print | zip --quiet -m $2.cbz -@
if [[ ! -z $3 ]] && [[ $3 == "del" ]]
then
    echo "To delete type: rm -rf $1"
    rm -rf $1
fi
