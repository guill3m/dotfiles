local box_name() {
  local box="${SHORT_HOST:-$HOST}"
  [[ -f ~/.box-name ]] && box="$(< ~/.box-name)"
  echo "${box:gs/%/%%}"
}

local npm_prompt_info() {
  which npm &>/dev/null || return
  local npm_prompt=${$(npm -v)}
  echo "${ZSH_THEME_NPM_PROMPT_PREFIX}${npm_prompt:gs/%/%%}${ZSH_THEME_NPM_PROMPT_SUFFIX}"
}

local yarn_prompt_info() {
  which yarn &>/dev/null || return
  local yarn_prompt=${$(yarn -v)}
  echo "${ZSH_THEME_YARN_PROMPT_PREFIX}${yarn_prompt:gs/%/%%}${ZSH_THEME_YARN_PROMPT_SUFFIX}"
}

local js_prompt_info() {
  local js_info
  if [[ -f package.json || -d node_modules || -f *.js ]] then
    js_info="‹$(nvm_prompt_info)"
    if [[ -f package-lock.json ]] then
      js_info+=", $(npm_prompt_info)"
    fi
    if [[ -f yarn.lock ]] then
      js_info+=", $(yarn_prompt_info)"
    fi
    js_info+="› "
  fi
  echo "${js_info}"
}

PROMPT='%{$fg[magenta]%}$(box_name): '
PROMPT+='%{$fg_bold[cyan]%}%c%{$reset_color%} $(git_prompt_info)'
PROMPT+='%{$fg[yellow]%}$(js_prompt_info)'
PROMPT+='%(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ )'
PROMPT+='%{$reset_color%}'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%}git:(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg_bold[blue]%}) %{$fg_bold[yellow]%}✗"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg_bold[blue]%})"
ZSH_THEME_NPM_PROMPT_PREFIX="npm-"
ZSH_THEME_NVM_PROMPT_PREFIX="node-"
ZSH_THEME_YARN_PROMPT_PREFIX="yarn-"
