------------------
---- Monitors ----
------------------
-- See https://wiki.hypr.land/Configuring/Basics/Monitors/

hl.monitor({
    output   = "",
    mode     = "preferred",
    position = "auto",
    scale    = 1.2
})

-- unscale XWayland
hl.config({
    xwayland = {
        force_zero_scaling = true
    }
})
