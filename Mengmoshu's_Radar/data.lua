local util = require("util")

-- !!Use util.merge()!!
-- !!Use util.parse_energy()!!
-- Settings
base_range_multiplier = 2
base_per_sector_multiplier = 1 -- energy_per_sector
base_nearby_sector_multiplier = 1 -- energy_per_nearby_scan
base_recipe_multiplier = 1
base_idle_energy_multiplier = 2 -- energy_usage

-- Stats and Balancing Notes:
-- Range values seem to exclude the chunk the radar is in. Make a 0-Range radar to test.
-- More thoroughly express what is supposed to distinguish each type of radar.

-- Plan:
-- Tweak vanilla radar
-- Deepcopy vanilla radar
-- Deepcopy vanilla into a named table for each new radar
-- Compose sparse tables of changes to new radars
-- Tweak each new radar (using util.merge to plop sparse tables into them)
-- Dump the named tables into this: data:extend({search-radar, etc, etc})


-- Vanilla baseline
local vanilla = {
    scan_distance = data.raw.radar["radar"].max_distance_of_sector_revealed,
    constant_distance = data.raw.radar["radar"].max_distance_of_nearby_sector_revealed,
    energy_per_scan = data.raw.radar["radar"].energy_per_nearby_scan,
    energy_usage = data.raw.radar["radar"].energy_usage
}

local manhattan_area = function(my_radius){
    local area = (my_radius * 2)^2
    return area
}

local energy_ratio = function(old_range, old_energy, new_range){
    local old_range = old_range
    local old_energy = old_energy
    local new_range = new_range
    return (old_energy/manhattan_area(old_range)) * (manhattan_area(new_range))
}

-- Vanilla Radar modifications
data.raw.radar["radar"].max_distance_of_sector_revealed = (vanilla.scan_distance * base_range_multiplier)
data.raw.radar["radar"].max_distance_of_nearby_sector_revealed = (vanilla.constant_distance * base_range_multiplier)
data.raw.radar["radar"].energy_usage = "1200kW" -- Must convert to number first!!

-- New Radars
data:extend(
{
-- Search Radar Creation
    { -- Search Recipe
        type = "recipe",
        name = "search-radar",
        ingredients =
        {
            {"electronic-circuit", 5},
            {"iron-gear-wheel", 8},
            {"iron-plate", 15}
        },
        result = "search-radar"
    },
    { -- Search Radar Item
        type = "item",
        name = "search-radar",
        icon = "__base__/graphics/icons/radar.png", -- TODO: Create/Modify graphics
        icon_size = 32,
        subgroup = "defensive-structure",
        order = "d[radar]-a[radar]",
        place_result = "search-radar",
        stack_size = 50
    },
    { -- Search Radar Entity
        type = "radar",
        name = "search-radar",
        icon = "__base__/graphics/icons/radar.png", -- TODO: Create/Modify graphics
        icon_size = 32,
        flags = {"placeable-player", "player-creation"},
        minable = {mining_time = 0.1, result = "search-radar"},
        max_health = 250,
        corpse = "radar-remnants",
        resistances =
        {
            {
                type = "fire",
                percent = 70
            },
            {
                type = "impact",
                percent = 30
            }
        },
        collision_box = {{-1.2, -1.2}, {1.2, 1.2}},
        selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
        energy_per_sector = "1MJ",
        max_distance_of_sector_revealed = 28,
        max_distance_of_nearby_sector_revealed = 0,
        energy_per_nearby_scan = "250kJ",
        energy_source =
        {
            type = "electric",
            usage_priority = "secondary-input"
        },
        energy_usage = "300kW",
        integration_patch =
        {   
            filename = "__base__/graphics/entity/radar/radar-integration.png",
            priority = "low",
            width = 119,
            height = 108,
            direction_count = 1,
            shift = util.by_pixel(1.5, 4),
            hr_version =
            {
                filename = "__base__/graphics/entity/radar/hr-radar-integration.png",
                priority = "low",
                width = 238,
                height = 216,
                direction_count = 1,
                shift = util.by_pixel(1.5, 4),
                scale = 0.5
            }
        },
        pictures =
        {
            layers =
            {
                {
                    filename = "__base__/graphics/entity/radar/radar.png",
                    priority = "low",
                    width = 98,
                    height = 128,
                    apply_projection = false,
                    direction_count = 64,
                    line_length = 8,
                    shift = util.by_pixel(1, -16),
                    hr_version =
                    {
                        filename = "__base__/graphics/entity/radar/hr-radar.png",
                        priority = "low",
                        width = 196,
                        height = 254,
                        apply_projection = false,
                        direction_count = 64,
                        line_length = 8,
                        shift = util.by_pixel(1, -16),
                        scale = 0.5
                    }
                },
                {
                    filename = "__base__/graphics/entity/radar/radar-shadow.png",
                    priority = "low",
                    width = 172,
                    height = 94,
                    apply_projection = false,
                    direction_count = 64,
                    line_length = 8,
                    shift = util.by_pixel(39,3),
                    draw_as_shadow = true,
                    hr_version =
                    {
                        filename = "__base__/graphics/entity/radar/hr-radar-shadow.png",
                        priority = "low",
                        width = 343,
                        height = 186,
                        apply_projection = false,
                        direction_count = 64,
                        line_length = 8,
                        shift = util.by_pixel(39.25,3),
                        draw_as_shadow = true,
                        scale = 0.5
                    }
                }
            }
        },
        vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
        working_sound =
        {
            sound =
            {
                {
                    filename = "__base__/sound/radar.ogg"
                }
            },
            apparent_volume = 2
        },
        radius_minimap_visualisation_color = { r = 0.059, g = 0.092, b = 0.235, a = 0.275 },
        rotation_speed = 0.01
        }
    },
-- Awareness Radar Creation

-- High Speed Radar Creation
}
