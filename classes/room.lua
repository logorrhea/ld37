Room = Class {
  init = function(self, spriteName)
    self.sprite = assets.images[spriteName]
  end,

  draw = function(self)
    love.graphics.draw(self.sprite, self.pos.x, self.pos.y)
  end,

  pos = vec(50, 50)
}
