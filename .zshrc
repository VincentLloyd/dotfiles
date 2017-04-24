# PATH
# —————————————————————————

# if shell in tmux, clear path and reconstruct
if [ -f /etc/profile ]; then
    PATH=""
    source /etc/profile
fi

# remove duplicate $FPATH dirs
typeset -U fpath

# if directory not present, prepend it to $PATH
pathPrepend() {
    if [ -d "$1" ] && [[ ":$PATH:" != *":$1:"* ]]; then
        PATH="$1${PATH:+":$PATH"}"
    fi
}

# python dir
pathPrepend $HOME/Library/Python/3.6/bin

# rbenv dir
pathPrepend $HOME/.rbenv/shims

# enable rbenv command line completion
. $HOME/.rbenv/completions/rbenv.zsh

# ALIASES
# —————————————————————————

# load custom aliases
source $HOME/.aliases

# OH-MY-ZSH
# —————————————————————————

# path to oh-my-zsh
export ZSH=$HOME/.oh-my-zsh

# plugin list
plugins=(colored-man-pages extract git ruby ssh-agent z)

# ssh-agent forwarding support
zstyle :omz:plugins:ssh-agent agent-forwarding on

# z plugin
. $HOME/.oh-my-zsh/plugins/z/z.sh

# thefuck plugin
eval $(thefuck --alias) 

# load oh-my-zsh settings
source $ZSH/oh-my-zsh.sh

# load zsh syntax highlighting plugin
source $HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# POWERLINE
# —————————————————————————

# initialise powerline daemon
powerline-daemon -q

# set powerline env variables
export POWERLINE_CONFIG_COMMAND=$HOME/Library/Python/3.6/bin/powerline-config
export POWERLINE_COMMAND=$HOME/Library/Python/3.6/bin/powerline

# powerline config - load powerline for zsh
# [ -r FILE ] True if FILE exists and is readable.
if [[ -r $HOME/Library/Python/3.6/lib/python/site-packages/powerline/bindings/zsh/powerline.zsh ]]; then
    . $HOME/Library/Python/3.6/lib/python/site-packages/powerline/bindings/zsh/powerline.zsh
fi
