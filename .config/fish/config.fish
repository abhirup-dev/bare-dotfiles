# Path to Oh My Fish install.
set -q XDG_DATA_HOME
  and set -gx OMF_PATH "$XDG_DATA_HOME/omf"
  or set -gx OMF_PATH "$HOME/.local/share/omf"

# Load Oh My Fish configuration.
source $OMF_PATH/init.fish
set -gx TERMINAL /usr/local/bin/termite
set -gx WALLPAPERS ~/Pictures/Wallpapers
set -gx TESTBENCH ~/Dev/Testbench
set -gx CONFIGS ~/.config
set -gx SCRIPTS $CONFIGS/scripts
set -gx MANPATH /usr/local/man:/usr/local/share/man:/usr/share/man:/usr/man
set -gx MANPAGER less
# set -gx ANDROID_HOME /home/abhirup/Android/Sdk
# set FLUTTER_BIN /home/abhirup/Documents/Boost_Codes/Flutter/flutter/bin
set -gx PATH $PATH $SCRIPTS
set -gx megadir $HOME/MEGAsync
set -gx vinit $HOME/.config/nvim/init.vim
  # ________  .___  ___________
 # /  _____/  |   | \__    ___/
# /   \  ___  |   |   |    |
# \    \_\  \ |   |   |    |
 # \______  / |___|   |____|
 #        \/

# Configuring bare repository
set -x bare_dir $HOME/mydotfiles
set -x bare_includes $bare_dir/.includes
alias baredot="git --git-dir=$bare_dir --work-tree=$HOME"

function bare_include_file
    set lines (cat $bare_includes)
    set key (realpath $argv)
    for line in $lines
        if [ $key = $line ]
            echo "$key already exists in $bare_includes"
            return
        end
    end
    echo $key >> $bare_includes
end

function bare_add_all
    cat $bare_includes | xargs -I {} fish -c "baredot add {}"
end

function git_productivity
	echo "Between "$argv[1]" and "$argv[2]" --"
	git log --shortstat --since=$argv[1] --until=$argv[2] \
		  | grep "files changed\|Author\|Merge:" \
		  | awk '{ \
		    if ($1 == "Author:") {\
		      currentUser = $2;\
		    }\
		    if ($2 == "files") {\
		      files[currentUser]+=$1;\
		      inserted[currentUser]+=$4;\
		      deleted[currentUser]+=$6;\
		    }\
		  } END {\
		    for (i in files) {\
		      print i ":", "files changed:", files[i], "lines inserted:", inserted[i], "lines deleted:", deleted[i];\
		    }\
		  }'
end


       # .__  .__
# _____  |  | |__|____    ______
# \__  \ |  | |  \__  \  /  ___/
 # / __ \|  |_|  |/ __ \_\___ \
# (____  /____/__(____  /____  >
     # \/             \/     \/

alias la="ls -a"
alias ll="ls -l"
alias grep="grep --color"
alias diff="diff --color"
alias open="xdg-open"
alias vi="nvim"
alias svi="sudo nvim"
alias med="medit > /dev/null 2>&1"
alias git-cred-store="git config credential.helper 'cache --timeout 3600'"
# alias reflector_update="sudo cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.bak \
         # && sudo reflector --verbose --latest 12 --protocol https --sort rate --save /etc/pacman.d/mirrorlist"
alias logoff="kill -9 -1"
alias chcaps="setxkbmap -option \"caps:swapescape\""
alias chback="setxkbmap -option "

# Abbreviations
# if not set -q abbrs_initialized
#   set -U abbrs_initialized
#   echo -n 'Setting abbreviations...'

  abbr rs 'reset'
  abbr ssn 'shutdown now'
  abbr ne 'noerr'
  abbr dwn '~/Downloads'
  abbr mus '~/Music'
  abbr dcs '~/Documents'

  # abbr pi 'sudo pacman -S'
  # abbr pu 'pacman -Syy'
  # abbr pq 'pacman -Qs'
  # abbr pr 'sudo pacman -Rns'

  abbr sup 'sudo updatedb'
  abbr sct 'sudo systemctl'
  abbr bt 'baredot'
  abbr clipb 'xclip -selection clipboard'
  abbr cap 'capture'

  abbr cl 'git clone'
  abbr gs 'git status'
  abbr gA 'git add .'
  abbr ga 'git add'
  abbr gP 'git push -u origin master'
  abbr gp 'git push'
  abbr gc 'git commit -m "'

  abbr cf 'nvim ~/.config/fish/config.fish'
  abbr cnv 'nvim ~/.config/nvim/init.vim'
  abbr ccm 'nvim ~/.config/compton.conf'
  abbr ci3 'nvim ~/.config/i3/config'
  abbr ytd 'youtube-dl'
  # echo -n 'Done'
