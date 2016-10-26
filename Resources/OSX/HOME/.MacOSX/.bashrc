# .bashrc

################
### VARIABLE ###
################

export BASHRC_FILE="$HOME/.MacOSX/.bashrc"
export PATH="/Library/Frameworks/Python.framework/Versions/2.7/bin:${PATH}"
export PATH="/usr/local/bin:${PATH}"
export CURL_CA_BUNDLE=/usr/local/share/ca-bundle.crt
export DOCKER_MACHINE_NAME=default
export XDEBUG_SESSION=sublime.xdebug
export WORK=$HOME/Sites


##############
### COLORS ###
##############

### ANSI COLORS
CRE="$(echo -e '\r\033[K')"
RED="$(echo -e '\033[1;31m')"
GREEN="$(echo -e '\033[1;32m')"
YELLOW="$(echo -e '\033[1;33m')"
BLUE="$(echo -e '\033[1;34m')"
MAGENTA="$(echo -e '\033[1;35m')"
CYAN="$(echo -e '\033[1;36m')"
WHITE="$(echo -e '\033[1;37m')"
NORMAL="$(echo -e '\033[0;39m')"

_colors () {
    echo "${CRE}CRE"
    echo "${RED}RED"
    echo "${GREEN}GREEN"
    echo "${YELLOW}YELLOW"
    echo "${BLUE}BLUE"
    echo "${MAGENTA}MAGENTA"
    echo "${CYAN}CYAN"
    echo "${WHITE}WHITE"
    echo "${NORMAL}NORMAL"
}


##########
### OS ###
##########

if [ "$(uname)" == "Darwin" ]; then
    export VAR_LS="ls -pG"
    export VAR_LL="ls -plG"
    export VAR_LA="ls -plaG"
    export VAR_EXPLORER="open ."
    export EDITOR='subl'
    export PACKAGE="$HOME/Library/Application\ Support/Sublime\ Text\ 2/Packages"
    export TOOLS="$HOME/Tools"
# elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
# elif [ "$(expr substr $(uname -s) 1 5)" == "MINGW" ]; then
else
    # TOOLS = C:\Tools => /C/Tools
    #export TOOLS=/${TOOLS/:\\//} # Replace ':\' by '/'
    #export TOOLS=${TOOLS//\\//}  # Replace '\' by '/'
    export VAR_LS="ls -p   --show-control-chars -F --color"
    export VAR_LL="ls -pl  --show-control-chars -F --color"
    export VAR_LA="ls -pla --show-control-chars -F --color"
    export VAR_EXPLORER="start ."
    export EDITOR='subl.bat'
    export PACKAGE="$TOOLS/SublimeText/Data/Packages"
fi
export DOCKER_HOME="$TOOLS/Docker"
export STPYSRC="$PACKAGE/User/Resources/Any/src"


#############
### ALIAS ###
#############

### aliases
alias ralias='source $BASHRC_FILE'
alias aliases='$EDITOR -a $BASHRC_FILE'
#alias unalias=unalias
alias aliash='cat $BASHRC_FILE'

### Shell
alias cls='clear'
alias ls='$VAR_LS'
alias ll='$VAR_LL'
alias la='$VAR_LA'
alias l='$VAR_LA'
alias spath='echo -e ${PATH//:/\\n}'
#alias upath=
alias lib='echo -e ${LD_LIBRARY_PATH//:/\\n}'
alias ..='cd ..'
alias cd..='cd ..'
#alias cdh='cd'
alias ph='pushd'
alias pp='popd'
alias e.='$VAR_EXPLORER'
alias setv='_setv(){ env | grep ^$1; }; _setv' # Show variables starting with $1
alias h='cat $HOME/.bash_history'
alias clsh='cat /dev/null>$HOME/.bash_history'
alias tit='_tit(){ echo -ne "\033]$mode;$*\007"; }; _tit'

### Git
alias g='git'
alias gl='git log --pretty=oneline --color --abbrev-commit --graph --decorate --all'
alias gll='git log --pretty=oneline --color --abbrev-commit --graph --decorate --first-parent'
alias gst='git status'
alias gdt='git difftool'
alias gg="$STPYSRC/colorcfg.py $HOME/.gitconfig"
alias gh='cat $HOME/.gitconfig'
alias gv='git --version'

### Sublime Text
alias subl='$EDITOR -a'
alias subld='$EDITOR -n "$(pwd)"'
alias pkg="cd $PACKAGE"
alias pkgu="cd $PACKAGE/User"
alias work="cd $WORK"

