local draggable = tiny.processingSystem()
draggable.filter = tiny.requireAll('draggable', 'pos')

function draggable:process(e, dt)

  -- Check movement if this unit is selected
  if e.selected and love.mouse.isDown(1) then
    if e.lastMouse then
      local m = vec(love.mouse.getPosition())
      -- e.pos = e.pos + (m - e.lastMouse)
      -- e.body:setPosition(e.pos:unpack())

      local pos = vec(e.body:getPosition())
      pos = pos + (m - e.lastMouse)
      e.body:setPosition(pos:unpack())

      e.lastMouse = m
    end
  end

end

return draggable
