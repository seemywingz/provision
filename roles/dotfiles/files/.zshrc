# Add SSH Agent
eval $(ssh-agent)


# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="avit"
# ZSH_THEME="frisk"
# ZSH_THEME="jispwoso"
# ZSH_THEME="xiong-chiamiov"
# ZSH_THEME="tjkirch"
# ZSH_THEME="pure"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

# Install Docker Complete Plugin
# mkdir -p ~/.oh-my-zsh/plugins/docker/
# curl -fLo ~/.oh-my-zsh/plugins/docker/_docker https://raw.github.com/felixr/docker-zsh-completion/master/_docker
# And then in your ~/.zshrc file, add docker to the plugins list. Then run exec zsh to restart zsh.
plugins=(docker)

#### Environment Variables ####
export PATH="/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:~/.local/bin"
# Go 
export GOPATH=~/go
export PATH=${PATH}:${GOPATH}/bin
export PATH=~/Library/Python/3.6/bin:$PATH
source $ZSH/oh-my-zsh.sh

# Java
export JAVA_HOME=`/usr/libexec/java_home -v 1.8.0_161`

# ZSH 
export HISTSIZE=10000
export SAVEHIST=10000
export HISTFILE=$HOME/.history/zsh_history.$HOSTNAME

# K8S
# export KUBECONFIG=$HOME/.kube/config-alpha001

  # ZSH Globals
export UPDATE_ZSH_DAYS=7                # Update every week
  # zsh configuration
COMPLETION_WAITING_DOTS="true"          # Waiting dots
HIST_STAMPS="mm.dd.yyyy"                # history timestamp formatting
# DISABLE_CORRECTION="true"             # Disable command autocorrection
# CASE_SENSITIVE="true"                 # Case sensitive completion
# DISABLE_UNTRACKED_FILES_DIRTY="true"  # Don't show untracked files
# ZSH_CUSTOM=/path/to/new-custom-folder # Use alternative custom folder
  # The following lines were added by compinstall
zstyle ':completion:*' completer _complete _ignored
zstyle :compinstall filename '~/.zshrc'
autoload -Uz compinit
compinit
setopt autocd
bindkey -e

#### Power-Line ####
# if [[ -r /usr/local/lib/python2.7/site-packages/powerline/bindings/zsh/powerline.zsh ]]; then
#     source /usr/local/lib/python2.7/site-packages/powerline/bindings/zsh/powerline.zsh
# fi


#### Autojump ####
#[[ -s $(brew --prefix)/etc/profile.d/autojump.sh ]] && . $(brew --prefix)/etc/profile.d/autojump.sh
if [ $commands[autojump] ]; then # check if autojump is installed
  if [ -f $HOME/.autojump/etc/profile.d/autojump.zsh ]; then # manual user-local installation
    . $HOME/.autojump/etc/profile.d/autojump.zsh
  elif [ -f $HOME/.autojump/share/autojump/autojump.zsh ]; then # another manual user-local installation
    . $HOME/.autojump/share/autojump/autojump.zsh
  elif [ -f $HOME/.nix-profile/etc/profile.d/autojump.zsh ]; then # nix installation
    . $HOME/.nix-profile/etc/profile.d/autojump.zsh
  elif [ -f /usr/share/autojump/autojump.zsh ]; then # debian and ubuntu package
    . /usr/share/autojump/autojump.zsh
  elif [ -f /etc/profile.d/autojump.zsh ]; then # manual installation
    . /etc/profile.d/autojump.zsh
  elif [ -f /etc/profile.d/autojump.sh ]; then # gentoo installation
    . /etc/profile.d/autojump.sh
  elif [ -f /usr/local/share/autojump/autojump.zsh ]; then # freebsd installation
    . /usr/local/share/autojump/autojump.zsh
  elif [ -f /opt/local/etc/profile.d/autojump.zsh ]; then # mac os x with ports
    . /opt/local/etc/profile.d/autojump.zsh
  elif [ $commands[brew] -a -f `brew --prefix`/etc/autojump.zsh ]; then # mac os x with brew
    . `brew --prefix`/etc/autojump.zsh
  fi
fi

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#

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

#### Hooks ####
# AWS CLI Completer
source $(which aws_zsh_completer.sh)

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"