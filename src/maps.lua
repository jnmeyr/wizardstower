local fields = require "src.fields"
local d = fields.door
local f = fields.floor
local g = fields.gold
local i = fields.window
local s = fields.stairs
local v = fields.void
local w = fields.wall
local entities = require "src.entities"

local maps = {}

maps.prototypes = {}

maps.prototypes[1] = {}
maps.prototypes[1].bottoms = {
    { w, w, w, w, w, w, w, w, w, w, w, s, w, w, w, w },
    { w, f, f, f, f, f, f, f, f, f, f, f, f, f, f, w },
    { w, f, w, f, w, f, w, w, w, w, w, w, f, w, f, w },
    { w, f, f, f, w, f, f, f, f, f, f, w, f, w, f, w },
    { w, f, w, w, w, f, w, w, f, w, f, w, f, w, f, w },
    { w, f, f, f, f, f, w, f, f, w, f, f, f, w, f, w },
    { w, f, w, f, w, w, w, f, w, w, w, w, f, w, f, w },
    { w, f, w, f, w, f, f, f, f, w, f, f, f, w, f, w },
    { w, f, w, f, f, f, w, f, f, f, f, w, f, w, f, w },
    { w, f, w, f, w, w, w, w, f, w, w, w, f, w, f, w },
    { w, f, w, f, f, f, w, f, f, w, f, f, f, f, f, w },
    { w, f, w, f, w, f, w, f, w, w, f, w, w, w, f, w },
    { w, f, w, f, w, f, f, f, f, f, f, w, f, f, f, w },
    { w, f, w, f, w, w, w, w, w, w, f, w, f, w, f, w },
    { w, f, f, f, f, f, f, f, f, f, f, f, f, f, f, w },
    { w, w, w, w, d, w, w, w, w, w, w, w, w, w, w, w }
}
maps.prototypes[1].tops = {
    { v, v, v, v, v, v, v, v, v, v, v, d, v, v, v, v },
    { v, g, g, g, g, g, g, g, g, g, g, g, g, g, g, v },
    { v, g, v, g, v, g, v, v, v, v, v, v, g, v, g, v },
    { v, g, g, g, v, g, g, g, g, g, g, v, g, v, g, v },
    { v, g, v, v, v, g, v, v, g, v, g, v, g, v, g, v },
    { v, g, g, g, g, g, v, g, g, v, g, g, g, v, g, v },
    { v, g, v, g, v, v, v, g, v, v, v, v, g, v, g, v },
    { v, g, v, g, v, g, g, v, v, v, g, g, g, v, g, v },
    { v, g, v, g, g, g, v, v, v, g, g, v, g, v, g, v },
    { v, g, v, g, v, v, v, v, g, v, v, v, g, v, g, v },
    { v, g, v, g, g, g, v, g, g, v, g, g, g, g, g, v },
    { v, g, v, g, v, g, v, g, v, v, g, v, v, v, g, v },
    { v, g, v, g, v, g, g, g, g, g, g, v, g, g, g, v },
    { v, g, v, g, v, v, v, v, v, v, g, v, g, v, g, v },
    { v, g, g, g, g, g, g, g, g, g, g, g, g, g, g, v },
    { v, v, v, v, d, v, v, v, v, v, v, v, v, v, v, v }
}
maps.prototypes[1].enemies = {
    { entities.prototypes.goblin, 8, 8 },
    { entities.prototypes.goblin, 8, 9 },
    { entities.prototypes.goblin, 9, 8 },
    { entities.prototypes.goblin, 9, 9 }
}

