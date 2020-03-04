#/usr/bin/zsh
if [[ $PC = 'true' ]]
then
	xrandr --output VGA-0 --primary --mode 1600x900 --pos 1600x0 --rotate normal --output DVI-D-0 --mode 1600x900 --pos 0x0 --rotate normal --output HDMI-0 --off --output DVI-D-1 --off
	xbindkeys
	$HOME/.config/scripts/adjust_wacom.sh &
	mailspring -b &
	termite -e cmus &
    # firefox home page
    python -m http.server --directory "$WASHARED/other/dome" 4663 &
fi

termite -e calcurse &
# wait for network to connect ...
sleep 2
discord &
telegram-desktop -startintray &
#slack -u &
#notable &
# anki &
