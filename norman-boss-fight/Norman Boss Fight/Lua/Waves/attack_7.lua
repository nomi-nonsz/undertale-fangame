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
    if(spawntimer % 30 == 10) then
        local orba = 30
        Audio.PlaySound('attack_touhou', 0.2)
        for i=1,orba+1 do
            local spella = CreateProjectile('spell', x, y)
            spella.SetVar('waktu', 0)
            spella.SetVar('peluncuran', orba * i / math.random(35) * 20)
            spella.SetVar('rotasi', 0)
            table.insert(spells, spella)
        end
    elseif(spawntimer % 30 == 20) then
        local orbb = 30
        Audio.PlaySound('attack_touhou', 0.2)
        for i=1,orbb+1 do
            local spellb = CreateProjectile('spell', x, y)
            spellb.SetVar('waktus', 0)
            spellb.SetVar('peluncurans', orbb * i / math.random(35) * 20)
            spellb.SetVar('rotasis', 0)
            table.insert(spellsa, spellb)
        end
    elseif(spawntimer % 30 == 30) then
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
        local posxa = (30*waktu)*math.sin(peluncuran + rotasi)
        local posya = (30*waktu)*math.cos(peluncuran + rotasi) + y
        spella.MoveTo(posxa, posya)
        spella.SetVar('waktu', waktu + 0.15)
    end

    for i=1,#spellsa do
        local spellb = spellsa[i]
        local waktus = spellb.GetVar('waktus')
        local peluncurans = spellb.GetVar('peluncurans')
        local rotasis = spellb.GetVar('rotasis')
        local posxb = (24*waktus)*math.cos(peluncurans + rotasis)
        local posyb = (24*waktus)*math.sin(peluncurans + rotasis) + y
        spellb.MoveTo(posxb, posyb)
        spellb.SetVar('waktus', waktus + 0.15)
    end
    
    for i=1,#spellsb do
        local spellc = spellsb[i]
        local waktuss = spellc.GetVar('waktuss')
        local peluncuranss = spellc.GetVar('peluncuranss')
        local rotasiss = spellc.GetVar('rotasiss')
        local posxc = (15*waktuss)*math.sin(peluncuranss + rotasiss)
        local posyc = (15*waktuss)*math.cos(peluncuranss + rotasiss) + y
        spellc.MoveTo(posxc, posyc)
        spellc.SetVar('waktuss', waktuss + 0.15)
    end
end

function OnHit(spella)
    Player.Hurt(1,0.01)
    Audio.PlaySound('hit')
end