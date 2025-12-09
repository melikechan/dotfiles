#!/bin/bash

EXIT_COMMAND="hyprctl dispatch exit"

confirm_action() {
    zenity --question \
           --text="Are you sure you want to $1?" \
           --title="Confirmation" \
           --width=240
    
    if [ $? -eq 0 ]; then
        eval "$2"
    fi
}

case "$1" in
    "lock")
        pidof hyprlock || hyprlock
        ;;
    "logout")
        confirm_action "logout" "$EXIT_COMMAND"
        ;;
    "suspend")
        confirm_action "suspend" "systemctl suspend"
        ;;
    "hibernate")
        confirm_action "hibernate" "systemctl hibernate"
        ;;
    "reboot")
        confirm_action "reboot" "systemctl reboot"
        ;;
    "shutdown")
        confirm_action "power off" "systemctl poweroff"
        ;;
esac