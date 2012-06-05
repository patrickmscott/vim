# .bashrc

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

if [ -f /etc/bashrc ]; then
  . /etc/bashrc
fi

export VISUAL=vi
export P4CONFIG=.p4config
export PATH=$PATH:/src/go/bin:/opt/hypertable/current/bin:/var/lib/gems/1.8/bin
export GOROOT=/src/go
