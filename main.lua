Class = require 'lib.class'
tiny = require 'lib.tiny'
vec = require 'lib.vector'

-- Load in assets
assets = require('lib.cargo').init('assets')

-- Store mousedata

-- Load Classes
require 'classes.furniture'
require 'classes.room'

function love.load()
  local room = Room('room-001')
  local clock = Furniture('clock', 'clock', vec(200, 200))

  world = tiny.world(
    -- entities
    clock,

    room,

    -- systems
    -- require 'systems.selectable',
    require 'systems.draggable',
    require 'systems.drawable'
  )

  love.graphics.setBackgroundColor(255, 255, 255)
end

function love.draw()
  local dt = love.timer.getDelta()
  if world then
    world:update(dt)
  end
end

function love.keypressed(k, s, r)
  if s == 'escape' then
    love.event.quit()
  end
end

-- Wish there was a cleaner way to do the mouse pressed / released stuff =(
function love.mousepressed(x, y, button)
  if world then
    for i, e in ipairs(world.entities) do

      if e.selectable then
        local a, b = e:bounds()
        if x > a.x and x < b.x and y > a.y and y < b.y then
          e.selected = true
          e.lastMouse = vec(x, y)
        else
          e.selected = false
          e.lastMouse = nil
        end
      end

    end
  end
end

function love.mousereleased(x, y, button)
  if world then
    for i, e in ipairs(world.entities) do

      if e.selectable then
        e.selected = false
      end

    end
  end
end

-- function love.mousepressed(x, y, button)
--   love.mouse.lastRelease = nil
--   love.mouse.lastPress = {
--     x = x,
--     y = y,
--     button = button
--   }
-- end

-- function love.mousereleased(x, y, button)
--   love.mouse.lastPress = nil
--   love.mouse.lastRelease = {
--     x = x,
--     y = y,
--     button = button,
--   }
-- end

-- function love.mousemoved(x, y, dx, dy)
--   love.mouse.lastMove = {
--     x = x,
--     y = y,
--     dx = dx,
--     dy = dy,
--   }
-- end
