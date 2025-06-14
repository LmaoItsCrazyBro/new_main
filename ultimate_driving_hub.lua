if game.PlaceId ~= 54865335 then return warn("Not the right game lil bro.") end

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
task.wait()
local HttpService = cloneref and cloneref(game:GetService("HttpService")) or game:GetService("HttpService")
local Players = cloneref and cloneref(game:GetService("Players")) or game:GetService("Players")
local RunService = cloneref and cloneref(game:GetService("RunService")) or game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer
local Vehicles_LocalPlayer_Folder = LocalPlayer:FindFirstChild("Vehicles")
local ReplicatedStorage = cloneref and cloneref(game:GetService("ReplicatedStorage")) or game:GetService("ReplicatedStorage")
local Workspace = cloneref and cloneref(game:GetService("Workspace")) or game:GetService("Workspace")
local Main_Folder = Workspace:FindFirstChild("_Main")
local Vehicles_Folder = Main_Folder and Main_Folder:FindFirstChild("Vehicles")
local Events = ReplicatedStorage:FindFirstChild("Events")
local Modules = ReplicatedStorage:FindFirstChild("Modules")
local VehicleCustomizationsData = Modules:FindFirstChild("VehicleCustomizationsData")
local Vehicle_Change_RF = VehicleCustomizationsData:FindFirstChild("WriteVehicleChanges")
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
local Anti_Ragdoll_Active = false

wait(0.2)

local function Dynamic_Character_Updater(character)
    warn("[Ultimate_Driving_Hub]: Waiting for Character to fully load...")
    task.wait(0.2)
    getgenv().Character = character or getgenv().LocalPlayer.Character
    task.wait(0.3)
    local hrp = character:FindFirstChild("HumanoidRootPart") or character:WaitForChild("HumanoidRootPart", 3)
    getgenv().HumanoidRootPart = (hrp and hrp:IsA("BasePart")) and hrp

    local hum = character:FindFirstChildOfClass("Humanoid")
    getgenv().Humanoid = (hum and hum:IsA("Humanoid")) and hum

    if Anti_Ragdoll_Active or Anti_Ragdoll_Active == true then
        warn("Anti-Ragdoll Toggle is [ENABLED], removing unpermitted non-requirements...")
        task.wait(.3)
        if character and character:FindFirstChild("Humanoid") then
            character:FindFirstChild("RagdollConstraints"):Destroy()
            if getgenv().LocalPlayer:FindFirstChild("PlayerScripts"):FindFirstChild("RagdollClient") then
                getgenv().LocalPlayer:FindFirstChild("PlayerScripts"):FindFirstChild("RagdollClient").Parent = getgenv().SoundService
            end
            if getgenv().StarterPlayer:FindFirstChild("StarterPlayerScripts"):FindFirstChild("RagdollClient") then
                getgenv().StarterPlayer:FindFirstChild("StarterPlayerScripts"):FindFirstChild("RagdollClient").Parent = getgenv().TweenService
            end
            if Modules:FindFirstChild("Ragdoll") then
                Modules:FindFirstChild("Ragdoll").Parent = getgenv().AssetService
            end
        end
    end

    local head = character:FindFirstChild("Head")
    getgenv().Head = (head and head:IsA("BasePart")) and head
end

Dynamic_Character_Updater(getgenv().Character)
task.wait(0.2)
getgenv().LocalPlayer.CharacterAdded:Connect(function(newCharacter)
    task.wait(1)
    warn("[Ultimate_Driving_Hub]: New Character being added, pre-fetching and initializing.")
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

local function retrieve_vehicle()
    if not Vehicles_Folder or not Vehicles_LocalPlayer_Folder then return nil end
    local objectValue = Vehicles_LocalPlayer_Folder:FindFirstChildOfClass("ObjectValue")
    if not objectValue then return nil end
    for _, v in ipairs(Vehicles_Folder:GetChildren()) do
        if v:IsA("Model") and v.Name == tostring(objectValue.Value) then
            return v
        end
    end
    return nil
end

local Vehicle = retrieve_vehicle()
local Vehicle_Name
if not Vehicle then
    warn("Player has not spawned a vehicle in yet.")
else
    Vehicle_Name = Vehicle.Name
end

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
            local raw = game:HttpGet("https://raw.githubusercontent.com/LmaoItsCrazyBro/new_main/main/Main_UI.lua")
            local func = loadstring(raw)
            return func()
        end)

        if not success or not result then
            warn("[Rayfield] Load failed (attempt " .. attempts .. "):", result)
            task.wait(1)
        end
    until (success and result) or attempts >= maxAttempts

    return result
