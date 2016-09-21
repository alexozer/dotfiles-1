#!/bin/bash

confirm() {
	echo -e "Yes\nNo" | rofi -dmenu -i -format d -selected-row 1 -p "${1:-Confirm: }"
}

reload="Reload sxhkd configuration"
restartpan="Restart panel"
quit="Quit bspwm"
suspend="Suspend"
reboot="Reboot"
shutdown="Shutdown"


content="$reload\n$restartpan\n$quit\n$suspend\n$reboot\n$shutdown"

selection=$(echo -e $content | rofi -dmenu -i -markup-rows -p "Action: ")
case $selection in
	$reload)
		pkill -USR1 -x sxhkd ;;
	$restartpan)
		pkill panel ; panel & ;;
	$quit)
		[[ $(confirm) = 1 ]] && (pkill panel ; (for win in $(bspc query -N); do bspc node $win -c ; done;) ; bspc quit) ;;
	$suspend)
		[[ $(confirm) = 1 ]] && (systemctl suspend) ;;
	$reboot)
		[[ $(confirm) = 1 ]] && (systemctl reboot) ;;
	$shutdown)
		[[ $(confirm) = 1 ]] && (systemctl poweroff) ;;
esac
