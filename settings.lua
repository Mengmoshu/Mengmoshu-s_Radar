-- * Range Multiplier (double)
-- * Base Energy Multiplier (double)
-- * Recipe Multiplier (double)
-- * Per Type Adjustments
--   - Ranges, Energy costs, Recipe Cost.
--   - No per type disable. Just don't build them!

data:extend({
    -- Baseline, applies to *all* supported radars?
    {
        type = "double-setting",
        name = "mradar-range-mult",
        setting_type = "startup",
        default_value = 1,
        minimum_value = 0.001
    },
    {
        type = "double-setting",
        name = "mradar-energy-mult",
        setting_type = "startup",
        default_value = 1,
        minimum_value = 0.001
    },
    {
        type = "double-setting",
        name = "mradar-recipe-mult",
        setting_type = "startup",
        default_value = 1,
        minimum_value = 0.001
    },
    -- Per Type
    -- Search Radar
    {
        type = "double-setting",
        name = "",
        setting_type = "startup",
        default_value = 1,
        minimum_value = 0.001
    },
    {
        type = "double-setting",
        name = "",
        setting_type = "startup",
        default_value = 1,
        minimum_value = 0.001
    },
    {
        type = "double-setting",
        name = "",
        setting_type = "startup",
        default_value = 1,
        minimum_value = 0.001
    },
    -- Awareness Radar
    {
        type = "double-setting",
        name = "",
        setting_type = "startup",
        default_value = 1,
        minimum_value = 0.001
    },
    {
        type = "double-setting",
        name = "",
        setting_type = "startup",
        default_value = 1,
        minimum_value = 0.001
    },
    {
        type = "double-setting",
        name = "",
        setting_type = "startup",
        default_value = 1,
        minimum_value = 0.001
    },
    -- High Speed Radar
    {
        type = "double-setting",
        name = "",
        setting_type = "startup",
        default_value = 1,
        minimum_value = 0.001
    },
    {
        type = "double-setting",
        name = "",
        setting_type = "startup",
        default_value = 1,
        minimum_value = 0.001
    },
    {
        type = "double-setting",
        name = "",
        setting_type = "startup",
        default_value = 1,
        minimum_value = 0.001
    },
})
