Provision Local Mac OsX
=====================================

### Prerequisites  
  * Update the Desired Tools and Apps  
    *  playbooks/group_vars/all.yml 
    *  Current List:  
    
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
  - intellij-idea
  - iterm2
  - postman
  - sequel-pro
  - slack
  - spotify
  - tunnelblick
  - visual-studio-code-insiders
  - zeplin

## Run the Setup
  `./scripts/setup.sh`

### Limit Which Tasks to Run  ["cli", "apps","dotfiles"]
  `./scripts/setup.sh -t "cli,apps"`

### To Exclude Tasks ["cli", "apps","dotfiles"]
  `./scripts/setup.sh -e "dotfiles"`
