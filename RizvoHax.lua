--// library
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/UI-Libraries/main/Vynixius/Source.lua"))()

--// main code junk begins here
local Window = Library:AddWindow({
	title = {"RizvoHax", "[DOORS] - (V1)"},
	theme = {
		Accent = Color3.fromRGB(110, 40, 189)
	},
	key = Enum.KeyCode.K ,
	default = true
})

Library:Notify({title = "Credits", text = "Made by Rizvo. (@rizvo._.)"})

--// functions

function CreateMessage(text, duration)
	local Msg = Instance.new("Message", workspace)
	Msg.Text = text
	game.Debris:AddItem(Msg, duration)
end

--// main

local Tab = Window:AddTab("Entities", {default = false})
local Tab1 = Window:AddTab("Fun", {default = false})
local Tab2 = Window:AddTab("Main", {default = true})
local Tab3 = Window:AddTab("Misc.", {default = false})

local Section = Tab:AddSection("Game", {default = true})
local Section1 = Tab2:AddSection("HOTEL-", {default = false})
local Section5 = Tab2:AddSection("Player", {default = true})
local Section2 = Tab1:AddSection("Items", {default = true})
local Section3 = Tab1:AddSection("Player", {default = false})
local Section4 = Tab2:AddSection("SUPER HARD MODE 2023", {default = false})
local Section6 = Tab2:AddSection("Visual", {default = false})
local Section7 = Tab3:AddSection("Game", {default = true})

local Entities_Button1 = Section:AddButton("Kill A-90 (Disables A-90 permanently.)", function()
	game.ReplicatedStorage.RemotesFolder.A90:Destroy()
end)
local Entities_Button2 = Section:AddButton("Kill Screech (Disables Screech permanently.)", function()
	if game.ReplicatedStorage.RemotesFolder and game.ReplicatedStorage.RemotesFolder.Screech then
      game.ReplicatedStorage.RemotesFolder.Screech:Destroy()
   else
      game.ReplicatedStorage.Bricks.Screech:Destroy()
   end
end)
local Entities_Button3 = Section:AddButton("Kill Dread (Disables Dread permanently.)", function()
	game.ReplicatedStorage.RemotesFolder.Dread:Destroy()
end)

local BeforePlus_Button = Section1:AddButton("Revive (ONLY WORKS ONCE)", function()
	game.ReplicatedStorage.Bricks.Revive:FireServer()
end)

local MiscGame_Button = Section7:AddButton("Play Again (SINGLEPLAYER)", function()
	if game.ReplicatedStorage.RemotesFolder and game.ReplicatedStorage.RemotesFolder.PlayAgain then
      game.ReplicatedStorage.RemotesFolder.PlayAgain:FireServer()
   else
      game.ReplicatedStorage.Bricks.PlayAgain:FireServer()
   end
end)

local MiscGame_Button1 = Section7:AddButton("Get Glitch (MIGHT TAKE A BIT + UNSTABLE)", function()
	local LoopPos = game:GetService("RunService").RenderStepped:Connect(function()
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(Vector3.new(0,-10,0))
	end)
	task.wait(5)
	LoopPos:Disconnect()
end)

local MiscGame_Button2 = Section7:AddButton("Go to Lobby", function()
	if game.ReplicatedStorage.RemotesFolder and game.ReplicatedStorage.RemotesFolder.Lobby then
      game.ReplicatedStorage.RemotesFolder.Lobby:FireServer()
   else
      game.ReplicatedStorage.Bricks.Lobby:FireServer()
   end
end)

local FullbrightActive = false
local MainVisual_Button = Section6:AddButton("Fullbright", function()
	if not FullbrightActive then
		FullbrightActive = true
		Library:Notify({title = "Fullbright", text = "Enabled."})
		local LoopFB = game:GetService("RunService").RenderStepped:Connect(function()
			if FullbrightActive then
				game.Lighting.Ambient = Color3.fromRGB(255, 255, 255)
			end
		end)
	else
		FullbrightActive = false
		Library:Notify({title = "Fullbright", text = "Disabled."})
		game.Lighting.Ambient = Color3.fromRGB(67, 41, 0)
	end
end)

local DoorEspGui_Folder = Instance.new("Folder", workspace)
DoorEspGui_Folder.Name = "DoorESPStuff"

function DoorEsp_CreateGui()
	local BillboardGui = Instance.new("BillboardGui", DoorEspGui_Folder)
	BillboardGui.AlwaysOnTop = true
	local TextLabel = Instance.new("TextLabel", BillboardGui)
	TextLabel.BackgroundTransparency = 1
	TextLabel.TextScaled = true
	TextLabel.TextColor3 = Color3.fromRGB(4, 255, 0)
	TextLabel.Font = Enum.Font.Oswald
	TextLabel.Text = "Door"
	return BillboardGui
end


local Fools2023_Button = Section4:AddButton("Kill Greed (Disables Greed permanently.)", function()
	if game.ReplicatedStorage.RemotesFolder and game.ReplicatedStorage.RemotesFolder.Greed then
      game.ReplicatedStorage.RemotesFolder.Greed:Destroy()
   else
      game.ReplicatedStorage.Bricks.Greed:Destroy()
   end
end)

