function onUpdate()
	if keyJustPressed('space') then
		characterPlayAnim('boyfriend', 'hey', true);
		setProperty('boyfriend.specialAnim', true);
	end
end

	--Credit to Enchantment187 for the Spacebar Hey Animation Thing