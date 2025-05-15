# ZSH Config

export ZSH="$HOME/.oh-my-zsh"

# ZSH_THEME="guill3m"

COMPLETION_WAITING_DOTS="true"

plugins=(
  1password
  brew
  docker
  git
  iterm2
  jsontools
  macos
  npm
  nvm
  ssh-agent
  vscode
)
source $ZSH/oh-my-zsh.sh

# No duplicates when searching history
setopt HIST_FIND_NO_DUPS

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='nano'
else
  export EDITOR='nano'
fi

# SSH
export SSH_KEY_PATH="~/.ssh/id_ed25519"

export GPG_TTY=$(tty)

# iTerm2 shell integration
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# bun completions
[ -s "/Users/guill3m/.bun/_bun" ] && source "/Users/guill3m/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"

# oh-my-posh
eval "$(oh-my-posh init zsh)"
