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

-- Let XWayland applications render at native scale; toolkit-specific scaling
-- keeps them crisp on the fractionally scaled monitor.
hl.config({
    xwayland = {
        force_zero_scaling = true
    }
})
