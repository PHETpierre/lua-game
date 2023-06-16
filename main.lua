function love.load()
    -- love.graphics.setColor(0, 0, 0)
    love.window.setMode(10, 10)
    animation = newAnimation(love.graphics.newImage("oldHero.png"), 16, 18, 1)
end

function love.update(dt)
    animation.currentTime = animation.currentTime + dt
    if animation.currentTime >= animation.duration then
        animation.currentTime = animation.currentTime - animation.duration
    end
end

function love.draw()
    love.graphics.print("not black")
    love.graphics.setColor(255, 0, 0)
    -- love.graphics.print("hello !", 400 ,300)
    love.graphics.print("red text", 100, 200)
    local spriteNum = math.floor(animation.currentTime / animation.duration * #animation.quads) + 1
    love.graphics.draw(animation.spriteSheet, animation.quads[spriteNum], 0, 0, 0, 4)
end

function love.keypressed(key)
    if key == 'b' then
        text = "The B key was pressed"
        print(text)
    elseif key == 'a' then
        a_down = true
    end
end

function newAnimation(image, width, height, duration)
   local animation = {} 
   animation.spriteSheet = image
   animation.quads = {}

   for y = 0, image:getHeight() - height, height do
       for x = 0, image:getWidth() - width, width do
           table.insert(animation.quads, love.graphics.newQuad(x, y, width, height, image:getDimensions()))
       end
   end

   animation.duration = duration or 1
   animation.currentTime = 0
   return animation
end
