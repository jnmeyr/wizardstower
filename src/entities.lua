local entities = {}

entities.prototypes = {}

entities.prototypes.goblin = {}
entities.prototypes.goblin.image = love.graphics.newImage("res/goblin.png")

entities.prototypes.rogue = {}
entities.prototypes.rogue.image = love.graphics.newImage("res/rogue.png")

entities.prototypes.wizard = {}
entities.prototypes.wizard.image = love.graphics.newImage("res/wizard.png")

entities.create = function(prototype, x, y)
    local entity = {}

    entity.image = prototype.image
    entity.x = x
    entity.y = y
    entity.dx = 0
    entity.dy = 0
    entity.ndx = 0
    entity.ndy = 0

    entity.place = function(x, y)
        entity.x = x
        entity.y = y
    end

    entity.direct = function(dx, dy)
        entity.dx = dx
        entity.dy = dy
    end

    entity.command = function(ndx, ndy)
        entity.ndx = ndx
        entity.ndy = ndy
    end

    entity.think = function(map, rogue)
        if (entity.occupies(rogue.x, rogue.y)) then
            entity.direct(0, 0)
            entity.command(0, 0)

            return
        end

        if (entity.dx == 0 and entity.dy == 0) then
            local random = math.random(1, 4)
            if (random == 1) then
                entity.direct(0, -1)
            elseif (random == 2) then
                entity.direct(0, 1)
            elseif (random == 3) then
                entity.direct(-1, 0)
            elseif (random == 4) then
                entity.direct(1, 0)
            end
        end
        local ndxys = {}
        ndxys[1] = { entity.dx, entity.dy }
        ndxys[2] = { entity.dy, entity.dx }
        ndxys[3] = { -entity.dy, -entity.dx }
        for iteration = 1, 9 do
            local i = math.random(1, 3)
            local j = math.random(1, 3)

            ndxys[i], ndxys[j] = ndxys[j], ndxys[i]
        end
        ndxys[4] = { -entity.dx, -entity.dy }
        for index = 1, #ndxys do
            local ndx = ndxys[index][1]
            local ndy = ndxys[index][2]

            if (not map.blocks(entity.x + ndx, entity.y + ndy)) then
                entity.command(ndx, ndy)

                return
            end
        end
    end

    entity.turn = function(map)
        local x = entity.x + entity.ndx
        local y = entity.y + entity.ndy

        if (not map.blocks(x, y)) then
            entity.direct(entity.ndx, entity.ndy)
        end
    end
    
    entity.move = function(map)
        local x = entity.x + entity.dx
        local y = entity.y + entity.dy

        if (not map.blocks(x, y)) then
            entity.place(x, y)
        else
            entity.direct(0, 0)
        end
    end

    entity.tick = function(map)
        entity.turn(map)
        entity.move(map)
    end

    entity.occupies = function(x, y)
        return entity.x == x and entity.y == y
    end

    entity.draw = function(time)
        love.graphics.draw(entity.image, 32 * entity.x - (32 - 32 * time) * entity.dx - 32, 32 * entity.y - (32 - 32 * time) * entity.dy - 32)
    end

    return entity
end

return entities
