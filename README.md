## TODO:
* Add auxiliary scripts for all additional functions (so that config is stable in beginning)
    * [x] i3-layout-manager ([script](.config/scripts/load_i3layout.sh))
    * [x] weather script (used `curl  "wttr.in/Kolkata?format=%t"`)
    * [ ] i3-blocks (make allowances for gapless config)
    * [ ] pomodoro
* [x] Automating Saving and Loading layouts using i3-layout-manager
* Layouts
    * [ ] for Latex, Mpv(Ytdl)-Jupyter-terminal
* [x] Mod+Shift+Enter to launch terminal in `$PWD` directory ([script](.config/scripts/last_pwd_shell.sh))
* [ ] Refresh/reset all terminal instances in current workspace

## Useful snippets / codes
* youtube-dl
    ```sh
    #- to download playlist bestvideo + bestaudio:
    youtube-dl -f bestvideo+bestaudio -i "PLZbbT5o_s2xoWNVdDudn51XM8lOuZ_Njv"
    #- to download only playlist info
    youtube-dl -i --get-filename --skip-download "PLZbbT5o_s2xoWNVdDudn51XM8lOuZ_Njv" >> courselist.md
    #- configure names of saved videos
    youtube-dl -o "%(playlist_index)s-%(title)s.%(ext)s" <playlist_link>
    ```

## Setup details:
* vim-plug:
    curl -fLo ~/.config/nvim/autoload/plug.vim  --create-dirs \
                https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
* Touchpad [Source](https://cravencode.com/post/essentials/enable-tap-to-click-in-i3wm):
    ```
    Section "InputClass"
        Identifier "touchpad"
        MatchIsTouchpad "on"
        Driver "libinput"
        Option "Tapping" "on"
        Option "TappingButtonMap" "lrm"
        Option "NaturalScrolling" "on"
        Option "ScrollMethod" "twofinger"
    EndSection
    # paste in /etc/X11/xorg.conf.d/90-touchpad.conf
    ```

* Backup for bare-repository:
    ```sh
    # - Create alias:
    alias baredot="git --git-dir=$HOME/mydotfiles --work-tree=$HOME"
    # - Checkout + Backup:
    baredot checkout 2>&1 | egrep "\s+\." | awk "{print $1}" | xargs -I{} mv {} {}.bak
    ```
* Install packages given in [required-after-install.md](mydotfiles/required-after-install.md)
