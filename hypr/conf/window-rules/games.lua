-------------------------------
---- Window Rules (Gaming) ----
-------------------------------
-- See https://wiki.hypr.land/Configuring/Basics/Window-Rules/
-- This one is more like trial and error. You need to find the best one by trying.

hl.window_rule({
    name = "steam-updater-floating-windows",
    match = {
        title = "Steam",
        float = true,
    },
    no_focus = true
})

hl.window_rule({
    name = "steam-float-dialogs-and-stuff",
    match = {
        class = "[Ss]team",
        title = "SteamTinkerLaunch",
    },
    float = true
})

hl.window_rule({
    name = "non-game-windows-spawned-by-launching-games",
    match = {
        class = "steam_app.*",
        title = "^$",
    },
    center = true
})

hl.window_rule({ match = { class = "steam_app.*", title = "negative:^$" }, content = "game" })
hl.window_rule({
    name = "game-windows",
    match = { content = "game" },
    render_unfocused = true,
    fullscreen = true
})
