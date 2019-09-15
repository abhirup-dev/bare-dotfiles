#!/bin/bash
url=$1
pat1="blob\/master"
if [[ $url == *$pat1* ]]
then
    echo match
    url=$(echo $url | sed "s/$pat1/trunk/")
fi
echo "Fetching from: "$url
svn export $url
