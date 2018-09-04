#!/bin/bash

rootDir="$(cd "$(dirname "$0")" && pwd)"
ansibleOptions=""

exitOnError () {
  exitCode=$1
  errorMessage=$2
  [[ $1 -gt 0 ]] && (echo "Error: ${2}" && exit 1) ||:
}

isInstalled () {
  app=$1
  [[ -x "$(command -v ${app})" ]] && true || false
}

while getopts 't:e:' flag; do
    case "${flag}" in
      t) 
        ansibleOptions="${ansibleOptions} --tags ${OPTARG}"
        ;;
      e) 
        ansibleOptions="${ansibleOptions} --skip-tags ${OPTARG}"
        ;;
      *) 
        error "Unexpected option ${flag}" 
        ;;
    esac
  done	

if ! isInstalled brew; then
  msg="Installing Homebrew"
  echo ${msg}
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  exitOnError $? ${msg}
  brew update
  brew doctor
  brew prune
fi

if ! isInstalled ansible; then
  msg="Installing Ansible"
  echo ${msg}
  brew install ansible
  exitOnError $? ${msg}
fi

echo "Running Setup: ansible-playbook ${ansibleOptions} playbooks/provision.yml"
ansible-playbook ${ansibleOptions} playbooks/provision.yml 
exitOnError $? "Running Ansible Playbook"
