local fields = {}

fields.door = {}
fields.door.image = love.graphics.newImage("res/door.png")
fields.door.blocks = true

fields.floor = {}
fields.floor.image = love.graphics.newImage("res/floor.png")
fields.floor.blocks = false

fields.gold = {}
fields.gold.image = love.graphics.newImage("res/gold.png")
fields.gold.blocks = false

fields.stairs = {}
fields.stairs.image = love.graphics.newImage("res/stairs.png")
fields.stairs.blocks = false

fields.void = {}
fields.void.image = love.graphics.newImage("res/void.png")
fields.void.blocks = false

fields.wall = {}
fields.wall.image = love.graphics.newImage("res/wall.png")
fields.wall.blocks = true

fields.window = {}
fields.window.image = love.graphics.newImage("res/window.png")
fields.window.blocks = false

return fields
