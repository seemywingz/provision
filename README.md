Provision Local Mac OSx
=====================================

### Prerequisites  
  * Install Homebrew  
    * `/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"`
  * Install ansible  
    * `brew install ansible`  
  * Update the Desired Tools and Apps  
    *  playbooks/group_vars/all.yml 
    * Current List: 
  
  cli_tools:
  - autojump
  - ctags
  - coreutils
  - curl 
  - fswatch
  - git
  - git-town
  - go
  - htop
  - jq
  - neovim
  - nmap
  - shellcheck
  - tcptrack
  - tree
  - watch
  - wget
  - yarn
  - zsh

cask_apps:
  - 1password
  - docker
  - firefox
  - google-chrome
  - iterm2
  - postman
  - sequel-pro
  - slack
  - spotify
  - viscosity
  - visual-studio-code-insiders
  - zeplin

### Run the Playbook
  `ansible-playbook playbooks/provision.yml`

### Limit With Tags ["cli", "apps","dotfiles"]
  `ansible-playbook playbooks/provision.yml --tags cli`

### To Exclude Tasks ["cli", "apps","dotfiles"]
  `ansible-playbook playbooks/provision.yml --exclude dotfiles`
