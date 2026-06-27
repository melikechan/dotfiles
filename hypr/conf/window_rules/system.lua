-------------------------------
---- Window Rules (System) ----
-------------------------------
-- See https://wiki.hypr.land/Configuring/Basics/Window-Rules/
-- This one is more like trial and error. You need to find the best one by trying.

-- Picture-in-Picture
hl.window_rule({
    name = "picture-in-picture",
    match = {
        title = [[^([Pp]icture[-\s]?[Ii]n[-\s]?[Pp]icture)(.*)$]]
    },
    float = true,
    pin = true,
    keep_aspect_ratio = true,
    no_initial_focus = true,
    suppress_event = "activate"
})

-- GTK File and Folder Picker
hl.window_rule({
    name = "xdg-desktop-portal-gtk",
    match = { class = "xdg-desktop-portal-gtk" },
    float = true,
    center = true,
    size = { "monitor_w * 0.5", "monitor_h * 0.6" }
})

-- Zenity
hl.window_rule({
    match = { class = "^(zenity)$" },
    float = true,
    rounding = 16,
    no_shadow = true,
})

-- hyprland Share Picker
hl.window_rule({
    name = "hyprland-share-picker",
    match = { class = "hyprland-share-picker" },
    float = true,
    center = true,
    size = { "monitor_w * 0.4", "monitor_h * 0.5" }
})

-- nmtui
hl.window_rule({
    name = "nmtui",
    match = { class = "nmtui" },
    float = true,
    center = true,
    size = { "monitor_w * 0.55", "monitor_h * 0.65" }
})

-- bluetui
hl.window_rule({
    name = "bluetui",
    match = { class = "bluetui" },
    float = true,
    center = true,
    size = { "monitor_w * 0.5", "monitor_h * 0.6" }
})

-- pwvucontrol
hl.window_rule({
    name = "pwvucontrol",
    match = { class = "com.saivert.pwvucontrol" },
    float = true,
    center = true,
    size = { "monitor_w * 0.5", "monitor_h * 0.6" }
})

-- waybar
hl.layer_rule({ match = { namespace = "waybar" }, blur = true })

-- walker
hl.layer_rule({ match = { namespace = "walker" }, dim_around = true })
