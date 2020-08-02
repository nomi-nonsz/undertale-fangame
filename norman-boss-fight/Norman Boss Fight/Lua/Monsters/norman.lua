comments = {"dia menjadi marah"}
commands = {"Check", "flirt", "insult"}
randomdialogue = {"[next]"}

sprite = "void"
name = "Norman"
hp = 100000
atk = 20
def = 25
check = ""
dialogbubble = "rightwide"
canspare = false
cancheck = false
xp = 340
gold = 450

function LaunchMusic()
    Audio.Unpause()
end

function ApiMenjalar(nomAnim)
    SetGlobal("menjalar", nomAnim)
end

function NormanAnima(nomAnim)
    SetGlobal("animation", nomAnim)
end

function HandleAttack(attackstatus)
    if attackstatus == -1 then
        currentdialogue = {"[next]"}
    else
        -- awok awok :v the easter egg :v
        if hp < 5 then
            currentdialogue = {"[effect:none][func:SetAnim,close]jadi apa rencanamu, [w:8]membunuhku", "[effect:none][func:SetAnim,open]silahkan saja tapi jika kau mampu!", "[func:SetAnim,normal][next]"}
        elseif hp < 10000 then
            currentdialogue = {"[effect:none][func:SetAnim,close]kau malah memperburuk keadaan", "[func:SetAnim,normal][next]"}
        elseif hp < 15000 then
            currentdialogue = {"[effect:none][func:SetAnim,right]aku masih tidak mengerti...", "[effect:none][func:SetAnim,open]apa masalahmu", "[func:SetAnim,normal][next]"}
        elseif hp < 20000 then
            currentdialogue = {"[effect:none][func:SetAnim,close]seharusnya, [w:8]jika kau menghadapi monster, [w:8]kau harus menolaknya", "[effect:none][func:SetAnim,right]tapi, [w:8]kau malah membunuh mereka", "[func:SetAnim,normal][next]"}
        elseif hp < 25000 then
            currentdialogue = {"[effect:none][func:SetAnim,right]...", "[effect:none][func:SetAnim,close]masih belum menyerah huh?", "[func:SetAnim,normal][next]"}
        elseif hp < 30000 then
            currentdialogue = {"[effect:none][func:SetAnim,open]kau masih belum mengenal perdamaian", "[effect:none][func:SetAnim,close]lagi pula... [w:8]perdamain lebih kuat...", "[effect:none][func:SetAnim,open]dari pada perselisihan", "[func:SetAnim,normal][next]"}
        elseif hp < 35000 then
            currentdialogue = {"[effect:none][func:SetAnim,close]aku punya pertanyaan...", "[effect:none][func:SetAnim,open]Sampai kapan kau bertobat", "[func:SetAnim,normal][next]"}
        elseif hp < 40000 then
            currentdialogue = {"[effect:none][func:SetAnim,right]lihatlah dirimu...", "[effect:none][func:SetAnim,open]seperti pembunuh", "[func:SetAnim,normal][next]"}
        elseif hp < 45000 then
            currentdialogue = {"[effect:none][func:SetAnim,close]huhh...", "[effect:none][func:SetAnim,right]aku terlalu noob dalam membuat waves di script", "[func:SetAnim,normal][next]"}
        elseif hp < 50000 then
            currentdialogue = {"[effect:none][func:SetAnim,right]untung saja, [w:8]aku membuat script ini", "[effect:none][func:SetAnim,open][waitall:5]...", "[effect:none][func:SetAnim,close]setidaknya aku bisa meluangkan waktu untuk sans", "[func:SetAnim,normal][next]"}
        elseif hp < 55000 then
            currentdialogue = {"[effect:none][func:SetAnim,close]mungkin, [w:8]aku akan mengubah sprite waves bullets", "[func:SetAnim,normal][next]"}
        elseif hp < 60000 then
            currentdialogue = {"[effect:none]anak sepertimu belum tau, [w:8]mana yang benar dan mana yang salah"}
        elseif hp < 65000 then
            currentdialogue = {"[effect:none][func:SetAnim,open]kau tau kau sedang melakukan apa", "[effect:none][func:SetAnim,normal]kau adalah anak pembunuh"}
        elseif hp < 70000 then
            currentdialogue = {"[effect:none][func:SetAnim,open]jika kau ingin melawan sans dan asgore, [w:8]hadapi aku dulu", "[func:SetAnim,normal][next]"}
        elseif hp < 75000 then
            currentdialogue = {"[effect:none][func:SetAnim,close]kau tidak peduli dengan siapa kau bunuh", "[effect:none][func:SetAnim,normal]tapi kau hanya peduli xp agar levelmu meningkat"}
        elseif hp < 80000 then
            currentdialogue = {"[effect:none][func:SetAnim,close]nak", "[effect:none][func:SetAnim,normal]kau sudah keterlaluan"}
        elseif hp < 85000 then
            currentdialogue = {"[effect:none][func:SetAnim,close]kau harus memperbaiki ini dengan hanya menekan tombol", "[effect:none][func:SetAnim,open]dan kau akan mendapatkan ending yang indah", "[effect:none][func:SetAnim,close]tapi sudah terlambat", "[func:SetAnim,normal][next]"}
        elseif hp < 90000 then
            currentdialogue = {"[effect:none][func:SetAnim,open]kapan, [w:8]kapan kah kau akan berubah?", "[func:SetAnim,normal][next]"}
        elseif hp < 95000 then
            currentdialogue = {"[effect:none][func:SetAnim,open]kau hanya membuat ini menjadi lebih sulit", "[effect:none][func:SetAnim,right]meskipun aku tidak mengubah waves demage bullet", "[func:SetAnim,normal][next]"}
        elseif hp < 99000 then
            currentdialogue = {"[effect:none][func:SetAnim,close]jika kau ingin mengubah hidupmu, [w:6][func:SetAnim,right]kau hanya melakukan satu hal...", "[effect:none][func:SetAnim,open]reset.", "[func:SetAnim,normal][next]"}
        end
    end
