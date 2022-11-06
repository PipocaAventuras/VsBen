function onCreate()
	makeLuaSprite('comboBurst','combo',1275,300)
	setObjectCamera('comboBurst','other')
	scaleObject('comboBurst', 0.7, 0.7)
	setProperty('comboBurst.alpha', 0)
	addLuaSprite('comboBurst', true)
end

function goodNoteHit(id, direction, noteType, sus)
if getProperty('combo') % 100 == 0 then
doTweenX('Xtween','comboBurst',900, 1,'sineOut')
doTweenAlpha('Alphatween','comboBurst', 1, 1,'linear')
runTimer('burst', 2, 0)
end
end
function onTimerCompleted(tag)
	if tag == 'burst' then
	doTweenX('Xtween','comboBurst',1275, 1,'sineOut')
	doTweenAlpha('Alphatween','comboBurst', 0, 0.5,'linear')
end
end