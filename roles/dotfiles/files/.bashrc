#### Environment Variables ####
export PATH="/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:~/.local/bin"
# Go 
export GOPATH=~/go
# Path
export PATH=${PATH}:${GOPATH}/bin
export PATH=~/Library/Python/3.6/bin:$PATH
# Java
export JAVA_HOME=`/usr/libexec/java_home -v 1.8`
# Terminal
export EDITOR="/usr/local/bin/vim"

# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
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
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
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
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
  PS1="\n\u@\[$(tput sgr0)\]\[\033[38;5;197m\]\h\[$(tput sgr0)\]\[\033[38;5;15m\]\n\[$(tput sgr0)\]\[\033[38;5;45m\]\w\[$(tput sgr0)\]\[\033[38;5;15m\]\n\[$(tput sgr0)\]\[\033[38;5;243m\]\\$\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]"
    #PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

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

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias la="ls -lah"
alias ll='la'
alias l='ls -CF'
alias cls="clear"
alias ..="cd .."

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

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

. /usr/share/autojump/autojump.sh

#### Aliases ####
  # System
alias ..="cd .."
alias ls="ls -G"
alias cls="clear"
alias la="ls -lha"
alias flush_dns="sudo killall -HUP mDNSResponder"
alias showHidden="defaults write com.apple.finder AppleShowAllFiles YES"
  # Git
alias g="git"
alias gs="git status"
alias gb="git branch"
alias gp="git push"
alias gpll="git pull"
alias gc="git commit ."
alias gco="git checkout"
alias gpa="git add .;git commit;git push"
  # Vagrant
alias vup="vagrant up"
alias vhalt="vagrant halt"
alias vssh="vagrant ssh"
alias vdestroy="vagrant destroy"
  # Docker
alias d="docker"
alias dc="docker-compose"
alias dcd="docker-compose down"
alias dcu="docker-compose up"
alias dcs="docker-compose stop"
alias dps="docker ps"
alias di="docker images"
alias dip="docker inspect --format '{{ .NetworkSettings.IPAddress }}'"
 # Kubernetes
alias k="kubectl"
alias kpods="kubectl get pods"

#### WeWork ####
# alias aws="aws --profile default"
alias get-wek8s-credentials='f(){ cmd="docker run -it --rm -v ~/.aws:/package/.aws quay.io/wework/onelogin-aws-saml:master sh -c \"python /package/samlapi.py "$@"\""; bash -c "${cmd}" unset -f f; }; f'
alias get-aws-credentials='f(){ cmd="docker run -it --rm -v ~/.aws:/package/.aws onelogin-aws-saml sh -c \"python /package/samlapi.py "$@"\""; bash -c "${cmd}" unset -f f; }; f'
alias get-redt-aws-token="get-aws-credentials --env prod --account 758374777033 --role AWS-Developer --region us-east-1 --profile redt"

function aws-new-token() {
  # defaults
  ACCOUNT=758374777033 
  REGION=us-east-1
  PROFILE=default
  DURATION=8

  while getopts 'a:r:p:' flag; do
    case "${flag}" in
      a) 
        [[ ${OPTARG} == "sg" ]] && ACCOUNT=795371015581
        [[ ${OPTARG} == "fl" ]] && ACCOUNT=342329727024
        ;;
      r) 
        REGION="${OPTARG}" 
        ;;
      p) 
        PROFILE="${OPTARG}" 
        ;;
      *) 
        error "Unexpected option ${flag}" 
        ;;
    esac
  done	

  get-aws-credentials --env prod --account $ACCOUNT --role AWS-Admin --duration-hours $DURATION --region $REGION --profile $PROFILE
}
# export AWS_ACCESS_KEY_ID=$(cat ~/.aws/credentials | grep aws_access_key_id | awk '{print $3}')
# export AWS_SECRET_ACCESS_KEY=$(cat ~/.aws/credentials | grep aws_secret_access_key | awk '{print $3}')
# export AWS_SESSION_TOKEN=$(cat ~/.aws/credentials | grep aws_session_token | awk '{print $3}')

#### Docker ####
function de() {
  docker exec -it $(docker ps -aqf "name=${1}") "${@:2}"
}

function dls() {
  docker ps -af "name=$1"
}
