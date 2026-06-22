-------------------------
---- Looks (General) ----
-------------------------
-- General settings for looks and layout
-- See https://wiki.hypr.land/Configuring/Basics/Variables/#general

hl.config({
    general = {
        -- Spacing
        gaps_in                 = 4,
        gaps_out                = 8,

        -- Border
        border_size             = 2,
        col                     = {
            active_border   = { colors = { "rgba(701deddd)", "rgba(a50d7ddd)" }, angle = 60 },
            inactive_border = "rgba(2f273aaa)"
        },
        resize_on_border        = true,
        extend_border_grab_area = 2,

        -- Tearing
        allow_tearing           = false,

        -- Layout
        layout                  = "master"
    }
}
)
