tundrahead = CreateSprite("tundra")

tundrahead.SetPivot(-2.0, -1.9)

tundrahead.x = 0
tundrahead.setAnimation({"tundra", "tundra/1", "tundra/2"}, 0.05)

function AnimateTundra()
    if GetGlobal("TundrakDead") == true then
        tundrahead.Dust(true)
    end
    tundrahead.MoveTo(0, 15*math.cos(Time.time))
end