# Path to your oh-my-zsh installation.
export ZSH=/home/dirac/.oh-my-zsh
 
# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="gnzh"
ZSH_THEME="agnoster"
 
# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"
 
# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"
 
# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13
 
# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"
 
# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"
 
# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"
 
# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"
 
# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"
 
# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"
 
# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder
 
# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)
 
# User configuration
 
export PATH="/home/dirac/.local/bin:/home/dirac/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/bin:/bin:/usr/local/games:/usr/games"
# export MANPATH="/usr/local/man:$MANPATH"
 
source $ZSH/oh-my-zsh.sh
 
# You may need to manually set your language environment
# export LANG=en_US.UTF-8
 
# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi
 
# Compilation flags
# export ARCHFLAGS="-arch x86_64"
 
# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"
 
# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias g="grep"
alias update="sudo apt-get update && sudo apt-get upgrade"
alias open="xdg-open"
alias FTL="cd && cd Kawaii && cd FTL && ./FTL && cd"
alias irssi='TERM=screen-256color irssi'
alias weechat='weechat-curses'
alias apt-get="sudo apt-get"
alias RAIN="cd & cd Kawaii && cd bash_scripts && bash rain.sh && cd"
alias arpscan="sudo arp-scan --interface=wlan1 --localnet"
alias matlab="cd && cd kawaii/MATLAB/bin && ./matlab"
alias sleeep="dbus-send --system --print-reply \
   --dest="org.freedesktop.UPower" \
   /org/freedesktop/UPower \
   org.freedesktop.UPower.Suspend"
alias sleepy="sudo pm-suspend"
alias skypebot="python ~/kawaii/skypebot.py"
 
# pip current python requirements  
function freeze() {
    echo "Updating python package versions... " && pip freeze > ~/kawaii/bash_scripts/CurrentPython/Python_version.txt & cd ~/kawaii/bash_scripts/CurrentPython/ && ls
}
 
# easy mounting
function mnt() {
    sudo mount /dev/sd$1 /media/usb # input is either b1, c1, d1, etc...
}
 
function umnt() {
    sudo umount /dev/sd$1 /media/usb
}
 
function pipupdate() {
# pip freeze --local | grep -v '^\-e' | cut -d = -f 1  | xargs pip install -U
    sudo python ~/kawaii/bash_scripts/pipall.py
}
 
# cd and ls combined function (fixed!)
function cs() {
cd "$1" && ls
}
 
# LAZINESS
# $1 is the streamer, $2 is the quality, $1 is first input, etc...
function live () {
    livestreamer --twitch-oauth-token [SECRET] twitch.tv/$1 $2
    #livestreamer twitch.tv/$1 high
}
 
function azubu (){
    livestreamer http://www.azubu.tv/$1 720p # always high quality!
}
 
function utube (){
    livestreamer https://www.youtube.com/watch?v=$1 # input is video id
}
 
DEFAULT_USER=[your username here]
