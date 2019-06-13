#!/bin/fish
set prompt $argv[1]
echo -e $argv[2..-1] | sed -e "s/ /\\n/g" |
rofi \
                -dmenu \
                -mesg $prompt \
                -no-fixed-num-lines \
                -width 24 \
                -hide-scrollbar \
                -theme-str '#inputbar { children: [entry,case-indicator]; }' \
                -theme-str '#listview { dynamic: true; }' \
                -theme-str '#mainbox { children: [message,inputbar,listview]; }' \
                -theme-str '#message { border: 0; background-color: @selected-normal-background; text-color: @selected-normal-foreground; }' \
                -theme-str '#textbox { text-color: inherit; }'
