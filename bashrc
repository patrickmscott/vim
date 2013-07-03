# .bashrc

unalias : 2>/dev/null

if [ -f /etc/bashrc ]; then
  . /etc/bashrc
elif [ -f /etc/skel/.bashrc ]; then
  . /etc/skel/.bashrc
fi

# User specific aliases and functions
alias vi=vim
alias ls='ls -G --color'
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias :='cd ..'
alias ::='cd ../../'
alias :::='cd ../../../'
alias ::::='cd ../../../../'
alias :::::='cd ../../../../../'
alias ::::::='cd ../../../../../../'
alias :::::::='cd ../../../../../../../'
alias ::::::::='cd ../../../../../../../'

export PS1="\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\W\[\033[00m\]\$ "
export VISUAL=vi

TERM=xterm-256color
GOROOT=/usr/local/src/go
PATH=$PATH:/usr/local/src/go/bin
