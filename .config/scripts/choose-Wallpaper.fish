#!/usr/bin/fish
set wals (ls $WALLPDIR | sed -e ":a
                        N
                        s/\n/\\\n/
                        ta")
trigger-rofi.fish "Choose wallpaper" $wals

