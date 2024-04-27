local uis = game:GetService("UserInputService")

uis.InputBegan:Connect(function(input)
	if (uis:GetFocusedTextBox()) then
		return;
	end
	if input.KeyCode == Enum.KeyCode.Space then
		if 	game.Players.LocalPlayer.PlayerGui.Game.Errors.E1.Visible == true then
			--warn("CANNOT USE!!!!!!")
		else
			script.ES:Play()
			game.Players.LocalPlayer.PlayerGui.Game.Errors.E1.Visible = true
			game.Players.LocalPlayer.PlayerGui.Game.Errors.E1.Text = "You can't jump to climb!!"
			task.wait(1.5)
			script.ES:Play()
			game.Players.LocalPlayer.PlayerGui.Game.Errors.E1.Text = "Use the Grappel to climb."
			task.wait(1.5)
			game.Players.LocalPlayer.PlayerGui.Game.Errors.E1.Visible = false
			script.ES:Play()
		end
	end	

end)

local player = game.Players.LocalPlayer

while true do
	wait()
	if player.PlayerGui:WaitForChild("Game").Errors.E1.Visible == true then
	else
		--warn("CANNOT USE!!!")
	end
		if 	player.data:WaitForChild("hasjoined").Value == false then
			player.PlayerGui.ES:Play()
			player.PlayerGui:WaitForChild("Game").Errors.E1.Text = "..."
			player.PlayerGui:WaitForChild("Game").Errors.E1.Visible = true
			task.wait(0.9)
			player.PlayerGui.ES:Play()
			player.PlayerGui:WaitForChild("Game").Errors.E1.Text = "Oh hey, looks like your new!"
			task.wait(4.6)
			player.PlayerGui.ES:Play()
			player.PlayerGui:WaitForChild("Game").Errors.E1.Text = "First off, you can't jump in this game, so you'll have to use your grappling hook."
		task.wait(6.3)
			player.PlayerGui.ES:Play()
		player.PlayerGui:WaitForChild("Game").Errors.E1.Text = "Look at your hotbar, you have a lantern and a grappel, the latern is mainly used in dark areas, theres not many but you know, the grappel speaks for it's self."
	--	player.PlayerGui:WaitForChild("Game").Errors.Guide.Image = "rbxassetid://16849895817"
		player.PlayerGui:WaitForChild("Game").Errors.Guide.Visible = true
		task.wait(6.2)
		player.PlayerGui:WaitForChild("Game").Errors.Guide.Visible = false
		player.PlayerGui.ES:Play()
		player.PlayerGui:WaitForChild("Game").Errors.E1.Text = "You can click anywhere to grappel on to anything, make sure it's not too far away though.."
		task.wait(6.3)
			player.PlayerGui.ES:Play()
		player.PlayerGui:WaitForChild("Game").Errors.E1.Text = "The NPC's in the little houses are your guides, you'll find them along your travel once in a while."
		player.PlayerGui:WaitForChild("Game").Errors.Guide.Visible = true
		player.PlayerGui:WaitForChild("Game").Errors.Guide.Image = "rbxassetid://16849880557"
		task.wait(6.2)
		player.PlayerGui:WaitForChild("Game").Errors.Guide.Visible = false
		player.PlayerGui.ES:Play()
		player.PlayerGui:WaitForChild("Game").Errors.Guide.Visible = true
		player.PlayerGui:WaitForChild("Game").Errors.E1.Text = "And that thing at the top that has changing numbers when you move around? That's how many meters up you are."
		player.PlayerGui:WaitForChild("Game").Errors.Guide.Image = "rbxassetid://16849914346"
		task.wait(6.2)
		player.PlayerGui:WaitForChild("Game").Errors.Guide.Visible = false
		player.PlayerGui.ES:Play()
		player.PlayerGui:WaitForChild("Game").Errors.E1.Text = "Oh and almost forgot, at some tall mountains you can save your position, never worry about leaving and starting over, you can also get grappling hook skins by progressing into the mountains!"
		task.wait(7.2)
		player.PlayerGui.ES:Play()
		player.PlayerGui:WaitForChild("Game").Errors.E1.Text = "Well, good luck traveler!"
		task.wait(2.5)
		
		local Event = game.ReplicatedStorage.NotificationCards.Event;
		local R = Random.new(os.clock() * os.time())

		function NewNotification (Data)
			Event:Fire("Notify", Data)
		end

		Event:Fire("Notify", {
			Name = "Info";
			Title = "You've recieved a badge!";
			Body = "You have been awarded the badge 'Newcomer'!";
			Sound = "Ping";
			Color = Color3.fromRGB(77, 84, 177)
		});


		game.ReplicatedStorage.Joined:FireServer()
		player.PlayerGui:WaitForChild("Game").Errors.E1.Visible = false
		task.wait(1)
	end
end
