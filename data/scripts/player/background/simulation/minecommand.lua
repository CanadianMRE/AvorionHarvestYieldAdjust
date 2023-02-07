local multiplier = 10

local originalCalculation = MineCommand.calculateGatheredResources
function MineCommand:calculateGatheredResources(properties)
	local refined, raw = originalCalculation(this, properties)
	return refined * multiplier, raw * multiplier
end