apijalar = CreateSprite("fire/fire")

apijalar.SetAnchor(0.0, 0)
apijalar.SetPivot(0.1, 0.52)

apijalar.alpha = 0

function AnimateFire()
    apijalar.MoveTo(1, 5*math.sin(Time.time * 3.5))
    if GetGlobal("menjalar") == "mulai" then
        apijalar.alpha = 1
    elseif GetGlobal("menjalar") == "stop" then
        apijalar.alpha = 0
    end
end