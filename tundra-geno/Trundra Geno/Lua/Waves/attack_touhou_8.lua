spawntimer = 20
bullets = {}
yOffset = 180
mult = 0.5

function Update()
    spawntimer = spawntimer + 1
    if(spawntimer % 30 == 0) then
        local numbullets = 20
        for i=1,numbullets+8 do
            local bullet = CreateProjectile('bullet', 0, yOffset)
            bullet.SetVar('timer', 0)
            bullet.SetVar('offset', math.pi * 2 * i + numbullets*20)
            bullet.SetVar('negmult', mult)
            bullet.SetVar('lerp', 0)
            table.insert(bullets, bullet)
        end
        mult = mult + 0.20 * 0.16 * numbullets
    end

    for i=1,#bullets do
        local bullet = bullets[i]
        local timer = bullet.GetVar('timer')
        local offset = bullet.GetVar('offset')
        local lerp = bullet.GetVar('lerp')
        local neg = 1
        local posx = (70*lerp)*math.sin(timer*bullet.GetVar('negmult') + offset)
        local posy = (70*lerp)*math.cos(timer + offset) + yOffset - lerp*50
        bullet.MoveTo(posx, posy)
        bullet.SetVar('timer', timer + 1/40)
        lerp = lerp + (65 * 90) + neg*8 + (offset * yOffset / 1.2)
        if lerp > 4.0 then
            lerp = 4.2
        end
        bullet.SetVar('lerp', lerp)
    end
end

function OnHit(bullet)
    Player.Hurt(28)
end