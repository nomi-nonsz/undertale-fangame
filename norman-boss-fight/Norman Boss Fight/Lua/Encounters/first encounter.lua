-- script encounter ini diambil dari encounter skeleton
encountertext = "bersiaplah untuk mati"
nextwaves = {"attack_3"}
wavetimer = 12.0
arenasize = {155, 130}
flee = false
autolinebreak = true

enemies = {
"norman"
}

enemypositions = {
{0, 0}
}

possible_attacks = {"attack_1", "attack_2", "attack_3",
                    "attack_4", "attack_5", "attack_6",
                    "attack_7", "attack_8", "attack_9"
                }

function EncounterStarting()
    require "Animations/fire_anim"
    require "Animations/norman_anim"

    Inventory.AddCustomItems({  "Pie", "Steak",
                                "L. Hero", "L. Hero",
                                "L. Hero", "L. Hero",
                                "L. Hero", "L. Hero"
                                },
                                {0, 0, 0, 0, 0, 0, 0, 0})
    Inventory.SetInventory({"Pie", "Steak",
                            "L. Hero", "L. Hero",
                            "L. Hero", "L. Hero",
                            "L. Hero", "L. Hero"})

    Player.name = "Chara"
    Player.lv = 19
    Player.hp = 92
    Player.atk = 1600
    Audio.Pause()
    enemies[1]["currentdialogue"] = {   "[effect:none][func:SetSprite,norman/body]...", "[effect:none][func:SetSprite,norman/body]kau kembali...",
                                        "[effect:none][func:SetSprite,norman/body][func:IntroMusic]sebelum kau melawan sans,[w:7] lawan aku terlebih dulu", "[effect:none][func:SetSprite,norman/kanan]...",
                                        "[effect:none][func:SetSprite,norman/bliking]aku sama sekali tidak mengerti", "[effect:none][func:SetSprite,norman/body]kenapa, [w:6]kenapa kau membunuh monster yang kau hadapi",
                                        "[effect:none][func:SetSprite,norman/body]apa kau tidak punya hati?", "[effect:none][func:SetSprite,norman/bliking]akan ku buat kau menyesal",
                                        "[effect:none][func:SetSprite,norman/body]dan aku akan memberikan pelajaran untukmu.", "[effect:none][func:SetSprite,norman/bliking]Toriel, [w:7]Sans, [w:7]Papyrus, [w:7]Undyne, [w:7]Alphys, [w:7]Mettaton...",
                                        "[effect:none][func:SetSprite,norman/kanan]Asgore", "[effect:none][func:SetSprite,norman/body]bagaimanapun caranya, aku akan mengalahkanmu...",
                                        "[effect:none][func:SetSprite,norman/bliking]aku akan mengorbahkan diriku demi teman-temanku", "[effect:none][func:SetSprite,norman/kanan]dan aku lupa sesuatu",
                                        "[effect:none][func:SetSprite,norman/body]sebenarnya aku bicara dengan Chara bukan Frisk", "[effect:none][func:SetSprite,norman/body]setelah aku telusuri di internet, [w:8]ternyata itu ulah Chara",
                                        "[effect:none][func:SetSprite,norman/bliking]Chara, [w:10]orang pertama yang jatuh", "[effect:none][func:SetSprite,norman/body]dan sekarang waktunya...",
                                        "[noskip][func:MusStop][func:BattleMusic][func:NormanAnima,start][func:ApiMenjalar,mulai][func:SetSprite,void][func:State, ACTIONSELECT][next]"}
    State("ENEMYDIALOGUE")
end

function Update()
    AnimateFire()
    AnimateNorman()
end

function EnemyDialogueStarting()
    -- Good location for setting monster dialogue depending on how the battle is going.
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
    if (ItemID == "PIE") then
        Player.Heal(99)
        BattleDialog({"Kamu makan Pai.[w:10]\nHP bertambah maksimal!"})
    elseif (ItemID == "STEAK") then
        Player.Heal(60)
        BattleDialog({"Kamu makan Steak,[w:10]\nHP mu memulih 60!"})
    elseif (ItemID == "L. HERO") then
        Player.Heal(40)
        BattleDialog({"Kamu makan Legendary Hero,[w:10]\nHP mu memulih 40!"})
    end
end