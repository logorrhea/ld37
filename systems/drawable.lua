local drawable = tiny.processingSystem()
drawable.filter = tiny.requireAll('sprite', 'draw')

function drawable:process(e, dt)
  e:draw()
end

return drawable
