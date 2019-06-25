#!/usr/bin/zsh
if [[ $PC == "true"  ]]
then
	saveloc="$WASHARED/screenshots/$(date +"%Y-%m")/$(date +"%Y-%m-%d-at-%I-%M-%S%p-maim.png")" 
else
	saveloc="$HOME/Screenshots/$(date +"%Y-%m-%d-%H%M%S")_maim.png"
fi
maim "$saveloc"
if [ -s $saveloc ]
then
	xclip -selection clipboard -t image/png "$saveloc"
	show=$(dunstify -A yes,SHOW -i $saveloc "Screenshot Taken")
	if [[ $show == "yes" ]]; then
		sxiv "$saveloc"
	fi
fi
