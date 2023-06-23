debug = true
playerImg = nil

function love.load(arg)
    player = { x = 200, y = 710, speed = 150, img = nil} 
    player.img = love.graphics.newImage('assets/plane.png')
end

function love.update(dt)
    if love.keyboard.isDown('escape') then
        love.event.push('quit')
    end

    if love.keyboard.isDown('left', 'a') then
        player.x = player.x - (player.speed*dt)
    elseif love.keyboard.isDown('right', 'd') then
        player.x = player.x + (player.speed*dt)
    end
end

function love.draw(dt)
    love.graphics.draw(player.img, player.x, player.y)
end
