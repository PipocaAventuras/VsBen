local campointx = 0
local campointy = 0
local bfturn = false
local camMovement = 15
local velocity = 2
function onStartCountdown()
	if not allowCountdown and isStoryMode and not seenCutscene then --Block the first countdown
		startVideo('EstevamCutscene_4');
		allowCountdown = true;
		return Function_Stop;
	end
	return Function_Continue;
end

function onEndSong()
    if isStoryMode and not seenCutscene then
        startVideo('EstevamCutscene_5')
        seenCutscene = true
        return Function_Stop
    end
    return Function_Continue
end
