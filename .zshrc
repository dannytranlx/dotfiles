# Zsh completions
autoload -Uz compinit && compinit
FPATH="$(brew --prefix)/share/zsh/site-functions:$FPATH"

# kubectl completions
source <(kubectl completion zsh)

# Initialize Starship prompt
eval "$(starship init zsh)"

# User configuration

export PATH="/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin"

export ANDROID_HOME=/usr/local/opt/android-sdk # Add Android SDK
export PATH="$PATH:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools" # Add Android
export GRADLE_HOME=/usr/local/gradle-2.4
export PATH=${PATH}:$GRADLE_HOME/bin

# added by travis gem
#[ -f /Users/dannyt/.travis/travis.sh ] && source /Users/dannyt/.travis/travis.sh

eval "$(/opt/homebrew/bin/brew shellenv)"

. `brew --prefix`/etc/profile.d/z.sh
. /opt/homebrew/opt/asdf/libexec/asdf.sh

# nvm
export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh

# Aliases
source ~/.aliases

export PATH=/usr/local/bin:/usr/local/sbin:$PATH
export PATH=/usr/local/Cellar/python@3.8/3.8.6_1/bin:$PATH
#export PATH="/usr/local/opt/ruby/bin:$PATH"
export PATH=~/.bin:$PATH
export PATH="/opt/homebrew/bin:$PATH"
export PATH="/Users/datran/Library/Python/2.7/bin:$PATH"

# mux
# source ~/.bin/tmuxinator.zsh
export THEFUCK_REQUIRE_CONFIRMATION='false'

#PATH="/Users/danny/perl5/bin${PATH:+:${PATH}}"; export PATH;
#PERL5LIB="/Users/danny/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
#PERL_LOCAL_LIB_ROOT="/Users/danny/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
#PERL_MB_OPT="--install_base \"/Users/danny/perl5\""; export PERL_MB_OPT;
#PERL_MM_OPT="INSTALL_BASE=/Users/danny/perl5"; export PERL_MM_OPT;
export PATH="/usr/local/opt/qt/bin:$PATH"
export PATH=$PATH:~/Downloads/gcc-arm-none-eabi-5_4-2016q3/bin/
export HOMEBREW_NO_AUTO_UPDATE=1

source ~/workspace/kubectl_config/dotfiles/kubectl_stuff.bash

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/datran/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/datran/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/datran/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/datran/Downloads/google-cloud-sdk/completion.zsh.inc'; fi
#export PATH="/usr/local/opt/ruby@2.7/bin:$PATH"
#export PATH="/opt/homebrew/opt/ruby@2.6/bin:$PATH"
export ZENDESK_CODE_DIR=~/workspace
# BEGIN ZDI
export DOCKER_FOR_MAC_ENABLED=true
source /Users/datran/workspace/zdi/dockmaster/zdi.sh
# END ZDI

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

source /Users/datran/.docker/init-zsh.sh || true # Added by Docker Desktop
source /Users/datran/workspace/scooter/scripts/shell/scooter.sh

export LDFLAGS="-L/opt/homebrew/opt/libffi/lib"
export CPPFLAGS="-I/opt/homebrew/opt/libffi/include"
export PKG_CONFIG_PATH="/opt/homebrew/opt/libffi/lib/pkgconfig"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
export PATH=$PATH:/Users/datran/bin

# env vars
source <(sed -E -n 's/[^#]+/export &/ p' ~/.env)


[[ -s "/Users/datran/.gvm/scripts/gvm" ]] && source "/Users/datran/.gvm/scripts/gvm"
export PATH="/opt/homebrew/opt/mysql@8.4/bin:$PATH"

export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init - zsh)"

. "$HOME/.local/bin/env"

# History search: type prefix, then up/down arrow to find matches
# (placed at end to avoid being overridden)
autoload -U up-line-or-beginning-search down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey '^[[A' up-line-or-beginning-search
bindkey '^[[B' down-line-or-beginning-search
bindkey '^[OA' up-line-or-beginning-search
bindkey '^[OB' down-line-or-beginning-search
