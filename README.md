
# Table of Contents

1.  [Features <code>[37%]</code>](#orge8ed3ed)
2.  [Useful snippets](#org49eb97d)
3.  [Setup details](#orgcd3ecaa)
    1.  [Bare repository](#org1aabd49)
        1.  [Create alias](#org692ec7f)
        2.  [Checkout](#org9eb93a0)
    2.  [Touchpad (on Arch-linux/i3)](#orgd97182c)
    3.  [Vim-plug](#org5e17906)
    4.  [Compiling Vim](#orgdc7827b)
    5.  [Important packages](#org21eb2e4)


<a id="orge8ed3ed"></a>

# Features <code>[37%]</code>

-   [ ] Pacman update hook with efficent i3bar blocklet
-   [ ] Make fish config independent of distribution & package manager
-   [ ] Allowances for "gapless" version of i3wm
-   [ ] Stable layouts for i3-layout-manager (window agnostic)
-   [X] Keyboard control for spotify client + i3-blocks blocklet
-   <code>[2/3]</code> Automating layouts to i3-layout-manager
    -   [X] [Script](.config/scripts/load_i3layout.sh)
    -   [X] Latex + PDF
    -   [ ] mpv (ytdl) + jupyter notebook
-   [ ] Pomodoro timer + i3-blocks blocklet
-   [X] Mod+Shift+Enter to launch terminal in `$PWD` directory  ([script](.config/scripts/last_pwd_shell.sh))
-   [X] Stable script to obtain weather information
    -   Wttr.in: `curl  "wttr.in/Kolkata?format=%t"`
    -   Accuweather: [accuweather script](.config/scripts/weather.sh)


<a id="org49eb97d"></a>

# Useful snippets

[useful-snippets.org](.config/useful-snippets.md)


<a id="orgcd3ecaa"></a>

# Setup details


<a id="org1aabd49"></a>

## Bare repository


<a id="org692ec7f"></a>

### Create alias

    alias baredot="git --git-dir=$HOME/mydotfiles --work-tree=$HOME"


<a id="org9eb93a0"></a>

### Checkout

    baredot checkout 2>&1 | egrep "\s+\." | awk "{print $1}" | xargs -I{} mv {} {}.bak

For `fish shell`

    set fl (baredot checkout <branch> 2>&1 | egrep "\s+\." | awk -F"\t" "{print $2}")
    for f in $fl
        mv $f $f".bak"
    end
    baredot checkout <branch>


<a id="orgd97182c"></a>

## Touchpad (on Arch-linux/i3)

Paste in `/etc/X11/xorg.conf.d/90-touchpad.conf` ([Source](https://cravencode.com/post/essentials/enable-tap-to-click-in-i3wm))

    Section "InputClass"
    Identifier "touchpad"
    MatchIsTouchpad "on"
    Driver "libinput"
    Option "Tapping" "on"
    Option "TappingButtonMap" "lrm"
    Option "NaturalScrolling" "on"
    Option "ScrollMethod" "twofinger"
    EndSection


<a id="org5e17906"></a>

## Vim-plug

    vim-plug: curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim


<a id="orgdc7827b"></a>

## Compiling Vim

    ./configure --prefix=/usr --with-compiledby="Abhirup Das" \
                --enable-gui=auto --enable-gtk2-check --with-x  --enable-gnome-check \
                --with-features=huge --enable-cscope  --enable-fontset --enable-multibyte \
                --with-python-config-dir=/usr/lib/python2.7/config/


<a id="org21eb2e4"></a>

## Important packages

[package list](mydotfiles/required-after-install.md) 

