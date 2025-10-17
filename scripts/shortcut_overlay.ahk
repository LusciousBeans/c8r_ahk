#Requires AutoHotkey v2
#SingleInstance Force

; Paths
primaryPath := "C:\Users\" . A_UserName . "\Pictures\_ahk-keyboard-guide.png"
fallbackPath := "C:\Users\" . A_UserName . "\OneDrive\Pictures\_ahk-keyboard-guide.png"

if FileExist(primaryPath)
    guidePath := primaryPath
else if FileExist(fallbackPath)
    guidePath := fallbackPath
else
{
    MsgBox("Guide PNG not found in either location.`nPlease place _ahk-keyboard-guide.png in your Pictures folder.")
    ExitApp
}

; Overlay size
width := 300
height := 300
; You can change these.

; ATTENTION RESPONDENT: TOUCHING THE CODE BELOW IS NOT RECOMMENDED IF YOU DO NOT KNOW WHAT YOU'RE DOING.

; Screen size
screenWidth := SysGet(78)
screenHeight := SysGet(79)

xPos := screenWidth - width - 20
yPos := 20

; Create GUI
guideGui := Gui("+AlwaysOnTop +ToolWindow -Caption")
guideGui.Add("Picture", "w" width " h" height, guidePath)
guideGui.Show("x" xPos " y" yPos)

DllCall("SetWindowLongPtr", "Ptr", guideGui.Hwnd, "Int", -20, "Ptr", (DllCall("GetWindowLongPtr", "Ptr", guideGui.Hwnd, "Int", -20) | 0x20)) 

; Initialize GuiVisible
GuiVisible := true

; F10 toggle - **global must be declared inside the hotkey block**
F10::
{
    global GuiVisible, guideGui
    GuiVisible := !GuiVisible
    if GuiVisible
        guideGui.Show()
    else
        guideGui.Hide()
}
return
