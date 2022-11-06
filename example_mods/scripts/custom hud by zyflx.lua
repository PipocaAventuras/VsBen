--made by zyflx

local Nps = 0
local NoteHit = false;
function onStepHit()
    if NoteHit == true then
        Nps = Nps - 2 * 4 -- math is funny
    end    
end
local Hudtype = 'Custom'
--Skin list:
--Custom(default)

function onCreate()
	if Hudtype == 'osu!' then
	setPropertyFromClass('ClientPrefs','middleScroll', true)
end
end
function onCreatePost()
	if Hudtype == 'Custom' then
	setProperty('scoreTxt.visible', false)
   	setProperty('timeBarBG.visible', true)
    	setProperty('timeBar.visible', true)
	setProperty('timeTxt.visible', true)

	makeLuaText('score','Score: 0',0,10,620)
	setTextFont('score','funkin.ttf')
	setTextSize('score', 21)
	addLuaText('score')

	makeLuaText('miss','Combo Breaks: 0',0,10,640)
	setTextFont('miss','funkin.ttf')
	setTextSize('miss', 21)
	addLuaText('miss')

	makeLuaText('acc','Accuracy: 0%',0,10,660)
	setTextFont('acc','funkin.ttf')
	setTextSize('acc', 21)
	addLuaText('acc')

	makeLuaText('rating','Rating: N/A',0,10,680)
	setTextFont('rating','funkin.ttf')
	setTextSize('rating', 21)
	addLuaText('rating')

	makeLuaText('combo','Combo: ',0,10,320)
	setTextFont('combo','funkin.ttf')
	setTextSize('combo', 21)
	addLuaText('combo')

	makeLuaText('sick','Sicks!:',0,10,340)
	setTextFont('sick','funkin.ttf')
	setTextSize('sick', 21)
	addLuaText('sick')

	makeLuaText('good','Goods!:',0,10, 360)
	setTextFont('good','funkin.ttf')
	setTextSize('good',21)
	addLuaText('good')

	makeLuaText('bad','Bads:',0,10, 380)
	setTextFont('bad','funkin.ttf')
	setTextSize('bad',21)
	addLuaText('bad')

	makeLuaText('shit','Shits:',0,10, 400)
	setTextFont('shit','funkin.ttf')
	setTextSize('shit',21)
	addLuaText('shit')

	makeLuaText('song','',0,10,690)
	setTextFont('song','funkin.ttf')
	setTextSize('song', 21)
	addLuaText('song')
	setTextString('song',songName..' - '..string.upper(difficultyName))

	makeLuaText('ver','',0,1100,690)
	setTextFont('ver','funkin.ttf')
	setTextSize('ver', 21)
	addLuaText('ver')
	setTextFont('botplayTxt','funkin.ttf')

	if not downscroll then
	setProperty('song.y', 10)
	setProperty('ver.y', 10)
	setProperty('rating.y', 680)
	setProperty('acc.y', 660)
	setProperty('miss.y', 640)
	setProperty('score.y', 620)
end
end
end
function onUpdate(elasped)
	if Hudtype == 'KadeEngine' then
iconOffset = 26
healthBarX = getProperty('healthBar.x')
healthBarW = getProperty('healthBar.width')
healthBarP = getProperty('healthBar.percent')

setGraphicSize('iconP1',math.lerp(150,getProperty('iconP1.width'), 0.50))
setProperty('iconP1.x', healthBarX + (healthBarW * (math.remapToRange(healthBarP, 0, 100, 100, 0) * 0.01) - iconOffset));

setGraphicSize('iconP2',math.lerp(150,getProperty('iconP1.width'), 0.50))
setProperty('iconP2.x', healthBarX + (healthBarW * (math.remapToRange(healthBarP, 0, 100, 100, 0) * 0.01) - iconOffset));

updateHitbox('iconP1')
updateHitbox('iconP2')
end

	setTextString('4miss','Miss x'..misses)

	if Hudtype == 'HealthEngine' then
		for i = 0,3 do
			setPropertyFromGroup('opponentStrums',i,'alpha',0.75)
			setPropertyFromGroup('playerStrums',i,'alpha',0.75)
		end
	end

	if Hudtype == 'DikeEngine' then
	local diff = ' - '..difficultyName
	setPropertyFromClass('lime.app.Application', 'current.window.title', 'Friday Night Funkin Psych Engine '..getProperty('curSong')..diff)
