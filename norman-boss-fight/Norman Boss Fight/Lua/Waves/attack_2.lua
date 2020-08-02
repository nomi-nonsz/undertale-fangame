-- ini modifikasi dari spelltest_touhou juga, tapi variable-nya ku ubah
-- ketika undertale serasa touhou :v
-- gimana ngelegnya? >:)
spawntimer = 0
spells = {}
x = 120
y = 180

function Update()
    spawntimer = spawntimer + 1
    if(spawntimer % 30 == 1) then
        local numspells = 40
        Audio.PlaySound('attack_touhou', 0.2)
        for i=1,numspells+1 do
            local spell = CreateProjectile('spell', x, y)
            spell.SetVar('gerak', 2 * math.pi * 4)
            spell.SetVar('gerakan', 0)
            spell.SetVar('putar', math.pi * 2 * i / numspells + math.random(40))
            spell.SetVar('luncuran', 0)
            table.insert(spells, spell)
        end
    end

    for i=1,#spells do
        local spell = spells[i]
        local gerak = spell.GetVar('gerak')
        local putar = spell.GetVar('putar')
        local luncuran = spell.GetVar('luncuran')
        local gerakan = spell.GetVar('gerakan')
        local posx = (0.5*luncuran)*math.sin(gerak + putar)
        local posy = (0.5*luncuran)*math.cos(gerak + putar) + y
        spell.MoveTo(posx, posy)
        spell.SetVar('luncuran', luncuran + 5)
        luncuran = luncuran + 1 / 90
        spell.SetVar('gerak', gerak)
    end
end

function OnHit(spell)
    Player.Hurt(1,0.01)
    Audio.PlaySound('hit')
end