local f = CreateFrame("MessageFrame", "LowHPBox", UIParent)
f:SetPoint("CENTER")
f:SetSize(512, 60)
f:SetFontObject(NumberFontNormalHuge)
f:SetJustifyH("CENTER")

local last = 0
f:RegisterEvent("UNIT_HEALTH")
f:SetScript("OnEvent", function(self, event, unit)
	if unit ~= "player" then return end

	local hp = UnitHealth(unit) / UnitHealthMax(unit)
	if hp > 0.3 then return end

	local now = GetTime()
	if now - last < 10 then return end

	self:AddMessage("Low HEALTH", 1, 0, 0, 1, 3)
	last = now
end)