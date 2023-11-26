# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# OH MY ZSH THEME
ZSH_THEME=""

# PLUGINS
plugins=(git zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

# ALIAS
alias zshconfig="code ~/.zshrc"
alias zshreload="source ~/.zshrc"

# PROMPT
eval "$(starship init zsh)"

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# NVVM Auto load
# place this after nvm initialization!
autoload -U add-zsh-hook
load-nvmrc() {
  local node_version="$(nvm version)"
  local nvmrc_path="$(nvm_find_nvmrc)"

  if [ -n "$nvmrc_path" ]; then
    local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

    if [ "$nvmrc_node_version" = "N/A" ]; then
      nvm install
    elif [ "$nvmrc_node_version" != "$node_version" ]; then
      nvm use
    fi
  elif [ "$node_version" != "$(nvm version default)" ]; then
    echo "Reverting to nvm default version"
    nvm use default
  fi
}
add-zsh-hook chpwd load-nvmrc
load-nvmrc

# PYENV
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init --path)"
fi

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/pedrofidalgo/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/pedrofidalgo/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/pedrofidalgo/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/pedrofidalgo/Downloads/google-cloud-sdk/completion.zsh.inc'; fi
