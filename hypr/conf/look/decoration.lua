----------------------------
---- Looks (Decoration) ----
----------------------------
-- General settings for decorations, shadow, and blur
-- See https://wiki.hypr.land/Configuring/Basics/Variables/#decoration

hl.config({
    decoration = {
        -- Corner rounding
        rounding           = 8,
        rounding_power     = 4,

        -- Opacity
        active_opacity     = 1.0,
        inactive_opacity   = 1.0,
        fullscreen_opacity = 1.0,

        -- Dim
        dim_modal          = true,
        dim_inactive       = true,
        dim_strength       = 0.6,
        dim_around         = 0.3,

        shadow             = { enabled = false },

        blur               = {
            enabled           = true,
            xray              = true,
            new_optimizations = true,

            -- Properties
            size              = 4,
            passes            = 2,
            vibrancy          = 0.2
        }
    }
}
)
