# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="custom"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
unalias : > /dev/null 2>&1

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Uncomment this to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment following line if you want to  shown in the command execution time stamp 
# in the history command output. The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|
# yyyy-mm-dd
# HIST_STAMPS="mm/dd/yyyy"

ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern)

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(gitignore git go golang ant python ssh-agent svn vagrant vi-mode zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# Custom hightlight colors
ZSH_HIGHLIGHT_STYLES[alias]='fg=026'
ZSH_HIGHLIGHT_STYLES[builtin]='fg=026'
ZSH_HIGHLIGHT_STYLES[function]='fg=026'
ZSH_HIGHLIGHT_STYLES[command]='fg=026'
ZSH_HIGHLIGHT_STYLES[precommand]='fg=026,underline'
ZSH_HIGHLIGHT_STYLES[hashed-command]='fg=026'
ZSH_HIGHLIGHT_STYLES[path]='fg=039'
ZSH_HIGHLIGHT_STYLES[path_prefix]='fg=039,underline'
ZSH_HIGHLIGHT_STYLES[globbing]='fg=blue,bold'
ZSH_HIGHLIGHT_STYLES[single-hyphen-option]='fg=039'
ZSH_HIGHLIGHT_STYLES[double-hyphen-option]='fg=039'

# User configuration

export PATH="/usr/lib/lightdm/lightdm:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games"
# export MANPATH="/usr/local/man:$MANPATH"

# # Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"
#

# Set all aliases at the end to avoid setting the : alias.
alias rm="rm -i"
alias cp="cp -i"
alias mv="mv -i"
alias :="cd ../"
alias ::="cd ../../"
alias :::="cd ../../../"
alias ::::="cd ../../../../"
alias :::::="cd ../../../../../"
alias ::::::="cd ../../../../../../"
alias :::::::="cd ../../../../../../../"
alias ::::::::="cd ../../../../../../../../"

export VISUAL=vi
export TERM=xterm-256color
ssh-add ~/.ssh/id_rsa_github > /dev/null 2>&1

zstyle ':completion:*' list-colors "${(@s.:.)LS_COLORS}"
