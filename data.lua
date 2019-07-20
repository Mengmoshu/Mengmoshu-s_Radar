function new_radar( changes_table )
    local technology = data.raw.technology["basic-mapping"].effects -- The only in place edit besides Vanilla
    local recipe = table.deepcopy(data.raw.recipe["radar"])
    local item = table.deepcopy(data.raw.item["radar"])
    local entity = table.deepcopy(data.raw.radar["radar"])
    local changes = changes_table

    for k, v in pairs( changes.recipe ) do
        recipe.k = v
    end
    for k, v in pairs( changes.item ) do
        item.k = v
    end
    for k, v in pairs( changes.entity ) do
        entity.k = v
    end

    -- Here be external side effects!
    table.insert( technology, {type = "unlock-recipe", recipe = changes.this_name})
    data:extend({
        recipe,
        item,
        entity
    })
end

-- New Radar Properties
Search_Changes = {
    this_name = "search-radar",
    recipe = {
        name = Search_Changes.this_name,
        ingredients = 
        {
            {"electronic-circuit", 5},
            {"iron-gear-wheel", 8},
            {"iron-plate", 15}
        },
        result = Search_Changes.this_name
    },
    item = {
        name = Search_Changes.this_name,
        order = "d[radar]-a[radar]" .. Search_Changes.this_name,
        place_result = Search_Changes.this_name
    },
    entity = {
        name = Search_Changes.this_name,
        max_distance_of_sector_revealed = 28,
        max_distance_of_nearby_sector_revealed = 0,
        energy_usage = "300kW",
        energy_per_nearby_scan = "250kJ",
        energy_per_sector = "1MJ",
        minable = {mining_time = 0.1, result = Search_Changes.this_name}
    }
}

-- Vanilla Radar modifications
-- Will fill in when I have settings implemented

-- New Radar Creation
new_radar( Search_Changes )
