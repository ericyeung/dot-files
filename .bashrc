# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
#[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    fi
fi


unset color_prompt force_color_prompt

PS1='\[\e[0;36m\][\w]\$\[\e[0m\] '
PS2='> '
PS3='> '
PS4='+ '


# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    #alias grep='grep --color=auto'
    #alias fgrep='fgrep --color=auto'
    #alias egrep='egrep --color=auto'
fi

# some more ls aliases
#alias ll='ls -l'
#alias la='ls -A'
#alias l='ls -CF'

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

alias g="grep"
alias ls="ls --color=auto"
alias update="sudo apt-get update && sudo apt-get upgrade"
alias open="xdg-open"
alias FTL="cd && cd Kawaii && cd FTL && ./FTL && cd"
alias irssi='TERM=screen-256color irssi'
alias weechat='weechat-curses'
alias apt-get="sudo apt-get"
alias RAIN="cd & cd Kawaii && cd bash_scripts && bash rain.sh && cd"
alias arpscan="sudo arp-scan --interface=wlan1 --localnet"
alias matlab="cd && cd kawaii/MATLAB/bin && ./matlab"

function lime() {
	sublime_text $1 &
}

# pip current python requirements  
function freeze() {
	echo "Updating python package versions... " && pip freeze > ~/kawaii/bash_scripts/CurrentPython/Python_version.txt & cd ~/kawaii/bash_scripts/CurrentPython/ && ls
}

function pipupdate() {
#pip freeze --local | grep -v '^\-e' | cut -d = -f 1  | xargs pip install -U
	sudo python ~/kawaii/bash_scripts/pipall.py
}

# easy mounting 
function mnt() {
	sudo mount /dev/sd$1 /media/usb # where the input is b1, c1, or d1, etc...
}

# cd and ls combined function (fixed!)
function cs() {
cd "$1" && ls
}

# LAZINESS
# $1 is the streamer, $2 is the quality, $1 is first input, etc...
function twitch () {
	livestreamer twitch.tv/$1 $2
}

function azubu (){
	livestreamer http://www.azubu.tv/$1 720p # always high quality!
}

function utube (){
	livestreamer https://www.youtube.com/watch?v=$1 # input is video id
}

# ...other stuff...

if [[ ! $TERM =~ screen ]]; then
    exec tmux       # use tmux instead of screen
fi

export TERM=screen-256color # use all 256

eval "`dircolors -b ~/.dircolorsrc`" #change ls colours
export LS_OPTIONS='--color=auto'
