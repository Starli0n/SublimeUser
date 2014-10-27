# .bashrc

################
### VARIABLE ###
################

export PACKAGE="$HOME/Library/Application\ Support/Sublime\ Text\ 2/Packages"
export STPYBIN="$PACKAGE/User/Resources/Any/bin"
export CURL_CA_BUNDLE=/usr/local/share/ca-bundle.crt
export XDEBUG_SESSION=sublime.xdebug
export EDITOR='subl -a'


#############
### ALIAS ###
#############

### Misc
alias cls='clear'
alias ..='cd ..'
alias cd..='cd ..'
alias pkg="cd $PACKAGE"
alias ll='ls -l'
alias path='echo -e ${PATH//:/\\n}'
alias lib='echo -e ${LD_LIBRARY_PATH//:/\\n}'
alias reload='source $HOME/.bashrc'
alias rapache='sudo /usr/sbin/apachectl restart' # Restart apache with XDEBUG_SESSION

### Git
alias g='git'
alias gi='git'
alias gg="$STPYBIN/colorcfg.py $HOME/.gitconfig"
alias gh='cat $HOME/.gitconfig'

### Sublime Text
alias subl='$EDITOR'
