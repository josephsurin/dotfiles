setopt extendedglob

typeset -A abbrevs

# General aliases 1
abbrevs=(
  "ll"		"ls -al"
  "l1"		"ls -1"
  "lst"		"ls --tree"
  "lsg"		"ls | grep"
  "lss"     "exa -l --sort=size"
  "lsth"	"exa -l --sort=new"
  "hsg"		"history | grep"
  "hs"		"history"
  "mdc"		"mkdir -p __CURSOR__ && cd \$_"
  "dua"		"du -ah"
  "dv"      "dirs -v"
  "_"		"\"\$_\""
  "dus"		"du -sh"
  "openc"   "mimeo __CURSOR__ & disown && exit"
  "cpv"		"rsync -ah --progress"
  "2dv"		"2>/dev/null"
  "fdg"		"find . | grep"
  "pgr"		"| grep"
  "tstamp"	"| while read line; do ; echo \$(date | cut -f4 -d ' ') \$line; done"
  "epoch"	"date +%s"
  "epochms"	'echo $(($(date +%s%N)/1000000))'
  "stripansi" "sed 's/\x1b\[[0-9;]*m//g'"
  "tfont"     "setfont /usr/share/kbd/consolefonts/ter-118b.psf.gz"
)

# General aliases 2
abbrevs+=(
  "awkp"	"| awk '{print \$__CURSOR__}'"
  "trnl"    "awk 'length(\$0) > 0'"
)

# Directory aliases
abbrevs+=(
  "cdds"	"~/Downloads/shit/"
  "ds"      "~/Downloads/shit/"
  "cdcs"	"~/.config/scripts/"
  "cdw"		"~/Downloads/wallpapers/"
  "cdc"		"~/.config/"
  "cdm"		"/run/media/joseph/"
  "cdb"     "/media/winarch-shared/books/"
)

# File aliases
abbrevs+=(
  "vz"		"v ~/.zshrc"
  "vabbs"	"v ~/.config/zsh/abbreviations.zsh"
  "vi3"		"v ~/.config/i3/config"
  "vpb"		"v ~/.config/polybar/config"
  "vd"      "v $WASHARED/other/diary.txt"
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
  "jn"		"jupyter-notebook"
  "pi"		"python -i"
  "xc"		"xclip -selection clipboard"
  "b64"		"base64"
  "b64d"	"base64 -d"
  "mpdf"	"man -Tpdf __CURSOR__ | zathura -"
  "vfz"		"vim \"\$(fzf --reverse --inline-info)\""
  "cfz"		"cat \"\$(fzf --reverse --inline-info)\""
  "cdfz"	"cd \"\$(dirname \"\$(fzf --reverse --inline-info)\")\""
  "pqi"		"pacman -Qi"
  "ac"		"aria2c"
  "htl"     "heroku logs --tail"
  "reds"    "redshift -O 4000 -b 0.7"
  "cpss"    "xclip -selection clipboard -o -t image/png > __CURSOR__"
  "p2c"     "python2 -c \"print '__CURSOR__'\""
)

# SSH aliases
abbrevs+=(
  "thonk"   "ssh josep@xnith.xyz",
  "sshhome" "ssh joseph@ssh.josephsurin.me -p 2222"
)

racki() {
    racket -il xrepl -e "(require \"$1\")"
}

weather() {
    http v2.wttr.in 
}

ofz() {
    p=$(fzf --reverse --inline-info)
    mimeo "$p" &! exit
}

transfer() { if [ $# -eq 0 ]; then echo -e "No arguments specified. Usage:\necho transfer /tmp/test.md\ncat /tmp/test.md | transfer test.md"; return 1; fi
tmpfile=$( mktemp -t transferXXX ); if tty -s; then basefile=$(basename "$1" | sed -e 's/[^a-zA-Z0-9._-]/-/g'); curl --progress-bar --upload-file "$1" "https://transfer.sh/$basefile" >> $tmpfile; else curl --progress-bar --upload-file "-" "https://transfer.sh/$1" >> $tmpfile ; fi; cat $tmpfile; rm -f $tmpfile; } 

if [[ $PC = 'true' ]]; then
	abbrevs+=(
		"was"		"$WASHARED/"
        "cda"       "$WASHARED/anime/"
        "cdo"       "$WASHARED/other/"
		"cdln"		"$WASHARED/notes/"
		"cdlc"		"$WASHARED/code/"
		"cdu"		"$WASHARED/uni/"
		"cdctf"		"$WASHARED/code/ctf-notes/"
		"cdS"		"$WASHARED/shit/"
		"cdU"		"/run/media/joseph/Unova/"
	)
else
	abbrevs+=(
		  "cdctf"	"~/Libraries/Code/ctf-notes/"
		  "cdln"	"~/Libraries/Notes/"
		  "cdlc"	"~/Libraries/Code/"
		  "cdu"		"/run/media/joseph/white64/uni"
	)
fi
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
