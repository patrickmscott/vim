alias rm 'rm -i'
alias cp 'cp -i'
alias mv 'mv -i'
alias : 'cd ../'
alias :: 'cd ../../'
alias ::: 'cd ../../../'
alias :::: 'cd ../../../../'
alias ::::: 'cd ../../../../../'
alias :::::: 'cd ../../../../../../'
alias ::::::: 'cd ../../../../../../../'
alias :::::::: 'cd ../../../../../../../../'

set -x VISUAL vi
set -x TERM xterm-256color

set -g fish_greeting
set -g fish_color_user -o cyan
