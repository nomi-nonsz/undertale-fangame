comments = {"mungkin kita tidak boleh meremehkannya", "Sepertinya serangannya acak dan sulit dihindar", "hati-hati! dia sangat kuat!", "sepertinya dia sangat kuat"}
commands = {"CEK", "Hentikan", "Main Mata", "Meminta Maaf", "Ingat"}
randomdialogue = {"tak akan aku maafkan", "YRT attack!", "rasakan ini", "lawan aku kalo bisa lemah!", "kau tidak akan bisa bunuh aku"}

sprite = "empty"
name = "Tundra"
hp = 50000000
atk = 999
def = 999
check = ""
dialogbubble = "rightwideminus"
canspare = false
cancheck = false
xp = 2000
gold = 825

function LaunchMusic()
    Audio.Unpause()
end

function HandleAttack(attackstatus)
    if attackstatus == -1 then
        currentdialogue = {"[effect:none]kau meleset", "[effect:none]sayang sekali"}
    else
		if hp > 20 then
			randomdialogue = {
							"[effect:none]kau tidak punya hati!",
							"[effect:none]kan ku rebut jiwamu!",
							"[effect:none]tidak akan ku biarkan!",
							"[effect:none]kan ku habisi kau!",
							"[effect:none]hanya itu saja?!",
							"[effect:none]menyerah saja!",
							"[effect:none]kau tidak akan bisa menang",
							"[effect:none]kau bunuh semua monster",
							"[effect:none]kau bunuh temanku"
						}
        end
    end
end

function HandleCustomCommand(command)
	SetGlobal("wavetype", command)
	if command == "CEK" then
		BattleDialog({"Tundra 999999 ATK 999999 DEF\n[w:10]dia seorang Cybot yang akan membalas perbuatanmu!"})
	elseif command == "HENTIKAN" then
		BattleDialog({
		"kau meminta ini segera dihentikan. itu tidak berpengaruh kepadanya",
		"dia selalu melihat kau membunuh orang, dan dia akan balas dendam"
		})
        currentdialogue = {"[effect:none]...", "[effect:none]maaf manusia", "[effect:none]kau adalah PEMBUNUH", "[effect:none]kau benar benar tidak punya hati", "[effect:none]dan aku tidak akan", "[noskip][font:monster][effect:shake]memafkanmu"}
    elseif command == "MAIN MATA"then
		BattleDialog({"kau bermain mata dengan dia", "sepertinya itu mempengaruhinya", "tetapi dia tetap menyerang"})
    elseif command == "MEMINTA MAAF" then
		BattleDialog({"kau meminta maaf kepadanya...", "itu tidak akan merespon apa pun"})
	elseif command == "INGAT" then
		BattleDialog({"kau ingin dia mengingatmu kembali. sepertinya dia tidak ingat", "tunggu dulu\ndia ingat sesuatu"})
		currentdialogue = {"[effect:none]oh tunggu. aku ingat sesuatu", "[effect:none]aku akan menghabisimu!"}
    end
end

function OnDeath()
	hp = -1
	Audio.Pause()
	currentdialogue = {
						"...",
						"[noskip][effect:none]dengan kekuatan sehebat ini....",
						"[noskip][effect:none]masih belum cukup?!",
						"[noskip][effect:none]heh",
						"[noskip][effect:none]heh heh heh",
						"[noskip][effect:none]Toriel, Sans, Papyrus, U-Undyne",
						"[noskip][effect:none]Alphys, Mettaton",
						"[noskip][effect:none]A-Asgore...",
						"[noskip][effect:none][waitall:3]N[w:10]-Norman...",
						"[noskip][font:monster][effect:none]" .. "[waitall:5]a-aku g-gagal...[func:FadeKill][func:Kill][next]"}
end

function FadeKill()
	if hp == -1 then
		SetGlobal("TundraDead", true)
	end
end