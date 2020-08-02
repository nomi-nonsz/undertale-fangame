-- ini hanya hasil modifikasi dari bullettest touhou, gimana? kayak touhou kan? :v
spawntimer = 0
spells = {}
x = 250
y = 250
Arena.ResizeImmediate(250, 250)

function Update()
    spawntimer = spawntimer + 1
    if(spawntimer % 30 == 0) then
        local numbullets = 10
        local rotate = -10
        Audio.PlaySound('attack_touhou', 0.2)
        for i=1,numbullets+1 do
            local spell = CreateProjectile('spell', x, y)
            spell.SetVar('timer', 30)
            spell.SetVar('offset', math.pi * 16 * i / rotate)
            spell.SetVar('lerp', 0)
            table.insert(spells, spell)
        end
    end

    for i=1,#spells do
        local spell = spells[i]
        local timer = spell.GetVar('timer')
        local offset = spell.GetVar('offset')
        local lerp = spell.GetVar('lerp')
        local neg = 1
        local posx = (70*lerp)*math.sin(timer + offset)
        local posy = (70*lerp)*math.cos(timer + offset)
        spell.MoveTo(posx, posy)
        spell.SetVar('timer', timer + 1/40)
        lerp = lerp + 1 / 90
        spell.SetVar('lerp', lerp)
    end
end

function OnHit(spell)
    Player.Hurt(1,0.01)
    Audio.PlaySound('hit')
end