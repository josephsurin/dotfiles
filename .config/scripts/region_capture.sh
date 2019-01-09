#/usr/bin/env bash

maim -s | tee ~/Screenshots/$(date +"%Y-%m-%d-%H%M%S")_maim.png | xclip -selection clipboard -t image/png && notify-send 'Screenshot Taken'
#scrot -s -e 'mv $f ~/Screenshots/$n && copyq write image/png - < ~/Screenshots/$n && copyq select 0'
