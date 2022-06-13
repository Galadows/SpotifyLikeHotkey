#NoEnv	; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input	; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%	; Ensures a consistent starting directory.

F1::
WinGet, winid ,, A ;
MouseGetPos, xmousepos, ymousepos 
processName := "Spotify.exe"
if WinExist("ahk_exe " . processName){
    WinActivate	; Use the window found by WinExist.
    }
WinGetPos, winX, winY, winWidth, winHeight, A
;MsgBox The windows is %winWidth%X%winHeight%
ImageSearch, FoundX, FoundY, 0, 0, %winWidth%, %winHeight%, empty_heart.png

if (ErrorLevel = 2){
    SoundPlay *-1
    MsgBox Could not conduct the search.
    }
else if (ErrorLevel = 1){
    ImageSearch, FoundX, FoundY, 0, 0, %winWidth%, %winHeight%, full_heart.png

    if (ErrorLevel = 2){
        SoundPlay *-1
        MsgBox Could not conduct the search.
        }
    else if (ErrorLevel = 1)
        SoundPlay *-1
    else{
        SoundPlay toggleLike.wav
    ; MsgBox The icon was found at %FoundX%x%FoundX%.
        Click, %FoundX% %FoundY%
    }
}
else{
    SoundPlay toggleLike.wav
    ;MsgBox The icon was found at %FoundX%x%FoundX%.
    Click, %FoundX% %FoundY%
}

CoordMode, Mouse, Screen
Click, %xmousepos% %ymousepos% 0
WinActivate ahk_id %winid%
    