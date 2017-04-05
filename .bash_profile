if [ -f ~/.bashrc ]; then
   . ~/.bashrc
fi

# load the default .profile
[[ -s "$HOME/.profile" ]] && . "$HOME/.profile"

export PKG_CONFIG_PATH=/usr/local/Cellar/imagemagick@6/6.9.7-9/lib/pkgconfig

# prompt definition
export PS1="\[\033[38;5;10m\]\u@\H\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]\[\033[38;5;10m\]\W\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput bold)\]\[$(tput sgr0)\]\[\033[38;5;10m\]\\$\[$(tput sgr0)\]\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]"

export NVM_DIR=~/.nvm
. $(brew --prefix nvm)/nvm.sh

# load RVM into a shell session *as a function*
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"

. ~/.aliases