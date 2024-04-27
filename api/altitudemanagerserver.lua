local Text = script.Parent
wait(1)
Player = script.Parent.Parent.Parent.Parent.Parent
local Char = Player.Character
game:GetService("RunService").Stepped:Connect(function()
	Text.Text = math.ceil(Char.HumanoidRootPart.Position.Y)
	Player.PlayerGui.altitude.Value = math.ceil(Char.HumanoidRootPart.Position.Y)
	Player.data.Altitude.Value = Player.PlayerGui.altitude.Value
end)

while true do
	wait()
	if Player.data.Altitude.Value >= 200 then
		local badgeID = 1288619632050032
		local badgeService = game:GetService("BadgeService")

		badgeService:AwardBadge(Player.UserId, badgeID)
	end
	
	if Player.data.Altitude.Value >= 700 then
		local badgeID = 3002688592070759
		local badgeService = game:GetService("BadgeService")

		badgeService:AwardBadge(Player.UserId, badgeID)
	end
end
