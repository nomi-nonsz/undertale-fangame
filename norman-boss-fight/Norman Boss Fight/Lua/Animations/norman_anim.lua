-- ini adalah animasi Norman, capek tau buatanya x_x
-- masih nub ae :v
shoes = CreateSprite("norman/animated/shoes/shoes")
legs = CreateSprite("norman/animated/legs/legs")
body = CreateSprite("norman/animated/body/body")

headnormal = CreateSprite("norman/animated/head/normal/0")
headopen = CreateSprite("norman/animated/head/buka/0")
headright = CreateSprite("norman/animated/head/kanan/0")
headclose = CreateSprite("norman/animated/head/kedip/0")

deathangry = CreateSprite("norman/death/angry")
deathclose = CreateSprite("norman/death/close")
deathopen = CreateSprite("norman/death/open")
deathright = CreateSprite("norman/death/right")

headnormal.SetAnimation({"norman/animated/head/normal/0", "norman/animated/head/normal/1"}, 0.4)
headopen.SetAnimation({"norman/animated/head/buka/0", "norman/animated/head/buka/1"}, 0.4)
headright.SetAnimation({"norman/animated/head/kanan/0", "norman/animated/head/kanan/1"}, 0.4)
headclose.SetAnimation({"norman/animated/head/kedip/0", "norman/animated/head/kedip/1"}, 0.4)

headnormal.alpha = 0
headopen.alpha = 0
headright.alpha = 0
headclose.alpha = 0

deathangry.alpha = 0
deathclose.alpha = 0
deathopen.alpha = 0
deathright.alpha = 0

body.alpha = 0
legs.alpha = 0
shoes.alpha = 0

headnormal.x = 320
headnormal.y = 430
headopen.x = 320
headopen.y = 430
headright.x = 320
headright.y = 430
headclose.x = 320
headclose.y = 430

body.x = 320
body.y = 360
legs.x = 320
legs.y = 290

shoes.x = 317
shoes.y = 239

headnormal.SetAnchor(0.0, -1.5)
headnormal.SetPivot(-5.525, -7.65)
headopen.SetAnchor(0.0, -1.5)
headopen.SetPivot(-5.525, -7.65)
headright.SetAnchor(0.0, -1.5)
headright.SetPivot(-5.525, -7.65)
headclose.SetAnchor(0.0, -1.5)
headclose.SetPivot(-5.525, -7.65)

deathangry.SetAnchor(0.0, 0.0)
deathangry.SetPivot(-1.5, -1.0)
deathclose.SetAnchor(0.0, 0.0)
deathclose.SetPivot(-1.5, -1.0)
deathopen.SetAnchor(0.0, 0.0)
deathopen.SetPivot(-1.5, -1.0)
deathright.SetAnchor(0.0, 0.0)
deathright.SetPivot(-1.5, -1.0)

body.SetAnchor(0.0, -1.5)
body.SetPivot(-1.475, -3.23)
legs.SetAnchor(0.0, -1.5)
legs.SetPivot(-1.475, -3.23)

function AnimateNorman()
    if GetGlobal("animation") == "start" then
        headnormal.alpha = 1

        body.alpha = 1
        legs.alpha = 1
        shoes.alpha = 1
    end

    if GetGlobal("sethead") == "normal" then
        headnormal.alpha = 1
        headopen.alpha = 0
        headright.alpha = 0
        headclose.alpha = 0
    elseif GetGlobal("sethead") == "open" then
        headopen.alpha = 1
        headnormal.alpha = 0
        headright.alpha = 0
        headclose.alpha = 0
    elseif GetGlobal("sethead") == "right" then
        headright.alpha = 1
        headnormal.alpha = 0
        headopen.alpha = 0
        headclose.alpha = 0
    elseif GetGlobal("sethead") == "close" then
        headclose.alpha = 1
        headnormal.alpha = 0
        headopen.alpha = 0
        headright.alpha = 0
    end
    
    headnormal.MoveTo(0, 1.5*math.cos(Time.time * 2))
    headopen.MoveTo(0, 1.5*math.cos(Time.time * 2))
    headright.MoveTo(0, 1.5*math.cos(Time.time * 2))
    headclose.MoveTo(0, 1.5*math.cos(Time.time * 2))

    body.MoveTo(0, 1.2*math.cos(Time.time))
    legs.MoveTo(0, 0.8*math.cos(Time.time))

    if GetGlobal("end") == "stop" then
        headnormal.alpha = 0
        headopen.alpha = 0
        headright.alpha = 0
        headclose.alpha = 0

        body.alpha = 0
        legs.alpha = 0
        shoes.alpha = 0
    end
    
    if GetGlobal("death") == "angrydeath" then
        deathangry.alpha = 1
        deathclose.alpha = 0
        deathopen.alpha = 0
        deathright.alpha = 0
    elseif GetGlobal("death") == "closedeath" then
        deathangry.alpha = 0
        deathclose.alpha = 1
        deathopen.alpha = 0
        deathright.alpha = 0
    elseif GetGlobal("death") == "opendeath" then
        deathangry.alpha = 0
        deathclose.alpha = 0
        deathopen.alpha = 1
        deathright.alpha = 0
    elseif GetGlobal("death") == "rightdeath" then
        deathangry.alpha = 0
        deathclose.alpha = 0
        deathopen.alpha = 0
        deathright.alpha = 1
    elseif GetGlobal("death") == "stop" then
        deathangry.alpha = 0
        deathclose.alpha = 0
        deathopen.alpha = 0
        deathright.alpha = 0
    end

    deathangry.MoveTo(1*math.cos(Time.time * 80), 0)
    deathclose.MoveTo(1*math.cos(Time.time * 80), 0)
    deathopen.MoveTo(1*math.cos(Time.time * 80), 0)
    deathright.MoveTo(1*math.cos(Time.time * 80), 0)
end