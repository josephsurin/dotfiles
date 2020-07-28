source "$HOME/.cache/wal/colors.sh"
# remove the current termite config
if [ -f "$HOME/.config/termite/config" ]; then
	rm "$HOME/.config/termite/config"
fi
# copy the base config
cp "$HOME/.config/termite/config.base" "$HOME/.config/termite/config"
cols=""
cols+="foreground = $foreground\n"
#bg="rgba("
#bgr="${background:1:2}"
#bgg="${background:3:2}"
#bgb="${background:5:2}"
#bg+="$((16#$bgr)), $((16#$bgg)), $((16#$bgb)), 0.9)"
bg="rgba(22, 22, 25, 0.95)"
cols+="background = $bg\n"
cols+="cursor = $cursor\n"
cols+="color0 = $color0\n"
cols+="color1 = $color1\n"
cols+="color2 = $color2\n"
cols+="color3 = $color3\n"
cols+="color4 = $color4\n"
cols+="color5 = $color5\n"
cols+="color6 = $color6\n"
cols+="color7 = $color7\n"
cols+="color8 = $color8\n"
cols+="color9 = $color9\n"
cols+="color10 = $color10\n"
cols+="color11 = $color11\n"
cols+="color12 = $color12\n"
cols+="color13 = $color13\n"
cols+="color14 = $color14\n"
cols+="color15 = $color15"
printf "$cols" >> "$HOME/.config/termite/config"

# update greeter wallpaper
if [ -f "$HOME/Downloads/wallpapers/wall.jpg" ]; then
	rm "$HOME/Downloads/wallpapers/wall.jpg"
fi
cp "$wallpaper" "$HOME/Downloads/wallpapers/wall.jpg"
