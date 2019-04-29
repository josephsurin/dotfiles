setopt extendedglob

typeset -A abbrevs

# General aliases
abbrevs=(
  "ll"		"ls -al"
  "l1"		"ls -1"
  "lst"		"ls --tree"
  "lsg"		"ls | grep"
  "hsg"		"history | grep"
  "hs"		"history"
  "lsth"	"ls -t | head -n 10"
  "mdc"		"mkdir -p __CURSOR__ && cd \$_"
  "dua"		"du -ah"
  "dus"		"du -sh"
  "fdg"		"find . | grep"
  "pgr"		"| grep"
  "awkp"	"| awk '{print \$__CURSOR__}'"
  "tstamp"	"| while read line; do ; echo \$(date | cut -f4 -d ' ') \$line; done"
  "epoch"	"date +%s"
  "epochms"	'echo $(($(gdate +%s%N)/1000000))'
)

# Directory aliases
abbrevs+=(
  "cdds"	"cd ~/Downloads/shit"
  "ds"		"~/Downloads/shit"
  "cdctf"	"cd ~/Libraries/Code/ctf-notes/"
  "cdln"	"cd ~/Libraries/Notes/"
  "cdlc"	"cd ~/Libraries/Code/"
  "cdu"		"cd ~/Libraries/uni/"
  "cdc"		"cd ~/.config/"
)

# File aliases
abbrevs+=(
  "vz"		"v ~/.zshrc"
  "vabbs"	"v ~/.config/zsh/abbreviations.zsh"
  "vi3"		"v ~/.config/i3/config"
)

# git aliases
abbrevs+=(
  "ga"		"git add"
  "gaa"		"git add ."
  "gcm"		"git commit -m '__CURSOR__'"
  "gp"		"git push"
  "gpl"		"git pull"
  "gst"		"git status"
  "gcl"		"git clone"
)

# Program aliases
abbrevs+=(
  "dl"		"http --download"
  "jn"		"jupyter-notebook"
  "xc"		"xclip -selection clipboard"
  "b64"		"base64"
  "b64d"	"base64 -d"
  "mpdf"	"man -Tpdf __CURSOR__ | zathura -"
  "vfz"		"vim \"\$(fzf --reverse --inline-info)\""
  "cfz"		"cat \"\$(fzf --reverse --inline-info)\""
  "cdfz"	"cd \"\$(dirname \"\$(fzf --reverse --inline-info)\")\""
)

for abbr in ${(k)abbrevs}; do
  alias $abbr="${abbrevs[$abbr]}"
done

magic-abbrev-expand() {
  local MATCH
  LBUFFER=${LBUFFER%%(#m)[_a-zA-Z0-9]#}
  command=${abbrevs[$MATCH]}
  LBUFFER+=${command:-$MATCH}

  if [[ "${command}" =~ "__CURSOR__" ]]; then
    RBUFFER=${LBUFFER[(ws:__CURSOR__:)2]}
    LBUFFER=${LBUFFER[(ws:__CURSOR__:)1]}
  else
    zle self-insert
  fi
}

magic-abbrev-expand-and-execute() {
  magic-abbrev-expand
  zle backward-delete-char
  zle accept-line
}

no-magic-abbrev-expand() {
  LBUFFER+=' '
}

zle -N magic-abbrev-expand
zle -N magic-abbrev-expand-and-execute
zle -N no-magic-abbrev-expand

bindkey " " magic-abbrev-expand
bindkey "^M" magic-abbrev-expand-and-execute
bindkey "^x " no-magic-abbrev-expand
bindkey -M isearch " " self-insert
