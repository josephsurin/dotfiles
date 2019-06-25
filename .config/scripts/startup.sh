#/usr/bin/zsh
if [[ $PC = 'true' ]]
then
	xrandr --output VGA-0 --primary --mode 1600x900 --pos 1600x0 --rotate normal --output DVI-D-0 --mode 1600x900 --pos 0x0 --rotate normal --output HDMI-0 --off --output DVI-D-1 --off
	xbindkeys
	wid=$(xsetwacom list devices | grep STYLUS | egrep -o '[0-9]+')
	xsetwacom set $wid MapToOutput 1600x900+1600+0
	xsetwacom set $wid area 0 0 10336 5814
#	$HOME/.config/scripts/adjust_wacom.sh &
	mailspring -b &
	termite -e cmus &
fi

# wait for network to connect ...
sleep 2
discord &
