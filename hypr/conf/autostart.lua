-----------------
--- Autostart ---
-----------------

hl.on("hyprland.start", function()
    -- Environment for xdg-desktop-portal-hyprland
    hl.exec_cmd("dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")

    -- Polkit agent
    hl.exec_cmd("systemctl --user start hyprpolkitagent")

    -- Night light
    hl.exec_cmd("hyprsunset")

    -- Wallpaper
    hl.exec_cmd("hyprpaper")

    -- Status Bar
    hl.exec_cmd("waybar")

    -- Notification Daemon
    hl.exec_cmd("swaync")

    -- hypridle
    hl.exec_cmd("hypridle")

    -- Clipboard History Manager
    hl.exec_cmd(
        "wl-paste --watch clipvault store --ignore-pattern '^<meta http-equiv=' --min-entry-length 2 --max-entries 200 --max-entry-age 2d")

    -- Application Launcher
    hl.exec_cmd("elephant")
    hl.exec_cmd("walker --gapplication-service")

    -- Protonmail Bridge
    hl.exec_cmd("protonmail-bridge --no-window")
end)
