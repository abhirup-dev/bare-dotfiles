
# Table of Contents

1.  [Features <code>[40%]</code>](#orgb5de105)
2.  [Useful snippets](#orgb628128)
3.  [Setup details](#org2d34adb)
    1.  [Bare repository](#org49921e1)
        1.  [Create alias](#orgd549f4f)
        2.  [Checkout](#orgea77de8)
    2.  [Touchpad (on Arch-linux/i3)](#org7bceaba)
    3.  [Vim-plug](#orgfd5375a)
    4.  [Important packages](#org2005a3b)


<a id="orgb5de105"></a>

# Features <code>[40%]</code>

-   [ ] Pacman update hook with efficent i3bar blocklet
-   <code>[0/3]</code> Add auxiliary scripts for all additional functions, so that config is stable in beginning
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
-   [ ] Stable script to obtain weather information
    -   Wttr.in: `curl  "wttr.in/Kolkata?format=%t"`
    -   Accuweather: [accuweather script](.config/scripts/weather.sh)


<a id="orgb628128"></a>

# Useful snippets

[useful-snippets.org](.config/useful-snippets.md)


<a id="org2d34adb"></a>

# Setup details


<a id="org49921e1"></a>

## Bare repository


<a id="orgd549f4f"></a>

### Create alias

    alias baredot="git --git-dir=$HOME/mydotfiles --work-tree=$HOME"


<a id="orgea77de8"></a>

### Checkout

    baredot checkout 2>&1 | egrep "\s+\." | awk "{print $1}" | xargs -I{} mv {} {}.bak

For `fish shell`

    set fl (baredot checkout <branch> 2>&1 | egrep "\s+\." | awk -F"\t" "{print $2}")
    for f in $fl
        mv $f $f".bak"
    end
    baredot checkout <branch>


<a id="org7bceaba"></a>

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


<a id="orgfd5375a"></a>

## Vim-plug

    vim-plug: curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim


<a id="org2005a3b"></a>

## Important packages

[package list](mydotfiles/required-after-install.md) 

