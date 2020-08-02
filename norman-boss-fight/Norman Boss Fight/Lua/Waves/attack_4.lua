-- kalo ini modifikasi dari bullettest_touhou cuman variabelnya dibedakan
spawntimer = 0
spells = {}
x = 100
y = 180

function Update()
    spawntimer = spawntimer + 1
    if(spawntimer % 30 == 1) then
        local orb = 10
        Audio.PlaySound('attack_touhou', 0.2)
        for i=1,orb+1 do
            local spell = CreateProjectile('spell', x, y)
            spell.SetVar('waktu', 0)
            spell.SetVar('peluncuran', math.pi * 2 * i / orb)
            spell.SetVar('rotasi', 0)
            table.insert(spells, spell)
        end
    end

    for i=1,#spells do
        local spell = spells[i]
        local waktu = spell.GetVar('waktu')
        local peluncuran = spell.GetVar('peluncuran')
        local rotasi = spell.GetVar('rotasi')
        local posx = (220*rotasi)*math.sin(waktu + peluncuran)
        local posy = (220*rotasi)*math.cos(waktu + peluncuran) + y
        spell.MoveTo(posx, posy)
        spell.SetVar('waktu', waktu + 0.6)
        rotasi = rotasi + 1 / 90
        spell.SetVar('rotasi', rotasi)
    end
end

function OnHit(spell)
    Player.Hurt(1,0.01)
    Audio.PlaySound('hit')
end