export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="robbyrussell"
alias tmux="TERM=screen-256color-bce tmux"

plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

export PATH="/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin"

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
