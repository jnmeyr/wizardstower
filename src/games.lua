local fields = require "src.fields"
local maps = require "src.maps"
local entities = require "src.entities"

local games = {}

games.create = function()
    local game = {}

    game.id = 1
    game.map = maps.create(maps.prototypes[game.id])
    game.rogue = entities.create(entities.prototypes.rogue, 5, 16)

    game.music = love.audio.newSource("res/music.wav", 'static')
    game.music:setVolume(0.25)
    game.music:setLooping(true)
    game.music:play()

    game.tick = function()
        local failure = game.die()
        local success = game.escape()
        game.climb()
        game.steal()
        game.open()

        game.rogue.tick(game.map)
        game.map.tick(game.rogue)

        if (success) then
            return true
        elseif (failure) then
            game.music:stop()

            return false
        end
    end

    game.die = function()
        if (game.map.getEnemy(game.rogue.x, game.rogue.y) ~= nil) then
            love.audio.newSource("res/failure.wav", "static"):play()

            return true
        end

        return false
    end

    game.escape = function()
        local success = game.map.getBottom(game.rogue.x, game.rogue.y) == fields.window

        if (success) then
            love.audio.newSource("res/success.wav", "static"):play()
        end

        return success
    end

    game.climb = function()
        if (game.map.getBottom(game.rogue.x, game.rogue.y) == fields.stairs) then
            game.id = game.id + 1
            game.map = maps.create(maps.prototypes[game.id])
            game.rogue = entities.create(entities.prototypes.rogue, 5, 16)

            love.audio.newSource("res/success.wav", "static"):play()
        end
    end

    game.steal = function()
        if (game.map.getTop(game.rogue.x, game.rogue.y) == fields.gold) then
            game.map.setTop(game.rogue.x, game.rogue.y, fields.void)

            love.audio.newSource("res/gold.wav", "static"):play()
        end
    end

    game.open = function()
        for y = 1, 16 do
            for x = 1, 16 do
                if (game.map.getTop(x, y) == fields.gold) then
                    return
                end
            end
        end

        for y = 1, 16 do
            for x = 1, 16 do
                if (game.map.getTop(x, y) == fields.door) then
                    game.map.setTop(x, y, fields.void)

                    love.audio.newSource("res/door.wav", "static"):play()
                end
            end
        end
    end

    game.draw = function(time)
        game.map.draw(time)
        game.rogue.draw(time)
    end

    return game
end

return games
