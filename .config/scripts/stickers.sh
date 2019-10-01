#!/usr/bin/bash

w=$(xdotool search --name '^stickers$')
echo $w

if [[ $w == $(xdotool getactivewindow) ]]; then
    i3-msg 'focus mode_toggle'
elif [[ -n "$w" ]]; then
    i3-msg '[title="^stickers$"] focus'
elif [[ -z "$w" ]]; then
    python $WASHARED/code/stickers/src/main.py
fi
