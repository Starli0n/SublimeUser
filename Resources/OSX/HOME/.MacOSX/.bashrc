# .bashrc

################
### VARIABLE ###
################

export PATH="/Library/Frameworks/Python.framework/Versions/2.7/bin:${PATH}"
export PACKAGE="$HOME/Library/Application\ Support/Sublime\ Text\ 2/Packages"
export STPYSRC="$PACKAGE/User/Resources/Any/src"
export CURL_CA_BUNDLE=/usr/local/share/ca-bundle.crt
export XDEBUG_SESSION=sublime.xdebug
export EDITOR='subl -a'
export WORK=$HOME/Sites

#############
### ALIAS ###
#############

### Misc
alias cls='clear'
alias ..='cd ..'
alias cd..='cd ..'
alias pkg="cd $PACKAGE"
alias pkgu="cd $PACKAGE/User"
alias work='cd $WORK'
alias ll='ls -l'
alias path='echo -e ${PATH//:/\\n}'
alias lib='echo -e ${LD_LIBRARY_PATH//:/\\n}'
alias imp='source $HOME/.MacOSX/.bashrc'
alias rapache='sudo /usr/sbin/apachectl restart' # Restart apache with XDEBUG_SESSION
alias ver='which git;git --version;which python;python --version'

### Git
alias g='git'
alias gi='git'
alias gg="$STPYSRC/colorcfg.py $HOME/.gitconfig"
alias gh='cat $HOME/.gitconfig'

### Sublime Text
alias subl='$EDITOR'
