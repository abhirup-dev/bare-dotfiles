set -gx ANDROID_HOME /home/abhirup/Android/Sdk
set FLUTTER_BIN /home/abhirup/Documents/Boost_Codes/Flutter/flutter/bin
set -gx PATH $PATH $ANDROID_HOME $ANDROID_HOME/platform-tools $FLUTTER_BIN /home/abhirup/.local/bin
alias med="medit > /dev/null 2>&1"

function parse_vcf
    if test -d $argv[2]
        echo "just parse"
        awk '/BEGIN:VCARD/ {flag=1;next} /(VERSION:2.1|N.*;;;)/{next} /END:VCARD/ {flag=0;print"--"} flag' $argv[1]  | awk '/PHOTO;ENCODING=.*/{flag=0;}/X-GROUP:/{flag=1;next}flag' 
    else
        echo entered name=$argv[2]
        awk '/BEGIN:VCARD/ {flag=1;next} /(VERSION:2.1|N.*;;;)/{next} /END:VCARD/ {flag=0;print"--"} flag' $argv[1]  | awk '/PHOTO;ENCODING=.*/{flag=0;}/X-GROUP:/{flag=1;next}flag' | awk -v pat="FN:$argv[2]" '$0~pat {flag=1;} /--/ {flag=0;next}flag'
    end

end

function sample 
    echo $argv[1]:$argv[2] | awk -F: -v name=$argv[3] '{print $1 " " name " " $2}'
end

alias chcaps="setxkbmap -option \"caps:swapescape\""
alias chback="setxkbmap -option "

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
#alias search="albert &> /dev/null"
#alias ded="deepin-editor &> /dev/null"
#alias dfm="dde-file-manager &> /dev/null"
#alias ged="gedit &> /dev/null"
alias grep="grep --color"
alias open="xdg-open"
alias vi="nvim"
alias git-cred-store="git config credential.helper 'cache --timeout 3600'"

# Configuring bare repository
set -x bare_dir $HOME/mydotfiles/
set -x bare_includes $bare_dir/.includes 
alias baredot="git --git-dir=$bare_dir --work-tree=$HOME"
function bare_include_file
    realpath $argv[1] >> $bare_includes
end
function bare_add_all
    cat $bare_includes | xargs -I{} fish -c "baredot add {}"
end

alias reflector_update="sudo cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.bak \
         && sudo reflector --verbose --latest 12 --protocol https --sort rate --save /etc/pacman.d/mirrorlist"
alias logoff="kill -9 -1"

#env NVIM_LISTEN_ADDRESS=/tmp/nvimsocket

#VIM mode in fish
fish_vi_key_bindings
#Swap CapsLock and Escape
chcaps
