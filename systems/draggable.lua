local draggable = tiny.processingSystem()
draggable.filter = tiny.requireAll('draggable', 'pos')

function draggable:process(e, dt)

  if e.selected and love.mouse.isDown(1) then
    if e.joint and not e.joint:isDestroyed() then
      e.joint:setTarget(love.mouse.getPosition())
    else
      e.joint = love.physics.newMouseJoint(e.body, love.mouse.getPosition())
    end
  else
    if e.joint and not e.joint:isDestroyed() then
      e.joint:destroy()
    end
  end

end

return draggable
