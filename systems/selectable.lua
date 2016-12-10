local mouse = love.mouse

local selectable = tiny.processingSystem()
selectable.filter = tiny.requireAll('selectable', 'bounds')

function selectable:process(e, dt)
  local mx, my, hitval

  if e.selected and love.mouse.lastRelease then
    e.selected = false
    e.lastMouse = nil
  elseif love.mouse.lastPress then
    hitval = true
    mx, my = love.mouse.lastPress.x, love.mouse.lastPress.y
    if mx ~= nil and my ~= nil and hitval ~= nil then
      local a, b = e:bounds()
      if mx > a.x and mx < b.x and my > a.y and my < b.y then
        e.selected = true
        e.lastMouse = vec(mx, my)
      else
        e.selected = false
      end
    end
  end

end


return selectable
