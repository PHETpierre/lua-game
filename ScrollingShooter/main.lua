debug = true
playerImg = nil
canShoot = true
canShootTimerMax = 0.2
canShootTimer = canShootTimerMax

bulletImg = nil
bullets = {}

function love.load(arg)
    player = { x = 200, y = 710, speed = 150, img = nil} 
    player.img = love.graphics.newImage('assets/plane.png')
    bulletImg = love.graphics.newImage('assets/bullet_2_blue.png')
end

function love.update(dt)
    if love.keyboard.isDown('escape') then
        love.event.push('quit')
    end

    if love.keyboard.isDown('left', 'a') then
        if player.x > 0 then
            player.x = player.x - (player.speed*dt)
        end
    elseif love.keyboard.isDown('right', 'd') then
        if player.x < (love.graphics.getWidth() - player.img:getWidth()) then
            player.x = player.x + (player.speed*dt)
        end
    end

    canShootTimer = canShootTimer - (1 * dt)
    if canShootTimer < 0 then
        canShoot = true
    end

    if.love.keyboard.isDown('space', 'rctrl', 'lctrl') and canShoot then
        newBullet = { x = player.x + (player.img:getWidth()/2), y = player.y, img = bulletImg }
        table.insert(bullets, newBullet)
        canShoot = false
        canShootTimer = canShootTimerMax
    end
end

function love.draw(dt)
    love.graphics.draw(player.img, player.x, player.y)
end
