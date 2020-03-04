(cat ~/.cache/wal/sequences &)
# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
 export ZSH="/home/joseph/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="risto"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
plugins=(git npm copyfile extract python vi-mode zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh
source ~/.config/zsh/abbreviations.zsh

if [[ $TERM == xterm-termite ]]; then
  . /etc/profile.d/vte.sh
  __vte_osc7
fi

# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
# _comp_options+=(globdots)

# User configuration
export EDITOR=nvim
export VISUAL=nvim
export PATH=/usr/lib/jvm/java-13-openjdk/bin/:/home/joseph/.local/bin:~/.npm-global/bin:/home/joseph/.gem/ruby/2.6.0/bin/:$PATH
export npm_config_prefix=~/.npm-global
export NODE_PATH=~/.npm-global/lib/node_modules/:~/.config/yarn/global/node_modules/

alias ls="lsd"
alias cat="bat"
alias v="$EDITOR"
alias o="mimeo"
alias rm="rm -I"
alias :q="exit"
alias :wq="exit"
alias h="http"

HISTSIZE=100000000
HISTFILESIZE=100000000
SAVEHIST=100000000
export HISTSIZE=100000000
export HISTFILESIZE=100000000
export SAVEHIST=100000000