# end
  # _____
# _/ ____\_ __  ____   ____   ______
# \   __\  |  \/    \_/ ___\ /  ___/
 # |  | |  |  /   |  \  \___ \___ \
 # |__| |____/|___|  /\___  >____  >
  #                \/     \/     \/

# Redirect stdout / stderr
function noerr --description 'Redirects error of command to /dev/null'
    $argv > /dev/null 2>&1
end

function capture --description 'Stores output of given command in $pop'
    set -gx pop (eval $argv)
    echo $pop
    echo "Captured output to pop"
end

# Run bash commands from fish
function fbash
    exec bash -c "$argv"
end

# Prefix current command with "sudo"
function .runsudo --description 'Run current command line as root'
    set cursor_pos (echo (commandline -C) + 5 | bc)
    commandline -C 0
    commandline -i 'sudo '
    commandline -C "$cursor_pos"
end
bind \es ".runsudo"

# Create directory and cd into it
function mkcd --description  'Create directory and cd into it'
    mkdir $argv[1] ; cd $argv[1]
end

# Parsing VCARD file
function parse_vcf
    if test -d $argv[2]
        echo "just parse"
        awk '/BEGIN:VCARD/ {flag=1;next} /(VERSION:2.1|N.*;;;)/{next} /END:VCARD/ {flag=0;print"--"} flag' $argv[1]  | awk '/PHOTO;ENCODING=.*/{flag=0;}/X-GROUP:/{flag=1;next}flag'
    else
        echo entered name=$argv[2]
        awk '/BEGIN:VCARD/ {flag=1;next} /(VERSION:2.1|N.*;;;)/{next} /END:VCARD/ {flag=0;print"--"} flag' $argv[1]  | awk '/PHOTO;ENCODING=.*/{flag=0;}/X-GROUP:/{flag=1;next}flag' | awk -v pat="FN:$argv[2]" '$0~pat {flag=1;} /--/ {flag=0;next}flag'
    end
end

# Generating metadata from video
# function ffmcreate
#     ffprobe -v quiet $argv   -print_format json -show_entries stream=index,codec_type:stream_tags=creation_time:format_tags=creation_time >  $argv.txt
# end

# function -e fish_preexec _run_fasd
#     fasd --proc (fasd --sanitize "$argv") > "/dev/null" 2>&1
# end
# function j
#     cd (fasd -d -e 'printf %s' "argv")
# end

function sample
    echo $argv[1]:$argv[2] | awk -F: -v name=$argv[3] '{print $1 " " name " " $2}'
end

   # _____  .__                    .__
  # /     \ |__| ______ ____  ____ |  |
 # /  \ /  \|  |/  ___// ___\/ __ \|  |
# /    Y    \  |\___ \\  \__\  ___/|  |__
# \____|__  /__/____  >\___  >___  >____/ /\
   #      \/        \/     \/    \/       \/

#VIM mode in fish
# fish_vi_key_bindings
fish_default_key_bindings
#Swap CapsLock and Escape
chcaps


# Colors
set default (tput sgr0)
set red (tput setaf 1)
set green (tput setaf 2)
set purple (tput setaf 5)
set orange (tput setaf 9)

# "Less" colors for man pages
set -gx PAGER less
# Begin blinking
set -gx LESS_TERMCAP_mb $red
# Begin bold
set -gx LESS_TERMCAP_md $orange
# End mode
set -gx LESS_TERMCAP_me $default
# End standout-mode
set -gx LESS_TERMCAP_se $default
# Begin standout-mode - nfo box
set -gx LESS_TERMCAP_so $purple
# End underline
set -gx LESS_TERMCAP_ue $default
# Begin underline
set -gx LESS_TERMCAP_us $green

# set -gx COMP_WORDBREAKS " /"'><;|&("
