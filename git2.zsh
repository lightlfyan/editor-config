function git_prompt_info2() {
  if [[ "$(command git config --get oh-my-zsh.hide-status 2>/dev/null)" != "1" ]]; then
    ref=$(command git symbolic-ref HEAD 2> /dev/null) || \
    ref=$(command git rev-parse --short HEAD 2> /dev/null) || return 0
    upstream=$(command git rev-parse --abbrev-ref --symbolic-full-name @{u} 2> /dev/null) || \
    upstream="empty"
    symbol=" => "
    echo "$ZSH_THEME_GIT_PROMPT_PREFIX${ref#refs/heads/}$(parse_git_dirty)${symbol}${upstream}$ZSH_THEME_GIT_PROMPT_SUFFIX"
  fi
}
