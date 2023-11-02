#!/bin/bash
rootDir="$(cd "$(dirname "$0")" && pwd)"
cd ${rootDir}/..
ansibleOptions=""
while getopts 't:e:' flag; do # getopts is a function to parse arguments passed to the script
  case "${flag}" in
  t) # tag
    ansibleOptions="${ansibleOptions} --tags ${OPTARG}"
    ;;
  e) # exclude tag
    ansibleOptions="${ansibleOptions} --skip-tags ${OPTARG}"
    ;;
  *)
    error "Unexpected option ${flag}"
    ;;
  esac
done

# Exit on error
exitOnError() {
  exitCode=$1
  errorMessage=$2
  [[ $1 -gt 0 ]] && (echo "Error: ${2}" && exit 1) || :
}

# Check if a command exists
isInstalled() {
  app=$1
  [[ -x "$(command -v ${app})" ]] && true || false
}

# Check if Ansible is installed
if ! isInstalled ansible; then
  msg="Installing Ansible"
  echo ${msg}
  brew install ansible
  # sudo apt update
  # sudo apt install software-properties-common ansible -y
  exitOnError $? ${msg}
fi

ansiblePlaybook="playbooks/local.yml"
echo "Running Setup: ansible-playbook ${ansibleOptions} ${ansiblePlaybook} "
ansible-playbook ${ansibleOptions} ${ansiblePlaybook} --ask-become-pass
exitOnError $? "Running Ansible Playbook"
cd -
