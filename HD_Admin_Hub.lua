-- CURRENTLY IN BETA DEVELOPMENT!
-- I PLAN TO ALSO ADD THEIR ACTUAL FLY TO!
getgenv().Game = game
getgenv().JobID = getgenv().Game.JobId
getgenv().PlaceID = getgenv().Game.PlaceId

getgenv().Service_Wrap = function(serviceName)
    if cloneref then
        return cloneref(getgenv().Game:GetService(serviceName))
    else
        return getgenv().Game:GetService(serviceName)
    end
end

local function getExecutor()
    local name
    if identifyexecutor then
        name = identifyexecutor()
    end
    return { Name = name or "Unknown Executor"}
end

local function executor_details()
    local executorDetails = getExecutor()
    return string.format("%s", executorDetails.Name)
end

local executor_Name = executor_details()

getgenv().print_executor = function()
    local function retrieve_executor()
        local name
        if identifyexecutor then
            name = identifyexecutor()
        end
        return { Name = name or "Unknown Executor"}
    end

    local function identify_executor()
        local executorDetails = retrieve_executor()
        return string.format("%s", executorDetails.Name)
    end
    wait(0.1)
    local executor_string = identify_executor()

    return print(executor_string)
end

getgenv().warn_executor = function()
    local function retrieve_executor()
        local name
        if identifyexecutor then
            name = identifyexecutor()
        end
        return { Name = name or "Unknown Executor"}
    end

    local function identify_executor()
        local executorDetails = retrieve_executor()
        return string.format("%s", executorDetails.Name)
    end
    wait(0.1)
    local executor_string = identify_executor()

    return warn(executor_string)
end

function randomString()
    local length = math.random(10,20)
    local array = {}
    for i = 1, length do
        array[i] = string.char(math.random(32, 126))
    end
    return table.concat(array)
end

getgenv().randomString = function()
    local length = math.random(10,20)
    local array = {}
    for i = 1, length do
        array[i] = string.char(math.random(32, 126))
    end
    return table.concat(array)
end


getgenv().AllClipboards = setclipboard or toclipboard or set_clipboard or (Clipboard and Clipboard.set)
getgenv().httprequest_Init = (syn and syn.request) or (http and http.request) or http_request or (fluxus and fluxus.request) or request
get_http = getgenv().httprequest_Init or (syn and syn.request) or (http and http.request) or http_request or (fluxus and fluxus.request) or request
getgenv().queueteleport = (syn and syn.queue_on_teleport) or queue_on_teleport or (fluxus and fluxus.queue_on_teleport)
queueteleport = getgenv().queueteleport

local function init_services()
    local services = {
        "Players",
        "Workspace",
        "Lighting",
        "ReplicatedStorage",
        "TweenService",
        "RunService",
        "MaterialService",
        "ReplicatedFirst",
        "Teams",
        "StarterPack",
        "StarterPlayer",
        "VoiceChatInternal",
        "VoiceChatService",
        "CoreGui",
        "SoundService",
        "StarterGui",
        "MarketplaceService",
        "TeleportService",
        "Chat",
        "AssetService",
        "HttpService",
        "UserInputService",
        "TextChatService",
        "ContextActionService",
        "GuiService",
        "PhysicsService"
    }

    for _, serviceName in pairs(services) do
        getgenv()[serviceName] = cloneref and cloneref(getgenv().Game:GetService(serviceName)) or getgenv().Game:GetService(serviceName)
    end
end
wait()
init_services()
wait(0.3)
if not getgenv().Players then
    warn("getgenv().Players was not detected, fixing...")
    getgenv().Players = getgenv().Service_Wrap("Players")
end
if not getgenv().ReplicatedStorage then
    warn("getgenv().ReplicatedStorage was not detected, fixing...")
    getgenv().ReplicatedStorage = getgenv().Service_Wrap("ReplicatedStorage")
end
if not getgenv().TextChatService then
    warn("getgenv().TextChatService was not detected, fixing...")
    getgenv().TextChatService = getgenv().Service_Wrap("TextChatService")
end
if not getgenv().Workspace then
    warn("getgenv().Workspace was not detected, fixing...")
    getgenv().Workspace = getgenv().Service_Wrap("Workspace")
end
if not getgenv().Lighting then
    warn("getgenv().Lighting was not detected, fixing...")
    getgenv().Lighting = getgenv().Service_Wrap("Lighting")
end

