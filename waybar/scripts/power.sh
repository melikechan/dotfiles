#!/bin/bash

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
        confirm_action "logout" "hyprshutdown"
        ;;
    "suspend")
        confirm_action "suspend" "systemctl suspend"
        ;;
    "hibernate")
        confirm_action "hibernate" "systemctl hibernate"
        ;;
    "reboot")
        confirm_action "reboot" "hyprshutdown -t 'Restarting...' --post-cmd 'systemctl reboot'"
        ;;
    "shutdown")
        confirm_action "power off" "hyprshutdown -t 'Shutting down...' --post-cmd 'systemctl poweroff'"
        ;;
esac