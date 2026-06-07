-----------------
--- AUTOSTART ---
-----------------

hl.on("hyprland.start", function()
    -- Wallpaper
    hl.exec_cmd("hyprpaper")

    -- Status Bar
    hl.exec_cmd("waybar")

    -- Notification Daemon
    hl.exec_cmd("swaync")

    -- hypridle
    hl.exec_cmd("hypridle")

    -- Application Launcher
    hl.exec_cmd("elephant")
    hl.exec_cmd("walker --gapplication-service")

    -- Protonmail Bridge
    hl.exec_cmd("protonmail-bridge --no-window --noninteractive")
end)