task.wait(0.2)
getgenv().Terrain = getgenv().Workspace.Terrain or getgenv().Workspace:FindFirstChild("Terrain")
getgenv().Camera = getgenv().Workspace.Camera or getgenv().Workspace:FindFirstChild("Camera")
getgenv().LocalPlayer = getgenv().Players.LocalPlayer
getgenv().Backpack = getgenv().LocalPlayer:WaitForChild("Backpack") or getgenv().LocalPlayer:FindFirstChild("Backpack") or getgenv().LocalPlayer:FindFirstChildOfClass("Backpack")
getgenv().PlayerGui = getgenv().LocalPlayer:WaitForChild("PlayerGui") or getgenv().LocalPlayer:FindFirstChild("PlayerGui") or getgenv().LocalPlayer:FindFirstChildOfClass("PlayerGui")
getgenv().PlayerScripts = getgenv().LocalPlayer:WaitForChild("PlayerScripts") or getgenv().LocalPlayer:FindFirstChild("PlayerScripts")
getgenv().Character = getgenv().LocalPlayer.Character or getgenv().LocalPlayer.CharacterAdded:Wait()
getgenv().HumanoidRootPart = getgenv().Character:WaitForChild("HumanoidRootPart") or getgenv().Character:FindFirstChild("HumanoidRootPart")
getgenv().Humanoid = getgenv().Character:WaitForChild("Humanoid") or getgenv().Character:FindFirstChildWhichIsA("Humanoid") or getgenv().Character:FindFirstChild("Humanoid")
getgenv().Head = getgenv().Character:WaitForChild("Head") or getgenv().Character:FindFirstChild("Head")

wait(0.2)

local function Dynamic_Character_Updater(character)
    warn("[HD_ADMIN_HUB]: Waiting for Character to fully load...")
    task.wait(0.2)
    getgenv().Character = character or getgenv().LocalPlayer.Character
    task.wait(0.3)
    local hrp = character:FindFirstChild("HumanoidRootPart") or character:WaitForChild("HumanoidRootPart", 3)
    getgenv().HumanoidRootPart = (hrp and hrp:IsA("BasePart")) and hrp

    local hum = character:FindFirstChildOfClass("Humanoid")
    getgenv().Humanoid = (hum and hum:IsA("Humanoid")) and hum

    local head = character:FindFirstChild("Head")
    getgenv().Head = (head and head:IsA("BasePart")) and head
end

Dynamic_Character_Updater(getgenv().Character)
task.wait(0.2)
getgenv().LocalPlayer.CharacterAdded:Connect(function(newCharacter)
    task.wait(1)
    warn("[HD_ADMIN_HUB]: New Character being added, pre-fetching and initializing.")
    Dynamic_Character_Updater(newCharacter)
    getgenv().LocalPlayer.CharacterAdded:Wait()
    task.wait(0.5)
    getgenv().Character = newCharacter
    getgenv().HumanoidRootPart = newCharacter:FindFirstChild("HumanoidRootPart") or newCharacter:WaitForChild("HumanoidRootPart", 5)
    getgenv().Humanoid = newCharacter:FindFirstChild("Humanoid") or newCharacter:FindFirstChildWhichIsA("Humanoid") or newCharacter:WaitForChild("Humanoid", 5)
    getgenv().Head = newCharacter:FindFirstChild("Head") or newCharacter:WaitForChild("Head", 5)
end)
task.wait(0.2)
local Rayfield
local HttpService = cloneref and cloneref(game:GetService("HttpService")) or game:GetService("HttpService")
local Players = cloneref and cloneref(game:GetService("Players")) or game:GetService("Players")
local RunService = cloneref and cloneref(game:GetService("RunService")) or game:GetService("RunService")

local function LocalPlayer_loaded()
    local player = Players.LocalPlayer
    if not player then
        repeat task.wait() until Players.LocalPlayer
        player = Players.LocalPlayer
    end

    if not player.Character or not player.Character:FindFirstChild("Humanoid") then
        player.CharacterAdded:Wait()
        repeat task.wait() until player.Character:FindFirstChild("Humanoid")
    end
end

local function render_safe()
    RunService.RenderStepped:Wait()
    task.wait(0.2)
end

local function load_rayfield()
    local attempts = 0
    local maxAttempts = 10
    local success = false
    local result

    repeat
        attempts += 1
        success, result = pcall(function()
            return loadstring(game:HttpGet("https://raw.githubusercontent.com/LmaoItsCrazyBro/new_main/refs/heads/main/Main_UI.lua"))()
        end)

        if not success or not result then
            warn("[Rayfield] Load failed (attempt " .. attempts .. "):", result)
            task.wait(1)
        end
    until success and result or attempts >= maxAttempts

    return result
