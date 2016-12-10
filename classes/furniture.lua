Furniture = Class {
  init = function(self, name, spriteName, pos)
    self.name = name
    self.sprite = assets.images[spriteName]
    self.pos = pos
    self.scale = 2
  end,

  bounds = function(self)
    local w, h = self.sprite:getDimensions()
    local x, y = self.pos:unpack()
    local a = vec(x - (w*self.scale)/2, y - (h*self.scale)/2)
    local b = vec(x + (w*self.scale)/2, y + (h*self.scale)/2)
    return a, b
  end,

  draw = function(self)
    local w, h = self.sprite:getDimensions()
    love.graphics.draw(self.sprite, self.pos.x, self.pos.y, 0, self.scale, self.scale, w/2, h/2)
  end,

  draggable = true,
  selectable = true,
}