end

local Window

LocalPlayer_loaded()
render_safe()

Rayfield = load_rayfield()

if typeof(Rayfield) == "table" and Rayfield.CreateWindow then
    Window = Rayfield:CreateWindow({
        Name = "✨ Ultimate Driving ✨ | 1.0.1 | "..tostring(executor_Name),
        LoadingTitle = "Welcome, "..tostring(game.Players.LocalPlayer),
        LoadingSubtitle = "Ultimate Driving | Hub.",
        ConfigurationSaving = {
            Enabled = false,
            FolderName = "UltimateDrivingHub-Config",
            FileName = "UltimateDrivingScriptHub"
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
            Note = "nice hidden dumper skid, it's useless (like you)",
            FileName = "Key",
            SaveKey = false,
            GrabKeyFromSite = false,
            Key = {""}
        }
    })
else
    warn("[CRITICAL_ERROR]: Rayfield failed to load or is not valid. Returned:", Rayfield)
end
wait(1)
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
task.wait(1)
local Tab1 = Window:CreateTab("🏡 Main 🏡", 0)
local Section1 = Tab1:CreateSection("| 🏡 Main 🏡 |")
local Tab2 = Window:CreateTab("🧍 LocalPlayer 🧍", 0)
local Section2 = Tab2:CreateSection("| 🧍 LocalPlayer 🧍 |")
local Tab3 = Window:CreateTab("⭐ Extras ⭐", 0)
local Section3 = Tab3:CreateSection("| ⭐ Extra Content ⭐ |")
local Tab4 = Window:CreateTab("🚗 Vehicle 🚗", 0)
local Section4 = Tab4:CreateSection("| 🚗 Vehicle 🚗 |")
local current_car_tint_color = Color3.new(0, 0, 0)
local current_car_tint_transparency = 1

getgenv().CarTintColor = Tab4:CreateColorPicker({
Name = "Car Tint Color",
Color = Color3.fromRGB(0, 0, 0),
Flag = "PickingCarTintColor",
Callback = function(car_tint_color)
    local args = {
        tostring(Vehicle.Name),
        {
            ColorTint = car_tint_color,
            TransparencyTint = current_car_tint_transparency
        }
    }

    Vehicle_Change_RF:InvokeServer(unpack(args))
    task.wait(.5)
    current_car_tint_color = car_tint_color
end,})

getgenv().CarTintTransparency = Tab4:CreateSlider({
Name = "Car Tint Transparency",
Range = {0, 1},
Increment = 0.1,
Suffix = "",
CurrentValue = 1,
Flag = "SliderCarTintTransparency",
Callback = function(car_tint_transparency)
    local args = {
        tostring(Vehicle.Name),
        {
            ColorTint = current_car_tint_color,
            TransparencyTint = tonumber(car_tint_transparency)
        }
    }

    Vehicle_Change_RF:InvokeServer(unpack(args))
    task.wait(.5)
    current_car_tint_transparency = car_tint_transparency
end,})

if writefile and delfile and loadfile then
    getgenv().Save_Car_Config = Tab4:CreateButton({
    Name = "Save Car Config",
    Callback = function()
        local data = {
            TintColor = {
                R = current_car_tint_color.R,
                G = current_car_tint_color.G,
                B = current_car_tint_color.B
            },
            TintTransparency = current_car_tint_transparency
        }

        local json = HttpService:JSONEncode(data)
        task.wait(.3)
        writefile("car_config.json", json)
    end,})

    getgenv().Delete_Car_Config = Tab4:CreateButton({
    Name = "Delete Car Config",
    Callback = function()
        if isfile("car_tint_config.json") then
            delfile("car_tint_config.json")
        end
    end,})

    getgenv().Load_Car_Config = Tab4:CreateButton({
    Name = "Load Car Config",
    Callback = function()
        if isfile("car_tint_config.json") then
            local contents = readfile("car_tint_config.json")
            local data = HttpService:JSONDecode(contents)

            current_car_tint_color = Color3.new(data.TintColor.R, data.TintColor.G, data.TintColor.B)
            current_car_tint_transparency = data.TintTransparency
            task.wait(.3)
            local args = {
                tostring(Vehicle.Name),
                {
                    ColorTint = current_car_tint_color,
                    TransparencyTint = current_car_tint_transparency
                }
            }

            Vehicle_Change_RF:InvokeServer(unpack(args))
        end
    end,})
