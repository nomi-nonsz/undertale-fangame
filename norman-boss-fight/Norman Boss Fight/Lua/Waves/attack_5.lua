-- yang ini adalah duplikat dari attack_4 hanya saja variabel rotasinya diubah
-- ini baru kusebut the touhou attack :v
spawntimer = 0
spells = {}
spellsa = {}
x = 180
y = 180

function Update()
    spawntimer = spawntimer + 1
    if(spawntimer % 30 == 1) then
        local orba = 10
        Audio.PlaySound('attack_touhou', 0.2)
        for i=1,orba+1 do
            local spella = CreateProjectile('spell', x, y)
            spella.SetVar('waktu', 0)
            spella.SetVar('peluncuran', math.pi * 2 * i / orba)
            spella.SetVar('rotasi', 0)
            table.insert(spells, spella)
        end
    elseif(spawntimer % 30 == 2) then
        local orbb = 10
        Audio.PlaySound('attack_touhou', 0.2)
        for i=1,orbb+1 do
            local spellb = CreateProjectile('spell', x, y)
            spellb.SetVar('waktus', 0)
            spellb.SetVar('peluncurans', math.pi * 2 * i / orbb)
            spellb.SetVar('rotasis', 0)
            table.insert(spellsa, spellb)
        end
    end

    for i=1,#spells do
        local spella = spells[i]
        local waktu = spella.GetVar('waktu')
        local peluncuran = spella.GetVar('peluncuran')
        local rotasi = spella.GetVar('rotasi')
        local posxa = (250*rotasi)*math.sin(waktu + peluncuran) + x
        local posya = (250*rotasi)*math.cos(waktu + peluncuran) + y
        spella.MoveTo(posxa, posya)
        spella.SetVar('waktu', waktu + 0.6)
        rotasi = rotasi + 1 / 90
        spella.SetVar('rotasi', rotasi)
    end

    for i=1,#spellsa do
        local spellb = spellsa[i]
        local waktus = spellb.GetVar('waktus')
        local peluncurans = spellb.GetVar('peluncurans')
        local rotasis = spellb.GetVar('rotasis')
        local posxb = (250*rotasis)*math.sin(waktus + peluncurans) - x
        local posyb = (250*rotasis)*math.cos(waktus + peluncurans) + y
        spellb.MoveTo(posxb, posyb)
        spellb.SetVar('waktus', waktus + 0.6)
        rotasis = rotasis + 1 / 90
        spellb.SetVar('rotasis', rotasis)
    end
end

function OnHit(spella)
    Player.Hurt(1,0.01)
    Audio.PlaySound('hit')
end