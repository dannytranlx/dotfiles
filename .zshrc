export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="robbyrussell"
alias tmux="TERM=screen-256color-bce tmux"

plugins=(git sublime osx bower brew node npm nyan sudo tmux)

source $ZSH/oh-my-zsh.sh

# User configuration

export PATH="/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin"

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

export PATH="$PATH:$HOME/../../Applications/play-1.2.7" # Add Play

export ANDROID_HOME=/usr/local/opt/android-sdk # Add Android SDK
export PATH="$PATH:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools" # Add Android
export GRADLE_HOME=/usr/local/gradle-2.4
export PATH=${PATH}:$GRADLE_HOME/bin

# added by travis gem
[ -f /Users/dannyt/.travis/travis.sh ] && source /Users/dannyt/.travis/travis.sh

. `brew --prefix`/etc/profile.d/z.sh

# nvm
export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh

alias fuck='eval $(thefuck $(fc -ln -1 | tail -n 1)); fc -R'
