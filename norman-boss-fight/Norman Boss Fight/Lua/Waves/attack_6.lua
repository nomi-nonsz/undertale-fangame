-- yang ini adalah modifikasi dari attack_5 hanya saja peluncuran spellnya random
-- ini baru kusebut the touhou attack :v
spawntimer = 0
spells = {}
spellsa = {}
x = 180
y = 180

function Update()
    spawntimer = spawntimer + 1
    if(spawntimer % 30 == 1) then
        local orba = 30
        Audio.PlaySound('attack_touhou', 0.2)
        for i=1,orba+1 do
            local spella = CreateProjectile('spell', x, y)
            spella.SetVar('waktu', 0)
            spella.SetVar('peluncuran', orba * i / math.random(35) * 20)
            spella.SetVar('rotasi', 0)
            table.insert(spells, spella)
        end
    elseif(spawntimer % 30 == 2) then
        local orbb = 30
        Audio.PlaySound('attack_touhou', 0.2)
        for i=1,orbb+1 do
            local spellb = CreateProjectile('spell', x, y)
            spellb.SetVar('waktus', 0)
            spellb.SetVar('peluncurans', orbb * i / math.random(35) * 20)
            spellb.SetVar('rotasis', 0)
            table.insert(spellsa, spellb)
        end
    end

    for i=1,#spells do
        local spella = spells[i]
        local waktu = spella.GetVar('waktu')
        local peluncuran = spella.GetVar('peluncuran')
        local rotasi = spella.GetVar('rotasi')
        local posxa = (30*waktu)*math.sin(peluncuran + rotasi) + x
        local posya = (30*waktu)*math.cos(peluncuran + rotasi) + y
        spella.MoveTo(posxa, posya)
        spella.SetVar('waktu', waktu + 0.15)
    end

    for i=1,#spellsa do
        local spellb = spellsa[i]
        local waktus = spellb.GetVar('waktus')
        local peluncurans = spellb.GetVar('peluncurans')
        local rotasis = spellb.GetVar('rotasis')
        local posxb = (30*waktus)*math.sin(peluncurans + rotasis) - x
        local posyb = (30*waktus)*math.cos(peluncurans + rotasis) + y
        spellb.MoveTo(posxb, posyb)
        spellb.SetVar('waktus', waktus + 0.15)
    end
end

function OnHit(spella)
    Player.Hurt(1,0.01)
    Audio.PlaySound('hit')
end