maps.prototypes[2] = {}
maps.prototypes[2].bottoms = {
    { w, w, w, w, w, w, v, v, v, w, w, s, w, w, w, w },
    { w, f, f, f, f, w, v, v, v, w, f, f, f, f, f, w },
    { w, f, w, w, f, w, w, w, w, w, f, w, f, w, f, w },
    { w, f, f, f, f, f, f, f, f, f, f, f, f, w, f, w },
    { w, f, w, w, w, f, w, w, f, w, f, w, f, f, f, w },
    { w, f, f, w, f, f, w, f, f, w, f, w, w, f, w, w },
    { w, w, f, w, f, w, w, f, w, w, f, f, w, f, w, v },
    { v, w, f, w, f, f, f, f, f, w, w, f, f, f, w, v },
    { v, w, f, f, f, w, w, f, f, f, f, f, w, f, w, v },
    { v, w, f, w, f, f, w, w, f, w, w, f, w, f, w, w },
    { w, w, f, w, w, f, w, f, f, w, f, f, w, f, f, w },
    { w, f, f, f, w, f, w, f, w, w, f, w, w, w, f, w },
    { w, f, w, f, f, f, f, f, f, f, f, f, f, f, f, w },
    { w, f, w, f, w, f, w, w, w, w, w, f, w, w, f, w },
    { w, f, f, f, f, f, w, v, v, v, w, f, f, f, f, w },
    { w, w, w, w, d, w, w, v, v, v, w, w, w, w, w, w }
}
maps.prototypes[2].tops = {
    { v, v, v, v, v, v, v, v, v, v, v, d, v, v, v, v },
    { v, g, g, g, g, v, v, v, v, v, g, g, g, g, g, v },
    { v, g, v, v, g, v, v, v, v, v, g, v, g, v, g, v },
    { v, g, g, g, g, g, g, g, g, g, g, g, g, v, g, v },
    { v, g, v, v, v, g, v, v, g, v, g, v, g, g, g, v },
    { v, g, g, v, g, g, v, g, g, v, g, v, v, g, v, v },
    { v, v, g, v, g, v, v, g, v, v, g, g, v, g, v, v },
    { v, v, g, v, g, g, g, v, v, v, v, g, g, g, v, v },
    { v, v, g, g, g, v, v, v, v, g, g, g, v, g, v, v },
    { v, v, g, v, g, g, v, v, g, v, v, g, v, g, v, v },
    { v, v, g, v, v, g, v, g, g, v, g, g, v, g, g, v },
    { v, g, g, g, v, g, v, g, v, v, g, v, v, v, g, v },
    { v, g, v, g, g, g, g, g, g, g, g, g, g, g, g, v },
    { v, g, v, g, v, g, v, v, v, v, v, g, v, v, g, v },
    { v, g, g, g, g, g, v, v, v, v, v, g, g, g, g, v },
    { v, v, v, v, d, v, v, v, v, v, v, v, v, v, v, v }
}
maps.prototypes[2].enemies = {
    { entities.prototypes.goblin, 8, 8 },
    { entities.prototypes.goblin, 8, 9 },
    { entities.prototypes.goblin, 9, 8 },
    { entities.prototypes.goblin, 9, 9 }
}

