game.ReplicatedStorage.Events.AwardJoe.OnClientEvent:Connect(function()
local Event = game.ReplicatedStorage.NotificationCards.Event;
	local R = Random.new(os.clock() * os.time())
	
	function NewNotification (Data)
		Event:Fire("Notify", Data)
	end

	Event:Fire("Notify", {
		Name = "Info";
		Title = "You've recieved a badge!";
		Body = "You have been awarded the badge 'Joe'!";
		Sound = "Ping";
		Color = Color3.fromRGB(77, 84, 177)
	});
end)
