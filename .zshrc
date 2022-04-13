# ZSH Config
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="guill3m"
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
  thefuck
  vscode
  zsh-autosuggestions
)
source $ZSH/oh-my-zsh.sh

# No duplicates when searching history
setopt HIST_FIND_NO_DUPS

# Browser
export BROWSER='/usr/bin/firefox-developer-edition'

# SSH
export SSH_KEY_PATH="~/.ssh/rsa_id"

# iTerm2 shell integration
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# Shortcuts
website="~/Work/website-next"
