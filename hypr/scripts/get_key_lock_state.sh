#!/bin/sh
# Prints lock indicators for hyprlock:
#   ⇪ CAPS · ⇭ NUM   (both on)
#   ⇪ CAPS           (caps only)
#   ⇭ NUM            (num only)
#   (nothing)        (neither)

caps=""
num=""

grep -qsx 1 /sys/class/leds/*::capslock/brightness && caps="⇪ CAPS"
grep -qsx 1 /sys/class/leds/*::numlock/brightness  && num="⇭ NUM"

# " · " separator only when both are present
printf '%s' "$caps${caps:+${num:+ · }}$num"