end

task.spawn(function()
    LocalPlayer_loaded()
    render_safe()

    Rayfield = load_rayfield()
    if Rayfield then
        print("[Rayfield]: UI successfully loaded.")
    else
        warn("[CRITICAL_ERROR] Rayfield failed to load after multiple attempts.")
    end
end)
wait(0.5)
getgenv().notify = function(title, content, duration)
    Rayfield:Notify({
        Title = tostring(title),
        Content = tostring(content),
        Duration = tonumber(duration),
        Image = 93594537601787,
        Actions = {
            Ignore = {
                Name = "Okay.",
                Callback = function() 
                    print("...") 
                end
            },
        },
    })
end
wait(0.3)
local Window 
wait(0.2)
if executor_Name == "Solara" or executor_Name == "Sonar" then
    Window = Rayfield:CreateWindow({
        Name = "✨ HD Admin - Hub ✨ | 1.0.1 | "..tostring(executor_Name),
        LoadingTitle = "Enjoy, "..tostring(game.Players.LocalPlayer),
        LoadingSubtitle = "HD Admin Hub | FLAWLESS!",
        ConfigurationSaving = {
            Enabled = false,
            FolderName = "ConfigurationHDAdminHub",
            FileName = "HDAdminHub"
        },
        Discord = {
            Enabled = false,
            Invite = "",
            RememberJoins = true
        },
        KeySystem = false,
        KeySettings = {
            Title = "None",
            Subtitle = "No key system is provided.",
            Note = "...",
            FileName = "Key",
            SaveKey = false,
            GrabKeyFromSite = false,
            Key = {""}
        }
    })
else
    Window = Rayfield:CreateWindow({
        Name = "✨ HD Admin - Hub ✨ | 1.0.1 | "..tostring(executor_Name),
        LoadingTitle = "Enjoy, "..tostring(game.Players.LocalPlayer),
        LoadingSubtitle = "HD Admin Hub | FLAWLESS!",
        ConfigurationSaving = {
            Enabled = false,
            FolderName = "ConfigurationHDAdminHub",
            FileName = "HDAdminHub"
        },
        Discord = {
            Enabled = false,
            Invite = "",
            RememberJoins = true
        },
        KeySystem = false,
        KeySettings = {
            Title = "HD Admin Hub Key System",
            Subtitle = "Welcome, "..tostring(game.Players.LocalPlayer),
            Note = "Hello!",
            FileName = "",
            SaveKey = true,
            GrabKeyFromSite = false,
            Key = {""}
        }
    })
end
task.wait(0.3)
local Tab1 = Window:CreateTab("🏡 Home 🏡", 0)
local Section1 = Tab1:CreateSection("||| 🏡 Home 🏡 |||")
local Tab2 = Window:CreateTab("🧍 LocalPlayer 🧍", 0)
local Section2 = Tab2:CreateSection("||| 🧍 LocalPlayer 🧍 |||")
local Tab3 = Window:CreateTab("⭐ Extras ⭐", 0)
local Section3 = Tab3:CreateSection("||| ⭐ Extra Content ⭐ |||")
local HDAdmin_Client_Folder
local Modules_Folder
local Messages_Module
local Signals
local ChangeSetting_RF
local ReplicatedStorage = getgenv().ReplicatedStorage

HDAdmin_Client_Folder = ReplicatedStorage:FindFirstChild("HDAdminClient") or ReplicatedStorage:FindFirstChild("HDAdminHDClient")
if HDAdmin_Client_Folder then
    Modules_Folder = HDAdmin_Client_Folder:WaitForChild("Modules")
    Signals = HDAdmin_Client_Folder:FindFirstChild("Signals")
    ChangeSetting_RF = Signals and Signals:FindFirstChild("ChangeSetting")
    Messages_Module = Modules_Folder:FindFirstChild("Messages")

    if not (executor_Name == "Solara" or executor_Name == "Xeno" or string.find(executor_Name, "JJSploit")) then
        local Content = {
            Title = "[SCRIPT_OWNER]: Owner Announcement.",
            Message = "Hello, "..tostring(game.Players.LocalPlayer.Name).." | Welcome to: Flames Hub! (THIS DOES NOT SHOW FOR EVERYONE! JUST YOU!)",
            Color = {0.2, 0.6, 1},
            SenderName = "[Owner]",
            SenderId = 8460537469,
            DisplayFrom = true
        }

        if Messages_Module then
            require(Messages_Module):GlobalAnnouncement(Content)
        end
    end