end

	setTextString('osumiss','Miss x'..misses)

	if Hudtype == 'osu!' then
	for i = 0,3 do
	setPropertyFromGroup('opponentStrums',i,'alpha',0)
end
end

	if Nps < 0 then
        Nps = 0
        NoteHit = false;
end   

	setTextString('combo','Combo: '..getProperty('combo'))

	setTextString('sick','Sicks!: ' .. getProperty('sicks'))
	setTextString('good','Goods!: ' ..getProperty('goods'))
	setTextString('bad','Bads: ' .. getProperty('bads'))
	setTextString('shit','Shits: ' .. getProperty('shits'))

	setTextString('nps','NPS: '..Nps)
end
function onRecalculateRating()
	if Hudtype == 'DikeEngine' then
	if ratingFC == 'SFC' then
	ratingFC = 'FC'
	elseif ratingFC == 'GFC' then
	ratingFC = 'FC'
	elseif ratingFC == 'Clear' and misses >= 20 then
	ratingFC = 'F'
	elseif ratingFC == 'SDCB' then
	ratingFC = 'NFC'
	elseif ratingFC == 'SDCB' and misses == 5 then
	ratingFC = 'NB'
	elseif ratingFC == 'Clear' then
	ratingFC = 'PGBNTB'
end
end

	if Hudtype == 'ModdingPlus' then
	if ratingName == 'Perfect!!' then
	ratingName = 'AAA'
	ratingFC = 'MFC'
	elseif ratingName == 'Sick!' then
	ratingName = 'AA'
	elseif ratingName == 'Great' then
	ratingName = 'B'
	elseif ratingName == 'Good' then
	ratingName = 'C'
	elseif ratingName == 'Meh' then
	ratingName = 'D'
	elseif ratingName == 'Bruh' then
	ratingName = 'F'
	elseif ratingName == 'Bad' then
	ratingName = 'F'
	elseif ratingName == 'Shit' then
	ratingName = 'F'
	elseif ratingName == 'You Suck!' then
	ratingName = 'FAIL'
end
end

	if Hudtype == 'ForeverEngine' then
	if ratingName == 'Perfect!!' then
	ratingName = 'S+'
	elseif ratingName == 'Sick!' then
	ratingName = 'S'
	elseif ratingName == 'Great' then
	ratingName = 'B'
	elseif ratingName == 'Good' then
	ratingName = 'C'
	elseif ratingName == 'Nice' then
	ratingName = 'D'
	elseif ratingName == 'Meh' then
	ratingName = 'D'
	elseif ratingName == 'Bruh' then
	ratingName = 'F'
	elseif ratingName == 'Bad' then
	ratingName = 'F'
	elseif ratingName == 'Shit' then
	ratingName = 'E'
	elseif ratingName == 'You Suck!' then
	ratingName = 'E'
end
end

	if Hudtype == 'KadeEngine' then
	if ratingName == 'Perfect!!' then
	ratingName = 'AAA'
	ratingFC = 'MFC'
	elseif ratingName == 'Sick!' then
	ratingName = 'AA'
	elseif ratingName == 'Great' then
	ratingName = 'B'
	elseif ratingName == 'Good' then
	ratingName = 'C'
	elseif ratingName == 'Meh' then
	ratingName = 'D'
	elseif ratingName == 'Bruh' then
	ratingName = 'F'
	elseif ratingName == 'Bad' then
	ratingName = 'F'
	elseif ratingName == 'Shit' then
	ratingName = 'F'
	elseif ratingName == 'You Suck!' then
	ratingName = 'FAIL'
end
end

	if Hudtype == 'VixtinEngine' then
	if ratingName =='Perfect!!' then
	ratingFC = 'MFC'
	theRatingAlt = 'AAA'
	elseif ratingName == 'Sick!' then
	theRatingAlt = 'AA'
	elseif ratingName == 'Great' then
	theRatingAlt = 'B'
	elseif ratingName == 'Good' then
	theRatingAlt = 'C'
	elseif ratingName == 'Nice' then
	theRatingAlt = 'Nice'
	elseif ratingName == 'Meh' then
	theRatingAlt = 'D'
	elseif ratingName == 'Bruh' then
	theRatingAlt = 'F'
	elseif ratingName == 'Bad' then
	theRatingAlt = 'F'
	elseif ratingName == 'Shit' then
	theRatingAlt = 'F'
	elseif ratingName == 'You Suck!' then
	theRatingAlt = 'FAIL'
	end
