-- yang ini adalah modifikasi dari attack_6 hanya spawn dan speednya beda dan posisinya tetap
-- ini baru kusebut the touhou attack :v
spawntimer = 0
spells = {}
spellsa = {}
spellsb = {}
x = 180
y = 180

function Update()
    spawntimer = spawntimer + 1
    if(spawntimer % 120 == 10) then
        local orba = 30
        Audio.PlaySound('attack_touhou', 0.2)
        for i=1,orba+1 do
            local spella = CreateProjectile('spell', x, y)
            spella.SetVar('waktu', 0)
            spella.SetVar('peluncuran', orba * i / math.random(35) * 20)
            spella.SetVar('rotasi', 0)
            table.insert(spells, spella)
        end
    elseif(spawntimer % 120 == 40) then
        local orbb = 30
        Audio.PlaySound('attack_touhou', 0.2)
        for i=1,orbb+1 do
            local spellb = CreateProjectile('spell', x, y)
            spellb.SetVar('waktus', 0)
            spellb.SetVar('peluncurans', orbb * i / math.random(35) * 20)
            spellb.SetVar('rotasis', 0)
            table.insert(spellsa, spellb)
        end
    elseif(spawntimer % 120 == 80) then
        local orbc = 30
        Audio.PlaySound('attack_touhou', 0.2)
        for i=1,orbc+1 do
            local spellc = CreateProjectile('spell', x, y)
            spellc.SetVar('waktuss', 0)
            spellc.SetVar('peluncuranss', orbc * i / math.random(35) * 20)
            spellc.SetVar('rotasiss', 0)
            table.insert(spellsb, spellc)
        end
    end

    for i=1,#spells do
        local spella = spells[i]
        local waktu = spella.GetVar('waktu')
        local peluncuran = spella.GetVar('peluncuran')
        local rotasi = spella.GetVar('rotasi')
        local posxa = (110*rotasi)*math.cos(waktu + peluncuran)
        local posya = (110*rotasi)*math.sin(waktu + peluncuran) + y
        spella.MoveTo(posxa, posya)
        rotasi = rotasi + 1 / 80
        spella.SetVar('waktu', waktu + 0.02)
        spella.SetVar('rotasi', rotasi)
    end

    for i=1,#spellsa do
        local spellb = spellsa[i]
        local waktus = spellb.GetVar('waktus')
        local peluncurans = spellb.GetVar('peluncurans')
        local rotasis = spellb.GetVar('rotasis')
        local posxb = (120*rotasis)*math.sin(waktus + peluncurans)
        local posyb = (120*rotasis)*math.cos(waktus + peluncurans) + y
        spellb.MoveTo(posxb, posyb)
        rotasis = rotasis + 1 / 80
        spellb.SetVar('waktus', waktus + 0.02)
        spellb.SetVar('rotasis', rotasis)
    end
    
    for i=1,#spellsb do
        local spellc = spellsb[i]
        local waktuss = spellc.GetVar('waktuss')
        local peluncuranss = spellc.GetVar('peluncuranss')
        local rotasiss = spellc.GetVar('rotasiss')
        local posxc = (140*rotasiss)*math.sin(waktuss + peluncuranss)
        local posyc = (140*rotasiss)*math.cos(waktuss + peluncuranss) + y
        spellc.MoveTo(posxc, posyc)
        rotasiss = rotasiss + 1 / 80
        spellc.SetVar('waktuss', waktuss + 0.02)
        spellc.SetVar('rotasiss', rotasiss)
    end
end

function OnHit(spella)
    Player.Hurt(1,0.01)
    Audio.PlaySound('hit')
end