local EntityNotifierActive = false
local Entities_Button4 = Section:AddButton("Entity Notifier", function()
	if not EntityNotifierActive then
		EntityNotifierActive = true
		Library:Notify({title = "Entity Notifier", text = "Enabled. Entity notifications will show up like this"})
		
		workspace.ChildAdded:Connect(function(child: Instance)
			if child.Name == "RushMoving" and EntityNotifierActive then
				Library:Notify({title = "Entity Notifier (ENTITY)", text = "Rush has spawned! Find a hiding spot."})
			elseif child.Name == "AmbushMoving" and EntityNotifierActive then
				Library:Notify({title = "Entity Notifier (ENTITY)", text = "Ambush has spawned! Find a hiding spot."})
         elseif child.Name == "A60" and EntityNotifierActive then
				Library:Notify({title = "Entity Notifier (ENTITY)", text = "A-60 has spawned! Find a hiding spot."})
         elseif child.Name == "A120" and EntityNotifierActive then
				Library:Notify({title = "Entity Notifier (ENTITY)", text = "A-120 has spawned! Find a hiding spot."})
		elseif child.Name == "BackdoorRush" and EntityNotifierActive then
				Library:Notify({title = "Entity Notifier (ENTITY)", text = "Blitz has spawned! Find a hiding spot."})
			end
		end)
		
	else
		EntityNotifierActive = false
		Library:Notify({title = "Entity Notifier", text = "Disabled."})
	end
end)

local PlayerFun_Button = Section3:AddButton("Commit Suicide (literally)", function()
	game.Players.LocalPlayer.Character.Humanoid.Health = 0
end)

local PlayerFun_Button1 = Section3:AddButton("Give 100K Fake Gold", function()
	game.Players.LocalPlayer.Gold.Value += 100000
end)

local PlayerFun_Button2 = Section3:AddButton("Pass Out [DOESNT KILL]", function()
	game.Players.LocalPlayer.Character:SetAttribute("Stunned", true)
   game.Players.LocalPlayer.Character:SetAttribute("Oxygen", 1)
   task.wait(3)
   game.Players.LocalPlayer.Character:SetAttribute("Stunned", false)
   game.Players.LocalPlayer.Character:SetAttribute("Oxygen", 100)
end)

local PlayerFun_Button3 = Section3:AddButton("The Rizvo Ritual", function()
	game.TweenService:Create(game.Players.LocalPlayer.Character.HumanoidRootPart, TweenInfo.new(3, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out), {
    CFrame = CFrame.new(game.Players.LocalPlayer.Character.HumanoidRootPart.Position + Vector3.new(0, 3, 0))
}):Play()
task.wait(3)
game.TweenService:Create(game.Players.LocalPlayer.Character.HumanoidRootPart, TweenInfo.new(2, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out), {
    CFrame = CFrame.new(game.Players.LocalPlayer.Character.HumanoidRootPart.Position + Vector3.new(0, -10, 0))
}):Play()
end)


local PlayerMain_Button = Section5:AddSlider("Walk-Speed", 1, 23, 15, {toggleable = true, default = false, flag = "CustomWS_Flag", fireontoggle = true, fireondrag = true, rounded = true}, function(val, bool)
	game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = val
	game.Players.LocalPlayer.Character:GetAttributeChangedSignal("Crouching"):Connect(function()
		if bool then
			game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = val
		end
	end)
end)

local PlayerMain_Button1 = Section5:AddButton("Instant Proximity Prompts", function()
	game.ProximityPromptService.PromptShown:Connect(function(prompt: ProximityPrompt)
	   prompt.HoldDuration = 0
   end)
end)

local InfiniteMPushActive = false
local PlayerMain_Button2 = Section5:AddButton("Infinite Minecart Push", function()
	if not InfiniteMPushActive then
		InfiniteMPushActive = true
		game.ProximityPromptService.PromptTriggered:Connect(function(prompt)
		if prompt.Name == "PushPrompt" or prompt.ActionText == "Push" and InfiniteMPushActive then
			prompt.MaxActivationDistance = 30
			prompt.Enabled = true
			task.wait(0.1)
			prompt.Enabled = true
			task.wait(0.1)
			prompt.Enabled = true
			task.wait(0.1)
			prompt.Enabled = true
			end
		end)
	else
		InfiniteMPushActive = false
	end
end)

local Items_Button = Section2:AddButton("Give M249 (CLIENTSIDE + UNSTABLE)", function()
	
    local M249Item = game:GetObjects("rbxassetid://112932652285937")[1]

local Player = game.Players.LocalPlayer
local Backpack = Player.Backpack

M249Item.Parent = Player.Backpack

M249Item.Activated:Connect(function()
    local Mouse = Player:GetMouse()
    local MouseTarget = Mouse.Target
    
    M249Item.Handle.EffectsHolder.FireSound:Play()
    
    M249Item.Handle.EffectsHolder.FX.Enabled = true
    M249Item.Handle.EffectsHolder.FlashFX.Enabled = true
    
    MouseTarget:Destroy()
    
    wait(0.09)
    
    M249Item.Handle.EffectsHolder.FX.Enabled = false
    M249Item.Handle.EffectsHolder.FlashFX.Enabled = false
   end)

end)
