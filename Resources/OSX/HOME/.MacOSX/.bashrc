# .bashrc

################
### VARIABLE ###
################

export BASHRC_FILE="$HOME/.MacOSX/.bashrc"
export PATH="/Library/Frameworks/Python.framework/Versions/2.7/bin:${PATH}"
export PATH="/usr/local/bin:${PATH}"
export PACKAGE="$HOME/Library/Application\ Support/Sublime\ Text\ 2/Packages"
export STPYSRC="$PACKAGE/User/Resources/Any/src"
export CURL_CA_BUNDLE=/usr/local/share/ca-bundle.crt
export XDEBUG_SESSION=sublime.xdebug
export EDITOR='subl -a'
export WORK=$HOME/Sites

#############
### ALIAS ###
#############

### aliases
alias ralias='source $BASHRC_FILE'
alias aliases='subl $BASHRC_FILE'
#alias unalias=unalias
alias aliash='cat $BASHRC_FILE'

### Shell
alias cls='clear'
alias ll='ls -lG'
alias la='ls -laG'
alias spath='echo -e ${PATH//:/\\n}'
#alias upath=
alias lib='echo -e ${LD_LIBRARY_PATH//:/\\n}'
#alias which=which
alias ..='cd ..'
alias cd..='cd ..'
#alias cdh='cd'
alias ph='pushd $*'
alias pp='popd $*'
alias e.='open .'
alias hist='cat $HOME/.bash_history'
alias clsh='cat /dev/null>$HOME/.bash_history'

### Git
alias g='git'
alias gl='git log --pretty=oneline --color --abbrev-commit --graph --decorate --all'
alias gll='git log --pretty=oneline --color --abbrev-commit --graph --decorate --first-parent'
alias gst='git status $*'
alias gdt='git difftool $*'
alias gg="$STPYSRC/colorcfg.py $HOME/.gitconfig"
alias gh='cat $HOME/.gitconfig'
alias gv='git --version'

### Sublime Text
alias subl='$EDITOR'
alias subld='subl -n "$(pwd)"'
alias pkg="cd $PACKAGE"
alias pkgu="cd $PACKAGE/User"
alias work="cd $WORK"

### Tools
alias rapache='sudo /usr/sbin/apachectl restart' # Restart apache with XDEBUG_SESSION
alias ver='which git;git --version;which python;python --version'

### npm
alias npmi='npm install --save $*'
alias npmid='npm install --save-dev $*'
alias npmu='npm uninstall --save $*'
alias npmud='npm uninstall --save-dev $*'

### Gulp
alias gp='gulp $*'

### Composer
alias cpr='composer $*'
alias cpru='composer update'
alias cpr_='composer require $*'
alias cprd='composer require --dev $*'
alias cprr='composer remove $*'
alias cprrd='composer remove --dev $*'

### docker
alias d='docker $*'
alias dr='docker run $*'
alias drn='docker run --name $*'
alias dri='docker run -it $*'
alias dh='docker $* --help'
alias dhw='docker run hello-world'
alias denv='eval $(docker-machine env default)'
alias dps='docker ps'
alias dl='docker ps -lq'
alias di='docker images'
alias dp='docker pull $*'
alias ddt='docker diff $*'
alias dci='docker commit $*'
alias ds='docker save -o %USR_ROOT%\Docker\Image\$1.tar $1'
alias dload='docker load -i %USR_ROOT%\Docker\Image\$1.tar'
alias drm='docker rm -f $*'
alias drmi='docker rmi $*'
alias dinf='docker info'
alias dsh='ssh docker@$(docker-machine ip default)'
alias dv='docker version'

### docker-machine
alias dm='docker-machine $*'
alias dmcreate='docker-machine create --driver virtualbox default'
alias dmcrt='docker-machine regenerate-certs default'
alias dmrm='docker-machine rm default'
alias dmls='docker-machine ls $*'

alias dmstart='docker-machine start default'
alias dmstop='docker-machine stop default'
alias dmrestart='docker-machine stop default && docker-machine start default && dsh'
alias dmstatus='docker-machine status default'

alias dmsh='docker-machine ssh default'
alias dmv='docker-machine version'
alias dmh='docker-machine $* --help'
