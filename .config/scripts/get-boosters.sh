#!/bin/bash
fzf_complete(){
    mkdir ~/.bash_completion.d
    curl "https://raw.githubusercontent.com/rupa/z/master/{z.sh}" \
        -o ~/.bash_completion.d/"#1"
    curl "https://raw.githubusercontent.com/changyuheng/fz/master/{fz.sh}" \
        -o ~/.bash_completion.d/z"#1"
}

sudo apt-get install xdotool

# Coloured Bash Prompt
bold=$(tput bold)
red=$(tput setaf 1)
green=$(tput setaf 2)
blue=$(tput setaf 4)
magenta=$(tput setaf 5)
yellow=$(tput setaf 3)
reset=$(tput sgr0)
undl=$(tput smul)
rmundl=$(tput rmul)
logger(){
    echo \[$green\]"$1"\[$reset\]
}

get_fonts(){
    # Sources
    #   1. https://www.rogerpence.com/posts/install-source-code-pro-font-on-ubuntu

    DEST=~/Downloads/fonts
    mkdir -pv $DEST
    wget https://github.com/adobe-fonts/source-code-pro/archive/2.030R-ro/1.050R-it.zip -P $DEST
    mkdir -pv ~/.fonts
    cd $DEST
    unzip 1.050R-it.zip
    cp source-code-pro-*-it/OTF/*.otf ~/.fonts/
    rm -rf source-code-pro*
    rm 1.050R-it.zip
    cd ~
    fc-cache -f -v
}

get_media_tools(){
    logger "Installing Feh and Sxiv"
    sudo apt-get install feh sxiv
}

get_media_tools
