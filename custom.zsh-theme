function short_pwd {
  dir=${PWD/$HOME/\~}
  a=("${(s:/:)dir}")
  dir=""
  if [[ $a[1] == \~ ]] {
    dir="~"
  }
  len=$#a
  for p in $a[2,$len-1]; do
    dir="$dir/$p[1]"
  done
  if [[ $len > 1 ]] {
    dir="$dir/$a[$len]"
  }
  echo $dir
}

function venv {
  v=""
  if [ ! -z "$VIRTUAL_ENV" ]; then
    v=" %F{yellow}(`basename \"$VIRTUAL_ENV\"`)"
  fi
  echo $v
}

PROMPT='%F{green}$(short_pwd) %F{cyan}[%f '
#RPROMPT='$(git_prompt_info) %F{cyan}] %F{yellow}%D{%H:%M}%f$(venv)'
RPROMPT='$(git_prompt_info) %F{cyan}]$(venv)'

ZSH_THEME_GIT_PROMPT_PREFIX="%F{magenta}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%f"
ZSH_THEME_GIT_PROMPT_DIRTY=" %F{red}*%f"
ZSH_THEME_GIT_PROMPT_CLEAN=""