end
	setTextString('healthscore','Score: '..score..' | Misses: '..misses)
	setTextString('dikescore','Score:'..score..' | Misses:'..misses..' | '..ratingFC)
	setTextString('osucombo',''..getProperty('combo'))
	setTextString('osuacc',''..round(rating * 100, 2)..'%')
	setTextString('osuscore',''..score)
	setTextString('modplus','Score: '..score..' | Combo Breaks: '..misses..' | Accuracy: ' .. round((getProperty('ratingPercent') * 100), 2)..' % (' .. ratingFC .. ') '..ratingName)
	setTextString('fnrscore','Score: '..score)
	setTextString('info','Misses: '..misses..' | Accuracy: '..round(rating * 100, 2) ..'% | Combo: '..getProperty('combo'))
	setTextString('fps','Score: '..score..' | Misses: '..misses..' | Accuracy: '..round(rating * 100, 2)..'%')
	setTextString('micdupacc','Accuracy: '..round(rating * 100, 2)..'%')
	setTextString('micdupmiss','Misses: '..misses)
	setTextString('micdupscore','Score: '..score)
	setTextString('score','Score: '..score)
	setTextString('miss','Combo Breaks: '..misses)
	setTextString('acc','Accuracy: '..round(rating * 100, 2)..'%')
	setTextString('rating','Rating: (' .. ratingFC .. ') '..ratingName)
	setTextString('kadescore','Score: '..score..' | Combo Breaks: '..misses..' | Accuracy: '..round(rating * 100,2)..' % | ('..ratingFC..') '..ratingName)
	setTextString('scoreforever','Score: '..score..' - Accuracy: '..round(rating * 100, 2)..'% ['..ratingFC..'] - Combo Breaks: '..misses..' - Rank: '..ratingName)
	setTextString('newscoretxt','Score: '..score..' | Combo Breaks: '..misses..' | Accuracy: ' .. round((getProperty('ratingPercent') * 100), 2)..' % (' .. ratingFC .. ') '..theRatingAlt)
	setTextString('vanillascore','Score: '..score)
end
function onBeatHit()
	if curBeat % 1 == 0 then
	scaleObject('iconP1', 1.15, 1.15)
	scaleObject('iconP2', 1.15, 1.15)
	doTweenX('bop','iconP1',1.3,0.1,'quadInOut')
	doTweenX('bop','iconP2',1.3,0.1,'quadInOut')
end

	if Hudtype == 'ForeverEngine' then
	if curBeat % 4 == 0 then
	doTweenZoom('zoom','camHUD',1,0.2,'quadOut')
end
end

	if Hudtype == 'osu!' then
	setProperty('camZooming', false)
end
end
function noteMiss(id, direction, noteType, isSustainNote)
	if Hudtype == 'osu!' then
	makeLuaText('osumiss','',0,570,140)
	setTextSize('osumiss', 30)
	addLuaText('osumiss')
	runTimer('miss', 0.2, 0)
function onTimerCompleted(tag)
	if tag == 'miss' then
	doTweenAlpha('fade','osumiss',0,0.2,'linear')
end
end
end
end
function onDestroy()
if Hudtype == 'DikeEngine' then
setPropertyFromClass('lime.app.Application', 'current.window.title', 'In The Menus')
end
end
function onSongStart()
	if Hudtype == 'osu!' then
	doTweenAlpha('tween','bgdim',1,0.3,'linear')
end
end
function round(x, n) --https://stackoverflow.com/questions/18313171/lua-rounding-numbers-and-then-truncate
    n = math.pow(10, n or 0)
    x = x * n
    if x >= 0 then x = math.floor(x + 0.5) else x = math.ceil(x - 0.5) end
    return x / n
end
function goodNoteHit(id, direction, noteType, isSustainNote)
    if not isSustainNote then
        Nps = Nps + 1
        NoteHit = false;
    end

    ezTimer('drain', 1, function()
        NoteHit = true;
    end)  
end

timers = {}
function ezTimer(tag, timer, callback) -- Better
    table.insert(timers,{tag, callback})
    runTimer(tag, timer)
end

function onTimerCompleted(tag)
    for k,v in pairs(timers) do
        if v[1] == tag then
            v[2]()
        end
    end
end
function math.lerp(a,b,t)
 return(b-a) * t + a;
end
function math.remapToRange(value,start1,stop1,start2,stop2)
 return start2 + (stop2 - start2) * ((value - start1)/(stop1 - start1))
end