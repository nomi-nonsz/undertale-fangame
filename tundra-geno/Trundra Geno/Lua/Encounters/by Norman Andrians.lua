-- jangan ngecheat njirr!
music = "mus_eternal_dream"
encountertext = "Cybot Tundra akan menghancurkanmu!"
nextwaves = {"attack_touhou_6"}
wavetimer = 15.0
arenasize = {155, 130}
autolinebreak = true
flee = false
deathtext = {"TRY HARDER,[w:20] IN NEXT LIFE"}

enemies = {
"tundra"
}

enemypositions = {
{8.8, 0}
}

possible_attacks = {
    "attack_touhou_1",
    "attack_touhou_2",
    "attack_touhou_3",
    "attack_touhou_4",
    "attack_touhou_5",
    "attack_touhou_6",
    "attack_touhou_7",
    "attack_touhou_8",
    "attack_touhou_9",
    "attack_touhou_10"
}

function EncounterStarting()
	Player.name = "Chara"
	Player.lv = 20
    Player.hp = 99
    Player.atk = 999999
    Audio.Pause()
    enemies[1]["currentdialogue"] = {"[effect:none]...",
                                    "[effect:none]aku tidak mengerti.",
                                    "[effect:none]kenapa kau membunuh orang?.",
                                    "[effect:none]...",
                                    "[effect:none]kenapa kau membunuh monster?",
                                    "[effect:none]coba kau bayangkan",
                                    "[effect:none]jika kau kehilangan orang,",
                                    "[effect:none]kehilangan orang yang kau cintai",
                                    "[effect:none]...",
                                    "[effect:none]manusia",
                                    "[effect:none]aku...",
                                    "[effect:none]aku adalah boss terakhir mu",
                                    "[effect:none]dan aku akan...",
                                    "[noskip][font:monster][waitall:5][effect:none][novoice]MEMBUATMU MENYESAL!",
                                    "[noskip][func:LaunchMusic][func:State, ACTIONSELECT][next]"}
    State("ENEMYDIALOGUE")
    Inventory.AddCustomItems({  "pai",
                                "pai",
                                "Indomie",
                                "Indomie",
                                "Burger",
                                "Burger",
                                "Kentang",
                                "Kentang",
    }, {0, 0, 0, 0, 0, 0, 0, 0})
    Inventory.SetInventory({"pai",
                            "pai",
                            "Indomie",
                            "Indomie",
                            "Burger",
                            "Burger",
                            "Kentang",
                            "Kentang"
    })
    require "Animations/anim-tundra"
end

function Update()
	AnimateTundra()
end

function EnemyDialogueStarting()
    -- gk di isi :v
end

function EnemyDialogueEnding()
    nextwaves = { possible_attacks[math.random(#possible_attacks)] }
end

function DefenseEnding()
    encountertext = RandomEncounterText()
end

function HandleSpare()
    State("ENEMYDIALOGUE")
end

function HandleItem(ItemID)
    if (ItemID == "PAI") then
        Player.Heal(99)
        BattleDialog({"Kau memakan Pai.[w:10] HP bertambah penuh"})
    elseif (ItemID == "INDOMIE") then
        Player.Heal(40)
        BattleDialog({"Kau memakan Indomie.[w:10] HP bertambah 40 HP!"})
    elseif (ItemID == "BURGER") then
        Player.Heal(50)
        BattleDialog({"Kau memakan Burger.[w:10] HP bertambah 50 HP!"})
    elseif (ItemID == "KENTANG") then
        Player.Heal(30)
        BattleDialog({"Kau memakan Kentang goreng.[w:10] HP bertambah 30 HP!"})
    end
end