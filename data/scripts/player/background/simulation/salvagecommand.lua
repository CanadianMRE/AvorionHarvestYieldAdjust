package.path = package.path .. ";data/scripts/lib/ConfigLib/?.lua"
local ConfigLib = include("ConfigLib")
local yieldMultiplier = ConfigLib("modID").get("commandSalvageYield") -- initialization

local originalCalculation = MineCommand.calculateGatheredResources
function MineCommand:calculateGatheredResources(volume, properties, material)
	local refined, raw, credits = originalCalculation(this, volume, properties, material)
	return refined * yieldMultiplier, raw * yieldMultiplier, credits * yieldMultiplier
end