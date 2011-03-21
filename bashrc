# .bashrc

# User specific aliases and functions
alias vi=vim
alias ls='ls -G'
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias s=sudo
alias :='cd ..'
alias ::='cd ../../'
alias :::='cd ../../../'
alias ::::='cd ../../../../'
alias :::::='cd ../../../../../'
alias ::::::='cd ../../../../../../'
alias lst='ls -t'
alias llt='ls -lt'
alias h='history -800'
alias oc='history -800 | grep -i'
alias makelog='make 2>&1 | tee log.mk'

if [ -f /etc/bashrc ]; then
  . /etc/bashrc
fi

export PS1="[\u: \W]\$ "
export VISUAL=vi

export P4CONFIG=.p4config
case $TERM in
  xterm*)
  #stty erase ^\? kill ^U intr ^C -decctlq
  export PROMPT_COMMAND="echo -ne \"\033]0;${PWD}\007\""
  ;;
esac