end

getgenv().AntiRagdoll = Tab2:CreateToggle({
Name = "Anti Ragdoll",
CurrentValue = false,
Flag = "FullAntiRagdoll",
Callback = function(anti_ragdoll)
    if anti_ragdoll then
        getgenv().Anti_Ragdoll_Enabled = true
        Anti_Ragdoll_Active = true
        task.wait(.3)
        if getgenv().Character and getgenv().Character:FindFirstChild("Humanoid") and getgenv().Humanoid then
            if getgenv().Character:FindFirstChild("RagdollConstraints") then
                getgenv().Character:FindFirstChild("RagdollConstraints"):Destroy()
            end
            if getgenv().LocalPlayer:FindFirstChild("PlayerScripts"):FindFirstChild("RagdollClient") then
                getgenv().LocalPlayer:FindFirstChild("PlayerScripts"):FindFirstChild("RagdollClient").Parent = getgenv().SoundService
            end
            if getgenv().StarterPlayer:FindFirstChild("StarterPlayerScripts"):FindFirstChild("RagdollClient") then
                getgenv().StarterPlayer:FindFirstChild("StarterPlayerScripts"):FindFirstChild("RagdollClient").Parent = getgenv().TweenService
            end
            if Modules:FindFirstChild("Ragdoll") then
                Modules:FindFirstChild("Ragdoll").Parent = getgenv().AssetService
            end
        end
    else
        getgenv().Anti_Ragdoll_Enabled = false
        getgenv().Anti_Ragdoll_Enabled = false
        Anti_Ragdoll_Active = false
        Anti_Ragdoll_Active = false
        task.wait(.3)
        if getgenv().SoundService:FindFirstChild("RagdollClient") then
            getgenv().SoundService:FindFirstChild("RagdollClient").Parent = getgenv().LocalPlayer:FindFirstChild("PlayerScripts")
        end
        if getgenv().TweenService:FindFirstChild("RagdollClient") then
            getgenv().TweenService:FindFirstChild("RagdollClient").Parent = getgenv().StarterPlayer:FindFirstChild("StarterPlayerScripts")
        end
        if getgenv().AssetService:FindFirstChild("Ragdoll") then
            getgenv().AssetService:FindFirstChild("Ragdoll").Parent = Modules
        end
    end
end,})

getgenv().Rainbow_FE_Car = Tab4:CreateToggle({
Name = "Rainbow Car (FE)",
CurrentValue = false,
Flag = "RainbowFECarScript",
Callback = function(rainbow_car)
    if rainbow_car then
                    local colors = {
                Black = {
                    ColorPrimary = Color3.new(0, 0, 0),
                    ColorSecondary = Color3.new(0, 0, 0),
                    ReflectancePrimary = 0,
                    WrapPrimary = -1
                },
                Teal = {
                    ColorPrimary = Color3.fromRGB(0, 128, 128),
                    ColorSecondary = Color3.new(0, 0, 0),
                    ReflectancePrimary = 0,
                    WrapPrimary = -1
                },
                Green = {
                    ColorPrimary = Color3.fromRGB(0, 255, 0),
                    ColorSecondary = Color3.new(0, 0, 0),
                    ReflectancePrimary = 0,
                    WrapPrimary = -1
                },
                Blue = {
                    ColorPrimary = Color3.fromRGB(0, 0, 255),
                    ColorSecondary = Color3.new(0, 0, 0),
                    ReflectancePrimary = 0,
                    WrapPrimary = -1
                },
                Red = {
                    ColorPrimary = Color3.fromRGB(255, 0, 0),
                    ColorSecondary = Color3.new(0, 0, 0),
                    ReflectancePrimary = 0,
                    WrapPrimary = -1
                },
                Yellow = {
                    ColorPrimary = Color3.fromRGB(255, 255, 0),
                    ColorSecondary = Color3.new(0, 0, 0),
                    ReflectancePrimary = 0,
                    WrapPrimary = -1
                },
                Orange = {
                    ColorPrimary = Color3.fromRGB(255, 165, 0),
                    ColorSecondary = Color3.new(0, 0, 0),
                    ReflectancePrimary = 0,
                    WrapPrimary = -1
                },
                Camo = {
                    ColorPrimary = Color3.fromRGB(102, 102, 51),
                    ColorSecondary = Color3.fromRGB(34, 34, 17),
                    ReflectancePrimary = 0.1,
                    WrapPrimary = 3
                }
            }

        getgenv().rainbow_vehicle = true
        while getgenv().rainbow_vehicle == true do
        task.wait()
            for name, preset in pairs(colors) do
                Vehicle_Change_RF:InvokeServer(Vehicle.Name, preset)
            end
        end
    else
        getgenv().rainbow_vehicle = false
        getgenv().rainbow_vehicle = false
    end
end,})

