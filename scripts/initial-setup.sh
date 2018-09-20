initailSetupScript=~/redt-inital-setup.sh
cat > ${initailSetupScript} <<'EOF'
#!/bin/bash

repoDir="~/git"
redtLocalSetupRepo="git@github.com:WeConnect/redt-local-setup.git"

exitOnError () {
  exitCode=$1
  errorMessage=$2
  [[ $1 -gt 0 ]] && (echo "Error: ${2}" && exit 1) ||:
}

isInstalled () {
  app=$1
  [[ -x "$(command -v ${app})" ]] && true || false
}

if ! isInstalled brew; then
  msg="Installing Homebrew"
  echo ${msg}
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  exitOnError $? ${msg}
  brew update
  brew doctor
  brew prune
fi

if ! isInstalled git; then
  msg="Installing Git"
  echo ${msg}
  brew install git
  exitOnError $? ${msg}
fi

mkdir -p ${repoDir}
cd ${repoDir}
git clone ${redtLocalSetupRepo}
EOF
chmod +x ${initailSetupScript}
${initailSetupScript}
rm ${initailSetupScript}