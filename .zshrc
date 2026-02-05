# Homebrew + PATH
export HOMEBREW_NO_AUTO_UPDATE=1
eval "$(/opt/homebrew/bin/brew shellenv)"

typeset -U path
path=(
  "$HOME/.asdf/shims"
  "$HOME/.asdf/bin"
  /opt/homebrew/bin
  /opt/homebrew/sbin
  /usr/local/bin
  /usr/local/sbin
  /usr/bin
  /bin
  /usr/sbin
  /sbin
  $path
)

path+=(
  "$HOME/.local/bin"
  "$HOME/.bin"
  "$HOME/bin"
  "$HOME/.yarn/bin"
  "$HOME/.config/yarn/global/node_modules/.bin"
  "/Users/datran/bin"
  "/Users/datran/.opencode/bin"
)

ASDF_DIR="$(brew --prefix asdf 2>/dev/null)"
if [[ -n "$ASDF_DIR" && -d "$ASDF_DIR/completions" ]]; then
  fpath=("$ASDF_DIR/completions" $fpath)
fi

FPATH="$(brew --prefix)/share/zsh/site-functions:$FPATH"
autoload -Uz compinit && compinit -C

# Initialize Starship prompt
eval "$(starship init zsh)"

# Make Option+Backspace stop at path separators (/, ., ~, etc.)
WORDCHARS='*?_[]$&;!#%^{}<>'

# Aliases
source ~/.aliases

# Version manager (asdf only)
[[ -s "/opt/homebrew/opt/asdf/libexec/asdf.sh" ]] && . "/opt/homebrew/opt/asdf/libexec/asdf.sh"
export ASDF_NODEJS_LEGACY_FILE_DYNAMIC_STRATEGY=latest_installed

# Tooling and SDKs

export LDFLAGS="-L/opt/homebrew/opt/libffi/lib"
export CPPFLAGS="-I/opt/homebrew/opt/libffi/include"
export PKG_CONFIG_PATH="/opt/homebrew/opt/libffi/lib/pkgconfig"

# Shell integrations
_load_kubectl_completion() {
  unfunction _load_kubectl_completion 2>/dev/null || true
  command -v kubectl >/dev/null 2>&1 && source <(kubectl completion zsh)
}
if command -v kubectl >/dev/null 2>&1; then
  compdef _load_kubectl_completion kubectl
fi
[[ -f "$HOME/workspace/kubectl_config/dotfiles/kubectl_stuff.bash" ]] && source "$HOME/workspace/kubectl_config/dotfiles/kubectl_stuff.bash"

if [[ -f "$HOME/Downloads/google-cloud-sdk/path.zsh.inc" ]]; then
  . "$HOME/Downloads/google-cloud-sdk/path.zsh.inc"
fi
if [[ -f "$HOME/Downloads/google-cloud-sdk/completion.zsh.inc" ]]; then
  . "$HOME/Downloads/google-cloud-sdk/completion.zsh.inc"
fi

export ZENDESK_CODE_DIR="$HOME/workspace"

export DOCKER_FOR_MAC_ENABLED=true
[[ -f "$HOME/workspace/zdi/dockmaster/zdi.sh" ]] && source "$HOME/workspace/zdi/dockmaster/zdi.sh"
[[ -f "$HOME/.docker/init-zsh.sh" ]] && source "$HOME/.docker/init-zsh.sh"
[[ -f "$HOME/workspace/scooter/scripts/shell/scooter.sh" ]] && source "$HOME/workspace/scooter/scripts/shell/scooter.sh"

[ -f "$HOME/.fzf.zsh" ] && source "$HOME/.fzf.zsh"
if command -v zoxide >/dev/null 2>&1; then
  eval "$(zoxide init zsh)"
elif [[ -f "$(brew --prefix)/etc/profile.d/z.sh" ]]; then
  . "$(brew --prefix)/etc/profile.d/z.sh"
fi

export THEFUCK_REQUIRE_CONFIRMATION='false'

if [[ -f "$HOME/.env" ]]; then
  source <(sed -E -n 's/[^#]+/export &/ p' "$HOME/.env")
fi

[[ -f "$HOME/.local/bin/env" ]] && . "$HOME/.local/bin/env"

# History search: type prefix, then up/down arrow to find matches
autoload -U up-line-or-beginning-search down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey '^[[A' up-line-or-beginning-search
bindkey '^[[B' down-line-or-beginning-search
bindkey '^[OA' up-line-or-beginning-search
bindkey '^[OB' down-line-or-beginning-search