getgenv().Rainbow_Vehicle_Underglow = Tab4:CreateToggle({
Name = "Rainbow Vehicle Underglow (FE)",
CurrentValue = false,
Flag = "RainbowUnderglow",
Callback = function(rainbow_underglow)
    if rainbow_underglow then
        getgenv().rainbow_vehicle_underglow = true
        while getgenv().rainbow_vehicle_underglow == true do
        task.wait()
            local underglow_colors = {
                Pink = Color3.fromRGB(255, 105, 180),
                Purple = Color3.fromRGB(128, 0, 128),
                Green = Color3.fromRGB(0, 255, 0),
                Black = Color3.fromRGB(0, 0, 0),
                White = Color3.fromRGB(255, 255, 255),
                Grey = Color3.fromRGB(128, 128, 128),
                Orange = Color3.fromRGB(255, 165, 0),
                Yellow = Color3.fromRGB(255, 255, 0),
                Camo = Color3.fromRGB(102, 102, 51),
                Brown = Color3.fromRGB(139, 69, 19)
            }

            for name, color in pairs(underglow_colors) do
                local args = {
                    Vehicle.Name,
                    {
                        ColorUnderglow = color,
                        EnabledUnderglow = true
                    }
                }

                Vehicle_Change_RF:InvokeServer(unpack(args))
            end
        end
    else
        getgenv().rainbow_vehicle_underglow = false
        getgenv().rainbow_vehicle_underglow = false
    end
end,})

getgenv().Rainbow_Tires_FE = Tab4:CreateToggle({
Name = "Rainbow Tires (FE)",
CurrentValue = false,
Flag = "RainbowFETiresScript",
Callback = function(Rainbow_Tires_Main)
    if Rainbow_Tires_Main then
        local wheel_colors = {
            Pink = Color3.fromRGB(255, 105, 180),
            Purple = Color3.fromRGB(128, 0, 128),
            Green = Color3.fromRGB(0, 255, 0),
            Black = Color3.fromRGB(0, 0, 0),
            White = Color3.fromRGB(255, 255, 255),
            Grey = Color3.fromRGB(128, 128, 128),
            Orange = Color3.fromRGB(255, 165, 0),
            Yellow = Color3.fromRGB(255, 255, 0),
            Camo = Color3.fromRGB(102, 102, 51),
            Brown = Color3.fromRGB(139, 69, 19)
        }

        getgenv().RainbowTires_Script = true
        while getgenv().RainbowTires_Script == true do
        task.wait()
            for name, color in pairs(wheel_colors) do
                local args = {
                    Vehicle.Name,
                    {
                        ColorWheels = color
                    }
                }
                Vehicle_Change_RF:InvokeServer(unpack(args))
            end
        end
    else
        getgenv().RainbowTires_Script = false
        getgenv().RainbowTires_Script = false
    end
end,})

getgenv().Inf_Yield = Tab3:CreateButton({
Name = "Infinite Yield",
Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
end,})

getgenv().System_Broken = Tab3:CreateButton({
Name = "System Broken",
Callback = function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/LmaoItsCrazyBro/new_main/refs/heads/main/System_Broken.lua'))()
end,})
