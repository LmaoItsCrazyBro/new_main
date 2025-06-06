-- Will be put into the script hub soon.
-- just need to find time to do it.
-- basically just ensures that the game can't set back the Camera Zoom Distance.

getgenv().inf_zoom_always = true
while getgenv().inf_zoom_always == true do
task.wait()
    getgenv().LocalPlayer.CameraMinZoomDistance = 0
    getgenv().LocalPlayer.CameraMaxZoomDistance = 1000000
end
