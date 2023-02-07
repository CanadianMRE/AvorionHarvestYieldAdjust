package.path = package.path .. ";data/scripts/lib/ConfigLib/?.lua"
local ConfigLib = include("ConfigLib")
local yieldMultiplier = ConfigLib("modID").get("commandOreYield") -- initialization

local originalCalculation = MineCommand.calculateGatheredResources
function MineCommand:calculateGatheredResources(properties)
	local refined, raw = originalCalculation(this, properties)
	return refined * yieldMultiplier, raw * yieldMultiplier
end