#
# ~/.bashrc

#set Vim mode in bash
#set -o vi
#set Emacs mode in bash
set -o emacs


# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
  . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi
# Coloured Bash Prompt
bold=$(tput bold)
red=$(tput setaf 1)
green=$(tput setaf 2)
blue=$(tput setaf 4)
magenta=$(tput setaf 5)
yellow=$(tput setaf 3)
reset=$(tput sgr0)
undl=$(tput smul)
rmundl=$(tput rmul)
RED='\033[1;33m'

if [[ ${EUID} == 0 ]]; then
  # show root@ when we don't have colors
  # PS1='\[$yellow\][[\u:\W]]\[$reset\]\[$green\] '
  PS1='\[$yellow\][[\u:\W]]\[$reset\]\[$green\] '
else
  # PS1='\[$bold\]\[$yellow\][[ \[$yellow\]\[$red\]\u:\[$green\]\w\[$yellow\] ]]\[$reset\] '
  PS1='\[$bold\]\[$red\]\u:\[$green\]\w>\[$reset\] '
fi
# reduces the Path prompt to specified length
prompt_dir() {
  PROMPT_DIRTRIM=$1
}


# Avoid duplicates
HISTCONTROL=ignoredups:erasedups
# When the shell exits, append to the history file instead of overwriting it
shopt -s histappend
# After each command, append to the history file and reread it
# # Append history across sessions, is Questionable!
# PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND$'\n'}history -a; history -n"
## Current version is alias activated
alias hsync="history -a; history -c; history -r"

# Git VCS symbols in bash-prompt
# if [ -f "$HOME/.bash-git-prompt/gitprompt.sh" ]; then
#     GIT_PROMPT_ONLY_IN_REPO=1
#     source $HOME/.bash-git-prompt/gitprompt.sh
# fi


[ -f ~/.fzf.bash ] && source ~/.fzf.bash


#BASE16_SHELL=$HOME/.config/base16-shell/
#[ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"

PATH=$PATH:/home/abhirup/.local/bin:~/.cargo/bin:~/go/bin:$SCRIPTS
export JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64/

# WSL settings
#KERNEL=`uname -r`
#if [[ $KERNEL == *microsoft* ]]; then
#    VIP=`ipconfig.exe | awk -F" : " '/IPv4.*172/{print $2}'`
#    export DISPLAY=${VIP/$'\r'/}":0"
#fi

if [ -d ~/.bash_completion.d ]; then
  for file in ~/.bash_completion.d/*; do
    . $file
  done
fi

