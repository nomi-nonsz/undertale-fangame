-- nah, kalo ini coding sendiri, variables juga buat sendiri, tapi ini sih hampir niru bullettest_touhou
spawntimer = 0
orbits = {}
x = 120
y = 180

function Update()
    spawntimer = spawntimer + 1
    if (spawntimer % 30 == 1) then
        local orbit = 20
        Audio.PlaySound('laser_touhou', 0.2)
        for i=1,orbit+1 do
            local spell = CreateProjectile('spell', x, y)
            spell.SetVar('gerak', 0)
            spell.SetVar('spawn', i * math.random(120))
            table.insert(orbits, spell)
        end
    end

    for i=1,#orbits do
        local spell = orbits[i]
        local gerak = spell.GetVar('gerak')
        local spawn = spell.GetVar('spawn')
        local posx = spawn*math.sin(gerak + 30) + x
        local posy = spawn*(gerak) - y
        spell.MoveTo(posx, posy)
        spell.SetVar('gerak', gerak + 0.015)
    end
end

function OnHit(spell)
    Player.Hurt(1,0.01)
    Audio.PlaySound('hit')
end