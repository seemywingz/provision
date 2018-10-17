Provision Local Mac OsX for RedTech Kotlin Development
=====================================
###### !! Make sure to watch the teminal during installation, your user password is required !! 
# Prerequisites  
  * Copy and Run the appropriate initial-setup script in Your Terminal 
      * The [Mac Script](https://github.com/WeConnect/redt-local-setup/blob/master/scripts/initial-setup.sh)  will install [Homebrew](https://brew.sh/) and [Git](https://git-scm.com/), then clone this repo
      * The [Ubuntu Script](https://github.com/WeConnect/redt-local-setup/blob/master/scripts/initial-setup.sh)  will install [Homebrew](https://brew.sh/) and [Git](https://git-scm.com/), then clone this repo
  * [Optional] Update the Desired Tools and Apps  
    *  playbooks/group_vars/all.yml 
    *  Current List Contains:  

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
  - mysql
  - shellcheck
  - tree
  - watch
  - wget
  - yarn
  - zsh

cask_apps:
  - 1password
  - docker
  - intellij-idea
  - iterm2
  - java8
  - postman
  - sequel-pro
  - slack
  - spotify
  - tunnelblick
  - visual-studio-code-insiders
  - zeplin

# Run the Full Setup
#### !! Make sure to watch the teminal during installation, your user password is required !! 

The setup script will install [Ansible](https://www.ansible.com/overview/how-ansible-works)  
Then Ansible will take care of the rest!

#### Default Setup
  `~/git/redt-local-setup/scripts/setup.sh`

#### All Tasks  ["cli","apps","dotfiles"]
#### Limit Which Tasks to Run 
  `~/git/redt-local-setup/scripts/setup.sh -t "cli,apps"`

#### To Exclude Tasks
  `~/git/redt-local-setup/scripts/setup.sh -e "dotfiles"`
  

# Additional Steps
#### !! Make sure to watch the teminal during installation, your user password is required !! 

#### ZSH
To change your shell to ZSH
```shell_session 
chsh -s /bin/zsh
```  

#### Java8
If you chose not to use the provided dotfiles, make sure to set the proper `JAVA_HOME` environment variable in your shell's run commands e.g. `~/.bashrc` 
```
export JAVA_HOME=`/usr/libexec/java_home -v 1.8`
```
Java8 Brew Caveats 
###### As of September 20, 2018 latest Java8 version is: 1.8.0_181
```term
==> Caveats
This Cask makes minor modifications to the JRE to prevent issues with
packaged applications, as discussed here:

  https://bugs.eclipse.org/bugs/show_bug.cgi?id=411361

If your Java application still asks for JRE installation, you might need
to reboot or logout/login.

Installing java8 means you have AGREED to the license at
  https://www.oracle.com/technetwork/java/javase/terms/license/index.html
```

#### Vim
Vim should auto install `Vim-Plug`   
To install vim plugins with `Vim-Plug`
```
vim -c PlugInstall -c qa
```

#### AWS CLI
Before you can run the alias `get-redt-aws-token`  
Docker must be running `CMD+Space` to open Spotlight then search `docker`  
Then build the onelogin SAML image
```bash
cd ~/git/redt-onelogin-aws-saml
docker build . -t onelogin-aws-saml
```