### Tools
alias rapache='sudo /usr/sbin/apachectl restart' # Restart apache with XDEBUG_SESSION
alias ver='which git;git --version;which python;python --version'

### npm
alias npmi='npm install --save'
alias npmid='npm install --save-dev'
alias npmu='npm uninstall --save'
alias npmud='npm uninstall --save-dev'

### Gulp
alias gp='gulp'

### Composer
alias cpr='composer'
alias cpru='composer update'
alias cpr_='composer require'
alias cprd='composer require --dev'
alias cprr='composer remove'
alias cprrd='composer remove --dev'

denv() {
    echo "${BLUE}Configuring docker environment...${NORMAL}"
    eval $(docker-machine env $DOCKER_MACHINE_NAME --shell bash)

    ### docker
    alias d='docker'
    alias dr='docker run'
    alias drn='docker run --name'
    alias dri='docker run -it'
    alias dh='_dh(){ docker $* --help; }; _dh'
    alias dhw='docker run hello-world'
    alias duber='docker run -dit --name uber --volume /var/shared/default:/var/shared ubuntu /bin/bash'
    alias dbh='_dbh(){ docker exec -it $* /bin/bash; }; _dbh'
    alias dps='docker ps'
    alias dpsa='docker ps -a'
    alias dpse='docker ps --filter status=exited'
    alias dpsl='docker ps -lq'
    alias dl='docker logs -f'
    alias di='docker images'
    alias dp='docker pull'
    alias ddt='docker diff'
    alias dci='docker commit'
    alias ds='_ds(){ pushd $DOCKER_HOME; docker save -o Image/${1/\//-}.tar $1; popd; }; _ds' # Replace '/' by '-' in image name
    alias dload='_ds(){ pushd $DOCKER_HOME; docker load -i Image/$1.tar; popd; }; _ds'
    alias drm='docker rm -f'
    alias drme='docker rm $(docker ps --filter status=exited --quiet)'
    alias drmi='docker rmi'
    alias drmid='docker rmi $(docker images -f "dangling=true" -q)'
    alias dinf='docker info'
    alias dv='docker version'

    ### docker-machine
    alias denv='eval $(docker-machine env $DOCKER_MACHINE_NAME --shell bash)' # Replace the function by an alias
    alias dm='docker-machine'
    alias dmcreate='docker-machine create --driver virtualbox $DOCKER_MACHINE_NAME'
    alias dmcrt='docker-machine regenerate-certs $DOCKER_MACHINE_NAME'
    alias dmrm='docker-machine rm $DOCKER_MACHINE_NAME'
    alias dmls='docker-machine ls'

    alias dmstart='docker-machine start $DOCKER_MACHINE_NAME'
    alias dmstop='docker-machine stop $DOCKER_MACHINE_NAME'
    alias dmstatus='docker-machine status $DOCKER_MACHINE_NAME'

    alias dmip='docker-machine ip $DOCKER_MACHINE_NAME'
    alias dmsh='docker-machine ssh $DOCKER_MACHINE_NAME'
    alias dsh="ssh docker@$(docker-machine ip $DOCKER_MACHINE_NAME) -i $HOME/.ssh/id_docker_${DOCKER_MACHINE_NAME}_rsa"
    alias dmv='docker-machine version'
    alias dmh='_dmh(){ docker-machine $* --help; }; _dmh'
}

# Docker env
alias dtit='_dtit(){ echo -ne "\033]$mode;$DOCKER_MACHINE_NAME\007"; }; _dtit'
alias dvm='_dvm(){ export DOCKER_MACHINE_NAME=$1; dtit $1; unalias denv 2> /dev/null; denv; }; _dvm'
alias ddefault='dvm default'
alias dprod='dvm production'

### boot2docker
alias btdinit="pushd $DOCKER_HOME && ./boot2docker.sh --create-vm && popd && denv"
alias btd="pushd $DOCKER_HOME && ./boot2docker.sh && popd && denv"
alias btdre="pushd $DOCKER_HOME && ./boot2docker.sh --sync && ./boot2docker.sh --restart && popd && denv"
alias btdload="pushd $DOCKER_HOME && ./boot2docker.sh --load-images && popd && denv"
alias btdbck="pushd $DOCKER_HOME && ./boot2docker.sh --backup-images && popd && denv"
alias btdsync="pushd $DOCKER_HOME && ./boot2docker.sh --sync && popd && denv"
alias btdcrt="pushd $DOCKER_HOME && ./boot2docker.sh --regen-certs && popd && denv"
