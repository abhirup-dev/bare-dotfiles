
# Table of Contents

1.  [Features <code>[37%]</code>](#org940a86d)
2.  [Useful snippets](#org9dea2ce)
3.  [Setup details](#org670ad42)
    1.  [Bare repository](#orgf852b26)
        1.  [Create alias](#orgfd9d9c7)
        2.  [Checkout](#org4f048f1)
    2.  [Touchpad (on Arch-linux/i3)](#orgf39b09a)
    3.  [Vim-plug](#org33cb729)
    4.  [Important packages](#org8577977)


<a id="org940a86d"></a>

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


<a id="org9dea2ce"></a>

# Useful snippets

[useful-snippets.org](.config/useful-snippets.md)


<a id="org670ad42"></a>

# Setup details


<a id="orgf852b26"></a>

## Bare repository


<a id="orgfd9d9c7"></a>

### Create alias

    alias baredot="git --git-dir=$HOME/mydotfiles --work-tree=$HOME"


<a id="org4f048f1"></a>

### Checkout

    baredot checkout 2>&1 | egrep "\s+\." | awk "{print $1}" | xargs -I{} mv {} {}.bak

For `fish shell`

    set fl (baredot checkout <branch> 2>&1 | egrep "\s+\." | awk -F"\t" "{print $2}")
    for f in $fl
        mv $f $f".bak"
    end
    baredot checkout <branch>


<a id="orgf39b09a"></a>

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


<a id="org33cb729"></a>

## Vim-plug

    vim-plug: curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim


<a id="org8577977"></a>

## Important packages

[package list](mydotfiles/required-after-install.md) 

