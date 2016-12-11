Furniture = Class {
  init = function(self, name, spriteName, pos)
    self.name = name
    self.sprite = assets.images[spriteName]
    self.pos = pos
    self.scale = 2

    local w,h = self.sprite:getDimensions()
    self.body = love.physics.newBody(pworld, pos.x, pos.y, 'dynamic')

    -- @TODO: Change to polyshapes?
    self.shape = love.physics.newRectangleShape(w*self.scale, h*self.scale)

    -- local density = math.min(1, w/64)
    local density = 1
    self.fixture = love.physics.newFixture(self.body, self.shape, density)
  end,

  bounds = function(self)
    local x1,y1,x2,y2 = self.fixture:getBoundingBox()
    return vec(x1, y1), vec(x2, y2)
  end,

  draw = function(self)
    local w, h = self.sprite:getDimensions()
    love.graphics.draw(self.sprite,
                       self.body:getX(),
                       self.body:getY(),
                       self.body:getAngle(),
                       self.scale,
                       self.scale,
                       w/2,
                       h/2)

    -- Debug
    love.graphics.setColor(255, 0, 0)
    local x1,y1,x2,y2 = self.fixture:getBoundingBox()
    love.graphics.polygon('line', x1, y1, x2, y1, x2, y2, x1, y2)
    love.graphics.setColor(255, 255, 255)
  end,

  draggable = true,
  selectable = true,
}
