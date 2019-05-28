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

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
HIST_STAMPS="%d/%m/%Y %T"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git npm copyfile extract python vi-mode zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh
source ~/.config/zsh/abbreviations.zsh

# User configuration
export EDITOR=vim
export VISUAL=vim
export PATH=~/.npm-global/bin:$PATH

alias ls="lsd"
alias lst="ls --tree"
alias cdds="cd ~/Downloads/shit"
alias ds="~/Downloads/shit"
alias cat="bat"
alias lsg="ls | grep "
alias hsg="history | grep "
alias cdctf="cd ~/Libraries/Code/ctf-notes/"
alias v="vim"
alias hs="history"
alias cdln="cd ~/Libraries/Notes/"
alias cdln="cd ~/Libraries/Code/"
alias cdu="cd ~/Libraries/uni/"
alias cdc="cd ~/.config/"
alias dua="du -ah"
alias dus="du -sh"
alias dl="http --download"
alias vz="v ~/.zshrc"
alias vabbs="v ~/.config/zsh/abbreviations.zsh"
alias vi3="v ~/.config/i3/config"
alias jn="jupyter-notebook"
alias xc="xclip -selection clipboard"
alias b64="base64"
alias b64d="base64 -d"
alias vfz="vim \"\$(fzf --reverse --inline-info)\""
alias cfz="cat \"\$(fzf --reverse --inline-info)\""
alias cdfz="cd \"\$(dirname \"\$(fzf --reverse --inline-info)\")    \""
alias cpv="rsync -ah --progress"
alias cdm="cd /run/media/joseph/"
alias qemu="qemu-system-x86_64"
alias pi="python -i"
alias 2dv="2>/dev/null"
alias _="\"$_\""
alias ws="~/.config/scripts/walswitch.sh"
alias cdw="cd ~/Downloads/wallpapers"
