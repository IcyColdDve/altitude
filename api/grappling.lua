local Player = game.Players.LocalPlayer
local HumanoidRootPart = Player.Character:WaitForChild("HumanoidRootPart")
local Module =  require(game.ReplicatedStorage.Modules.Grappels:FindFirstChild("Grappel"))
local Mouse = Player:GetMouse()
local Debounce = false
local mouseDown = false

local Max_Distance = Module.MaxDistance
local WinchSpeed = Module.Speed 
local RopeVisible = Module.RopeVisible 
local RopeColor = BrickColor.new("Brown")

local function distance_between_vectors(u, v)
	local difference = u - v

	local distance = difference.Magnitude

	distance = math.floor(distance / 1 + 0.5) * 1

	return distance
end

local function Attachment(method, parent)
	if method == "Create" then 
		local Attachement = Instance.new("Attachment")
		Attachement.Parent = parent
	else 
		parent.Attachment:Destroy()
	end
end




Mouse.Button1Up:Connect(function()
	mouseDown = false
end)


Mouse.Button1Down:Connect(function()
	mouseDown = true
	if Debounce == false then 
		Debounce = true
		local HitPosition = Mouse.Hit.p
		local distance = distance_between_vectors(HitPosition, HumanoidRootPart.Position)
		if distance <= Max_Distance then
			script.Impact:Play()
			local NewPart = Instance.new("Part")
			NewPart.Anchored = true
			NewPart.Parent = game.Workspace:FindFirstChild(Player.Name):FindFirstChild("Grappel").Body.Barrel
			NewPart.Position = HitPosition
			NewPart.Transparency = 1
			Attachment("Create", NewPart)
			Attachment("Create", HumanoidRootPart)
			local Rope = Instance.new("RopeConstraint")
			Rope.Parent = NewPart
			Rope.Attachment0 = NewPart.Attachment
			Rope.Attachment1 = HumanoidRootPart.Attachment
			Rope.WinchEnabled = true
			Rope.WinchTarget = 5
			Rope.WinchForce = 1000000000
			Rope.Restitution = 0
			Rope.Color = RopeColor
			Rope.Visible = RopeVisible
			Rope.Length = distance / 2
			Rope.WinchSpeed = WinchSpeed
			while mouseDown == true  do
				wait()
			end
			Attachment("Destroy", NewPart)
			Attachment("Destroy", HumanoidRootPart)
			NewPart.RopeConstraint:Destroy()
			NewPart:Destroy()
		end
		if distance >= Max_Distance then
			if 	game.Players.LocalPlayer.PlayerGui.Game.Errors.E1.Visible == true then
				-- cannot use then
			else
				script.Parent.Script.ES:Play()
				game.Players.LocalPlayer.PlayerGui.Game.Errors.E1.Visible = true
				game.Players.LocalPlayer.PlayerGui.Game.Errors.E1.Text = "Cannot grappel that far!"
				task.wait(1.5)
				game.Players.LocalPlayer.PlayerGui.Game.Errors.E1.Visible = false
			end
		end
		Debounce = false
	end
end)