end
task.wait(0.2)

local function post_message_chat(message)
    if not tostring(message) then return warn("Message wasn't a string! please provide a string and try again.") end
    local msg_content = tostring(message)

    if getgenv().TextChatService.ChatVersion == Enum.ChatVersion.TextChatService then
        return getgenv().TextChatService:FindFirstChild("TextChannels"):FindFirstChild("RBXGeneral"):SendAsync(msg_content)
    elseif getgenv().TextChatService.ChatVersion == Enum.ChatVersion.LegacyChatService then
        return getgenv().ReplicatedStorage:FindFirstChild("DefaultChatSystemChatEvents"):FindFirstChild("SayMessageRequest"):FireServer(msg_content)
    else
        return warn("Unknown ChatVersion!")
    end
end

getgenv().IceAll_Singular = Tab1:CreateButton({
Name = "Ice Others (needs 'Admin' Rank)",
Callback = function()
    local Ice_Invoke_Data = {
        {
            "Prefix",
            ";"
	    }
    }

    if Signals and ChangeSetting_RF then
        ChangeSetting_RF:InvokeServer(Ice_Invoke_Data)
        wait(0.3)
        for i = 1, getgenv().Players.MaxPlayers do
            for _, v in ipairs(getgenv().Players:GetPlayers()) do
                if v ~= getgenv().LocalPlayer then
                    task.wait(0.5)
                    post_message_chat("/e ;ice "..tostring(v.Name))
                end
            end
        end
    elseif not ChangeSetting_RF and Signals then
        return getgenv().notify("Heads Up:", "Please change your prefix in HD admin to: ;", 5)
    else
        return getgenv().notify("Failure:", "Could not run this due to requirements missing!", 5)
    end
end,})

getgenv().IceAll_Singular = Tab1:CreateButton({
Name = "Jail Others (needs 'Admin' Rank)",
Callback = function()
    local Jail_Invoke_Data = {
        {
            "Prefix",
            ";"
	    }
    }

    if Signals and ChangeSetting_RF then
        ChangeSetting_RF:InvokeServer(Jail_Invoke_Data)
        wait(0.3)
        for i = 1, getgenv().Players.MaxPlayers do
            for _, v in ipairs(getgenv().Players:GetPlayers()) do
                if v ~= getgenv().LocalPlayer then
                    task.wait(0.5)
                    post_message_chat("/e ;jail "..tostring(v.Name))
                end
            end
        end
    elseif not ChangeSetting_RF and Signals then
        return getgenv().notify("Heads Up:", "Please change your prefix in HD admin to: ;", 5)
    else
        return getgenv().notify("Failure:", "Could not run this due to requirements missing!", 5)
    end
end,})

getgenv().ShowCmd_Bar = Tab1:CreateButton({
Name = "Show Command Bar (needs 'Admin' Rank)",
Callback = function()
    local CmdBar_Invoke_Data = {
        {
            "Prefix",
            ";"
	    }
    }

    if Signals and ChangeSetting_RF then
        ChangeSetting_RF:InvokeServer(CmdBar_Invoke_Data)
        wait(0.3)
        post_message_chat("/e ;cmdbar")
    elseif not ChangeSetting_RF and Signals then
        return getgenv().notify("Heads Up:", "Please change your prefix in HD admin to: ;", 5)
    else
        return getgenv().notify("Failure:", "Could not run this due to requirements missing!", 5)
    end
end,})

local function search_for_remote(name)
    name = name:lower()
    for _, v in ipairs(game:GetDescendants()) do
        if v:IsA("RemoteEvent") and v.Name:lower():find(name) then
            return v
        end
    end
    return nil
end

local remote_to_search = search_for_remote("afk")
wait(0.2)
getgenv().AFK_Toggle = Tab3:CreateToggle({
Name = "Universal AFK RemoteEvent Toggle",
CurrentValue = false,
Flag = "TogglingAFKRemoteUniversally",
Callback = function(ability_AFK_remote)
    if ability_AFK_remote then
        if not remote_to_search then
            getgenv().AFK_Toggle:Set(false)
        end
        wait(0.1)
        getgenv().toggling_AFK_remote = true
        while getgenv().toggling_AFK_remote do
        wait()
            remote_to_search:FireServer(true) -- i am truly just assuming the RemoteEvent fires with 'true' or 'false' arguments.
        end
    else
        if remote_to_search then
            remote_to_search:FireServer(false)
        end
        getgenv().toggling_AFK_remote = false
        getgenv().toggling_AFK_remote = false
    end
end,})
