export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="avit"
alias tmux="TERM=screen-256color-bce tmux"

plugins=(git osx brew node npm sudo tmux kubectl)

source $ZSH/oh-my-zsh.sh

# User configuration

export PATH="/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin"

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

export ANDROID_HOME=/usr/local/opt/android-sdk # Add Android SDK
export PATH="$PATH:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools" # Add Android
export GRADLE_HOME=/usr/local/gradle-2.4
export PATH=${PATH}:$GRADLE_HOME/bin

# env vars
source <(sed -E -n 's/[^#]+/export &/ p' ~/.env)

# added by travis gem
#[ -f /Users/dannyt/.travis/travis.sh ] && source /Users/dannyt/.travis/travis.sh

. `brew --prefix`/etc/profile.d/z.sh

# nvm
export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh

alias fuck='eval $(thefuck $(fc -ln 0 | tail -n 1)); fc -R'
# alias vim='/usr/local/Cellar/vim/7.4.903/bin/vim'
alias vim='/usr/local/bin/nvim'

alias k='/usr/local/bin/kubectl'

#if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

export PATH=/usr/local/bin:/usr/local/sbin:$PATH
export PATH=/usr/local/Cellar/python/3.6.5:$PATH
export PATH=~/.bin:$PATH

# mux
source ~/.bin/tmuxinator.zsh

#PATH="/Users/danny/perl5/bin${PATH:+:${PATH}}"; export PATH;
#PERL5LIB="/Users/danny/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
#PERL_LOCAL_LIB_ROOT="/Users/danny/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
#PERL_MB_OPT="--install_base \"/Users/danny/perl5\""; export PERL_MB_OPT;
#PERL_MM_OPT="INSTALL_BASE=/Users/danny/perl5"; export PERL_MM_OPT;
