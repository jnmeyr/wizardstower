local games = require "src.games"

local title = true
local success = false
local failure = false

local updateTime = 0.2
local gameTime = 0

local game = games.create()

function love.load()
    math.randomseed(os.time())
end

function love.update(deltaTime)
    if (not title and not success and not failure) then
        gameTime = gameTime + deltaTime
        if (gameTime > updateTime) then
            gameTime = gameTime % updateTime

            local state = game.tick()

            if (state ~= nil) then
                success = state
                failure = not state
            end
        end
    end
end

function love.draw()
    game.draw(gameTime / updateTime)

    if (title) then
        love.graphics.draw(love.graphics.newImage("res/title.png"), 0, 0)
    elseif (success) then
        love.graphics.draw(love.graphics.newImage("res/success.png"), 0, 0)
    elseif (failure) then
        love.graphics.draw(love.graphics.newImage("res/failure.png"), 0, 0)
    end
end

function love.keypressed(key)
    if (key == 'escape') then
        love.event.quit()
    end

    if (title) then
        title = false
    elseif (success or failure) then
        game = games.create()

        success = false
        failure = false
    else
        if (key == 'up') then
            game.rogue.command(0, -1)
        elseif (key == 'down') then
            game.rogue.command(0, 1)
        elseif (key == 'left') then
            game.rogue.command(-1, 0)
        elseif (key == 'right') then
            game.rogue.command(1, 0)
        end
    end
end
