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
set -x TERM rxvt-unicode-256color

set -g fish_greeting
set -g fish_color_user -o cyan

ssh-add ~/.ssh/id_rsa_github
