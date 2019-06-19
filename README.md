## Setup details:
    * vim-plug:
        curl -fLo ~/.config/nvim/autoload/plug.vim  --create-dirs \
                    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    * Touchpad:
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

    * Backup for bare-repository:
        - Create alias:
            alias baredot="git --git-dir=$HOME/mydotfiles --work-tree=$HOME"
		- Checkout + Backup:
			baredot checkout 2>&1 | egrep "\s+\." | awk "{print $$$1}" | \
                                 xargs -I{} mv {} {}.bak
	* Install packages given in [required-after-install.md](./mydotfiles/required-after-install.md)