maps.prototypes[3] = {}
maps.prototypes[3].bottoms = {
    { v, v, v, v, v, v, v, v, v, w, w, i, w, w, w, v },
    { w, w, w, w, w, w, v, v, v, w, f, f, f, f, w, v },
    { w, f, f, f, f, w, v, v, v, w, f, w, w, f, w, v },
    { w, f, w, w, f, w, w, w, w, w, f, w, w, f, w, v },
    { w, f, w, w, f, f, f, f, f, f, f, f, f, f, w, v },
    { w, f, f, f, f, f, w, f, f, w, w, f, w, w, w, v },
    { w, w, w, w, f, w, w, w, f, w, w, f, w, v, v, v },
    { v, v, v, w, f, f, w, f, f, f, f, f, w, v, v, v },
    { v, v, v, w, f, f, f, f, f, w, f, f, w, v, v, v },
    { v, v, v, w, f, w, w, f, w, w, w, f, w, w, w, w },
    { v, w, w, w, f, w, w, f, f, w, f, f, f, f, f, w },
    { v, w, f, f, f, f, f, f, f, f, f, f, w, w, f, w },
    { v, w, f, w, w, f, w, w, w, w, w, f, w, w, f, w },
    { v, w, f, w, w, f, w, v, v, v, w, f, f, f, f, w },
    { v, w, f, f, f, f, w, v, v, v, w, w, w, w, w, w },
    { v, w, w, w, d, w, w, v, v, v, v, v, v, v, v, v }
}
maps.prototypes[3].tops = {
    { v, v, v, v, v, v, v, v, v, v, v, d, v, v, v, v },
    { v, v, v, v, v, v, v, v, v, v, g, g, g, g, v, v },
    { v, g, g, g, g, v, v, v, v, v, g, v, v, g, v, v },
    { v, g, v, v, g, v, v, v, v, v, g, v, v, g, v, v },
    { v, g, v, v, g, g, g, g, g, g, g, g, g, g, v, v },
    { v, g, g, g, g, g, v, g, g, v, v, g, v, v, v, v },
    { v, v, v, v, g, v, v, v, g, v, v, g, v, v, v, v },
    { v, v, v, v, g, g, v, v, g, g, g, g, v, v, v, v },
    { v, v, v, v, g, g, g, g, v, v, g, g, v, v, v, v },
    { v, v, v, v, g, v, v, g, v, v, v, g, v, v, v, v },
    { v, v, v, v, g, v, v, g, g, v, g, g, g, g, g, v },
    { v, v, g, g, g, g, g, g, g, g, g, g, v, v, g, v },
    { v, v, g, v, v, g, v, v, v, v, v, g, v, v, g, v },
    { v, v, g, v, v, g, v, v, v, v, v, g, g, g, g, v },
    { v, v, g, g, g, g, v, v, v, v, v, v, v, v, v, v },
    { v, v, v, v, d, v, v, v, v, v, v, v, v, v, v, v }
}
maps.prototypes[3].enemies = {
    { entities.prototypes.goblin, 8, 8 },
    { entities.prototypes.wizard, 9, 9 }
}

maps.create = function(prototype)
    local map = {}

    map.bottoms = {}
    map.tops = {}
    for y = 1, 16 do
        map.bottoms[y] = {}
        map.tops[y] = {}
        for x = 1, 16 do
            map.bottoms[y][x] = prototype.bottoms[y][x]
            map.tops[y][x] = prototype.tops[y][x]
        end
    end
    map.enemies = {}
    for index, value in ipairs(prototype.enemies) do
        local prototype = value[1]
        local x = value[2]
        local y = value[3]

        map.enemies[index] = entities.create(prototype, x, y)
    end

    map.getBottom = function(x, y)
        if (x >= 1 and x <= 16 and y >= 1 and y <= 16) then
            return map.bottoms[y][x]
        end

        return nil
    end

    map.setBottom = function(x, y, field)
        if (x >= 1 and x <= 16 and y >= 1 and y <= 16) then
            map.bottoms[y][x] = field
        end
    end

    map.getTop = function(x, y)
        if (x >= 1 and x <= 16 and y >= 1 and y <= 16) then
            return map.tops[y][x]
        end

        return nil
    end

    map.setTop = function(x, y, field)
        if (x >= 1 and x <= 16 and y >= 1 and y <= 16) then
            map.tops[y][x] = field
        end
    end

    map.getEnemy = function(x, y)
        for index = 1, #map.enemies do
            local enemy = map.enemies[index]

            if (enemy.occupies(x, y)) then
                return enemy
            end
        end

        return nil
    end

    map.tick = function(rogue)
        for index = 1, #map.enemies do
            local enemy = map.enemies[index]

            enemy.think(map, rogue)
            enemy.tick(map)
        end
    end

    map.blocks = function(x, y)
        return x < 1 or x > 16 or y < 1 or y > 16 or map.bottoms[y][x].blocks or map.tops[y][x].blocks
    end

    map.draw = function(time)
        for y = 1, 16 do
            for x = 1, 16 do
                love.graphics.draw(map.bottoms[y][x].image, 32 * x - 32, 32 * y - 32)
                love.graphics.draw(map.tops[y][x].image, 32 * x - 32, 32 * y - 32)
            end
        end

        for index = 1, #map.enemies do
            local enemy = map.enemies[index]

            enemy.draw(time)
        end
    end

    return map
end

return maps
