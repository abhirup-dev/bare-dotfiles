
# Table of Contents

1.  [Features <code>[33%]</code>](#org1e44f50)
2.  [Useful snippets](#org83bdd0c)
3.  [Setup details](#org47a9b2f)
    1.  [Bare repository](#org91f586b)
        1.  [Create alias](#org818afcf)
        2.  [Checkout](#org155549e)
    2.  [Touchpad (on Arch-linux/i3)](#org6387440)
    3.  [Vim-plug](#orgfe8aa8e)
    4.  [Important packages](#orgaf0e24a)


<a id="org1e44f50"></a>

# Features <code>[33%]</code>

-   [ ] Pacman update hook with efficent i3bar blocklet
-   [ ] Add auxiliary scripts for all additional functions, so that config is stable in beginning
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
    -   Current: `curl  "wttr.in/Kolkata?format=%t"`


<a id="org83bdd0c"></a>

# Useful snippets

[useful-snippets.org](.config/useful-snippets.md)


<a id="org47a9b2f"></a>

# Setup details


<a id="org91f586b"></a>

## Bare repository


<a id="org818afcf"></a>

### Create alias

    alias baredot="git --git-dir=$HOME/mydotfiles --work-tree=$HOME"


<a id="org155549e"></a>

### Checkout

    baredot checkout 2>&1 | egrep "\s+\." | awk "{print $1}" | xargs -I{} mv {} {}.bak

For `fish shell`

    set fl (baredot checkout <branch> 2>&1 | egrep "\s+\." | awk -F"\t" "{print $2}")
    for f in $fl
        mv $f $f".bak"
    end
    baredot checkout <branch>


<a id="org6387440"></a>

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


<a id="orgfe8aa8e"></a>

## Vim-plug

    vim-plug: curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim


<a id="orgaf0e24a"></a>

## Important packages

[package list](mydotfiles/required-after-install.md) 