end

function HandleCustomCommand(command)
    if command == "CHECK" then
        BattleDialog({"Norman 1 ATK 45 DEF\n[w:8]noob coder yang berusia 13 tahun"})
    elseif command == "FLIRT" then
        BattleDialog{("kau bermain mata dengannya. [w:10]itu tidak berpengaruh padanya")}
    elseif command == "INSULT" then
        BattleDialog{("lu menghinanya, [w:10]lu tolol ya?[w:5] dia jadi marah!")}
    end
end

function OnDeath()
    hp = 1
    Audio.Pause()
    currentdialogue = {"[func:ApiMenjalar,stop][func:EndAnim,stop][effect:none][noskip][func:DeathAnim,closedeath]" .. "s-[w:8]sialan...",
                        "[effect:none][noskip][func:DeathAnim,opendeath]" .. "sepertinya, [w:10]kau berhasil mengalahkanku...",
                        "[effect:none][noskip][func:DeathAnim,closedeath]" .. "kau tau, [w:10][func:DeathAnim,right]sekarang sans sudah mempersiapkan dirinya untuk bertarung melawanmu",
                        "[effect:none][noskip][func:DeathAnim,opendeath]" .. "aku meminta kepadanya untuk bisa bertahan melawanmu meskipun dia tidur",
                        "[effect:none][noskip][func:DeathAnim,rightdeath]" .. "dan, [w:10]dan aku, [w:10]akan memperbarui versiku",
                        "[effect:none][noskip][func:DeathAnim,angrydeath]" .. "[waitall:4]dan aku akan membalaskan dendamku",
                        "[func:DeathAnim,stop][effect:none][noskip][func:SetSprite,norman/death/angry][func:Kill][next]"
                    }
end

function DeathAnim(nomAnim)
    SetGlobal("death", nomAnim)
end

function EndAnim(nomAnim)
    SetGlobal("end", nomAnim)
end

function SetAnim(nomAnim)
    SetGlobal("sethead", nomAnim)
end

function IntroMusic()
    Audio.LoadFile("mus_intro")
    Audio.Play()
end

function BattleMusic()
    Audio.LoadFile("mus_core_remix")
    Audio.Play()
end

function MusStop()
    Audio.Pause()
end