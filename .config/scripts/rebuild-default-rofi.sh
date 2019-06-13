#!/bin/bash

ROOT_DIR="$CONFIGS/rofi"

function rebuild_config {
    rm -rf $ROOT_DIR/config*
    rofi -dump-config > $ROOT_DIR/config.rasi
}

function rebuild_theme {
    rm -rf $ROOT_DIR/theme*
    rofi -dump-theme > $ROOT_DIR/theme.rasi
}

function reconnect_theme {
    sed \
        --in-place='.bak' \
        --regexp-extended \
        -e "s~^.*\stheme:.*$~\ttheme: \"$ROOT_DIR/theme.rasi\";~g" \
        $ROOT_DIR/config.rasi
}

if [[ -n "$1" ]]; then
    INPUT="$1"
else
    INPUT=$(exec fish -c "$SCRIPTS/trigger-rofi.fish \
            'Rebuild rofi?' config theme all")
    echo $INPUT
    if [[ -z $INPUT ]]; then
        exit 0
    fi
fi

case "$INPUT" in
    config)
        rebuild_config
        ;;
    theme)
        rebuild_theme
        ;;
    all)
        rebuild_config
        rebuild_theme
        ;;
    *)
        echo "usage: $0 {config,theme,all}"
        exit 1
        ;;
esac
reconnect_theme
