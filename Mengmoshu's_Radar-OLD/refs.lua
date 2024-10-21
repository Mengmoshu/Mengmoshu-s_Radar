-- Reference info:

-- New Radar `changes_table` reference
X_Modifications = { -- Not actually used
    this_name = "name",
    recipe = {
        name = "name",
        ingredients = 
        {
            {"?item?", ?},
            {"?item?", ?}
        },
        result = "name"
    },
    item = {
        name = "name",
        order = "d[radar]-a[radar]" .. "name",
        place_result = "name"
    },
    entity = {
        name = "name",
        minable.result = "name",
        max_distance_of_sector_revealed = ??,
        max_distance_of_nearby_sector_revealed = ??,
        energy_usage = "??kW",
        energy_per_nearby_scan = "??kJ",
        energy_per_sector = "??MJ"
    }
}

-- ******************************************
recipe_example = { -- Not actually used
    type = "recipe",
    name = "radar",
    ingredients =
    {
      {"electronic-circuit", 5},
      {"iron-gear-wheel", 5},
      {"iron-plate", 10}
    },
    result = "radar"
  }

item_example = { -- Not actually used
    type = "item",
    name = "radar",
    icon = "__base__/graphics/icons/radar.png",
    icon_size = 32,
    subgroup = "defensive-structure",
    order = "d[radar]-a[radar]",
    place_result = "radar",
    stack_size = 50
  }

entity_example = { -- Not actually used
    type = "radar",
    name = "radar",
    icon = "__base__/graphics/icons/radar.png",
    icon_size = 32,
    flags = {"placeable-player", "player-creation"},
    minable = {mining_time = 0.1, result = "radar"},
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
    energy_per_sector = "10MJ",
    max_distance_of_sector_revealed = 14,
    max_distance_of_nearby_sector_revealed = 3,
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




{
    type = "radar",
    name = "radar",
    icon = "__base__/graphics/icons/radar.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"placeable-player", "player-creation"},
    minable = {mining_time = 0.1, result = "radar"},
    max_health = 250,
    corpse = "radar-remnants",
    dying_explosion = "radar-explosion",
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
    damaged_trigger_effect = hit_effects.entity(),
    energy_per_sector = "10MJ",
    max_distance_of_sector_revealed = 14,
    max_distance_of_nearby_sector_revealed = 3,
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
    vehicle_impact_sound = sounds.generic_impact,
    working_sound =
    {
      sound =
      {
        {
          filename = "__base__/sound/radar.ogg",
          volume = 0.8
        }
      },
    max_sounds_per_type = 3,
    --audible_distance_modifier = 0.8,
    use_doppler_shift = false
    },
    radius_minimap_visualisation_color = { r = 0.059, g = 0.092, b = 0.235, a = 0.275 },
    rotation_speed = 0.01,
    water_reflection =
    {
      pictures =
      {
        filename = "__base__/graphics/entity/radar/radar-reflection.png",
        priority = "extra-high",
        width = 28,
        height = 32,
        shift = util.by_pixel(5, 35),
        variation_count = 1,
        scale = 5
      },
      rotate = false,
      orientation_to_variation = false
    }
  },
