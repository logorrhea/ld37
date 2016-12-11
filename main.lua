function love.load()

  -- Require all the things
  Class = require 'lib.class'
  tiny = require 'lib.tiny'
  vec = require 'lib.vector'


  -- Load in assets
  assets = require('lib.cargo').init({
      dir = 'assets',
      processors = {
        ['images/'] = function(image, filename)
          image:setFilter('nearest', 'nearest')
        end
      }
  })


  -- Load Classes
  require 'classes.furniture'
  require 'classes.room'

  -- Init Fizzicks
  love.physics.setMeter(64)
  pworld = love.physics.newWorld(0, 0, true)

  -- Create some stuff and junk
  local room = Room('room-001')
  local clock = Furniture('clock', 'clock', vec(200, 200))
  local toilet = Furniture('toilet', 'toilet', vec(400, 400))


  world = tiny.world(
    -- add the room first, so that it draws underneath everything else
    room,

    -- entities
    -- clock,
    -- toilet,
    -- toilet,
    Furniture('clock', 'clock', vec(200, 200)),
    Furniture('toilet', 'toilet', vec(400, 200)),
    Furniture('toilet', 'toilet', vec(600, 200)),

    -- systems
    require 'systems.draggable',
    require 'systems.drawable'
  )

  -- Create low-res canvas to be scaled up later
  -- local w, h = love.graphics.getDimensions()
  -- local x, y = 480, 320
  -- canvas = love.graphics.newCanvas(x, y)
  -- canvasScaleX = w/x
  -- canvasScaleY = h/y

  love.graphics.setDefaultFilter('nearest', 'nearest', 0)
  love.graphics.setBackgroundColor(255, 255, 255)
end

function love.update(dt)
  -- if pworld then
  --   pworld:update(dt)
  -- end

  -- if processor then
  --   processor:update(dt)
  -- end
end

function love.draw()
  local dt = love.timer.getDelta()
  if pworld then
    pworld:update(dt)
  end
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
