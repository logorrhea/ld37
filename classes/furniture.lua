Furniture = Class {
  init = function(self, name, spriteName, pos)
    self.name = name
    self.sprite = assets.images[spriteName]
    self.pos = pos
  end,

  bounds = function(self)
    local w, h = self.sprite:getDimensions()
    local x, y = self.pos:unpack()
    local a = vec(x - w/2, y - h/2)
    local b = vec(x + w/2, y + h/2)
    return a, b
  end,

  draw = function(self)
    local w, h = self.sprite:getDimensions()
    love.graphics.draw(self.sprite, self.pos.x, self.pos.y, 0, 1, 1, w/2, h/2)
  end,

  draggable = true,
  selectable = true,
}
