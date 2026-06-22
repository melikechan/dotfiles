#!/usr/bin/env bash

# Shows keybinding help
hyprctl binds -j | jq -r '
  .[] | select(.description != "") |
  ([
    (if (.modmask / 64 | floor) % 2 == 1 then "SUPER" else empty end),
    (if (.modmask /  8 | floor) % 2 == 1 then "ALT"   else empty end),
    (if (.modmask /  4 | floor) % 2 == 1 then "CTRL"  else empty end),
    (if (.modmask /  1 | floor) % 2 == 1 then "SHIFT" else empty end)
  ] | join("+")) as $mods |
  (if $mods == "" then .key else "\($mods) + \(.key)" end) + "\t→ " + .description
' | column -t -s$'\t' | walker --dmenu