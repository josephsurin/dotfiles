# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/joseph/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
# ZSH_THEME="risto"
ZSH_THEME="powerlevel10k/powerlevel10k"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
plugins=(git npm copyfile extract python zsh-vi-mode zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh
source ~/.config/zsh/abbreviations.zsh

if [[ $TERM == xterm-termite ]]; then
  . /etc/profile.d/vte.sh
  __vte_osc7
fi

# (cat ~/.cache/wal/sequences &)

# Base16 Shell
BASE16_SHELL="$HOME/.config/base16-shell/"
[ -n "$PS1" ] && \
    [ -s "$BASE16_SHELL/profile_helper.sh" ] && \
        eval "$("$BASE16_SHELL/profile_helper.sh")"

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
export PATH=/home/joseph/.cargo/bin:/home/joseph/.nimble/bin/:/usr/lib/jvm/java-14-openjdk/bin/:/home/joseph/.local/bin:~/.npm-global/bin:/home/joseph/.gem/ruby/2.7.0/bin/:~/bin:$PATH
export npm_config_prefix=~/.npm-global
export NODE_PATH=~/.npm-global/lib/node_modules/:~/.config/yarn/global/node_modules/
export MANPAGER="sh -c 'col -bx | bat -l man -p'"

alias ls="exa"
alias cat="bat"
alias v="$EDITOR"
alias o="mimeo"
alias rm="rm -I"
alias :q="exit"
alias :wq="exit"
alias h="http"
alias genpw="python -c 'import random; import string; print(\"\".join(random.choice(string.ascii_uppercase + string.ascii_lowercase + string.digits) for _ in range(28)))'"
alias glog='git log --pretty=format:"%Cblue%h %C(118)%ad%x09%C(220)%<(10)%an%x09%Creset%s %C(196)%d" --date=short --graph'

HISTSIZE=100000000
HISTFILESIZE=100000000
SAVEHIST=100000000
export HISTSIZE=100000000
export HISTFILESIZE=100000000
export SAVEHIST=100000000

autoload edit-command-line; zle -N edit-command-line
bindkey -M vicmd v edit-command-line

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
ZLE_RPROMPT_INDENT=0
DISABLE_UNTRACKED_FILES_DIRTY="true"
ZVM_VI_INSERT_ESCAPE_BINDKEY=jk
