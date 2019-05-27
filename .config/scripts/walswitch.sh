#!/bin/bash
# https://gitlab.com/snippets/1733464
WALLS="$HOME/Downloads/wallpapers"

# Non-moddable part
set -e
IFS=$'\n'
if [ -e "${HOME}/Downloads/shit/.cycle" ]; then
	. "${HOME}/Downloads/shit/.cycle"
	if [[ $1 = "-r" ]]; then
		PATHS=( $(ls "$WALLS" | grep -E '\.png|\.jpg' | sort -r) )
	else
		PATHS=( $(ls "$WALLS" | grep -E '\.png|\.jpg' | sort) )
	fi
	if [[ $1 = "-w" ]]; then
		for i in "${!PATHS[@]}"; do
			if [[ "$2" = "${PATHS[$i]}" ]]; then
				CHANGETO="${PATHS[$i]}"
			fi
		done
	else
		for i in "${!PATHS[@]}"; do
			if [[ "${PATHS[$i]}" = "${CURRENT_WAL}" ]]; then
				INDEX=$i
				break
			fi
		done
		if [[ $1 = "-c" ]]; then
			CHANGETO="${PATHS[$i]}"
		else
			NEXT=$(( $i + 1 ))
			if (( $NEXT >= ${#PATHS[@]} )); then
				NEXT=$(( $NEXT - ${#PATHS[@]} ))
			fi
			CHANGETO="${PATHS[$NEXT]}"
		fi
	fi
else
	touch -f "${HOME}/Downloads/shit/.cycle"
	PATHS=( $(ls "$WALLS") )
	CHANGETO="${PATHS[0]}"
fi
echo 'CURRENT_WAL="'"$CHANGETO"'"' | tee "${HOME}/Downloads/shit/.cycle" &> /dev/null || exit 1

# echo "${WALLS}/${CHANGETO}" # debugging purposes
wal -i "${WALLS}/${CHANGETO}" --backend haishoku -e && "$HOME/.config/scripts/termite-wal.sh"
