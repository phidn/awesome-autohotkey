/*
Wed 16-Jun-21 11:50 PM
VuDucHihi
								Ghé Vô Kênh Tui Chơi
VuDucHihi's youtube Channel: https://www.youtube.com/channel/UCab7egKe98SI-Q2TXv9Q0hw
*/
;~ #NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
;~ ; #Warn  ; Enable warnings to assist with detecting common errors.
;~ SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
;~ SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
;~ #SingleInstance, Force 



SetClipboard(){
    ;~ Clipback := ClipboardAll
    Clipboard =
    Send ^c
    ClipWait,1
}

SetClipboardAdvance(){
    ;~ Clipback := ClipboardAll
    Clipboard =
    Send ^c
    ClipWait,1
    Clipboard := StrReplace(Clipboard, "`r`n", " ")
}


LoadandMove(Path, WinTitle, X, Y, W, H)
{
  IfWinExist, %WinTitle%
  {  
    WinActivate, %WinTitle%
  }
  else
  {
    Run, %Path%
  }
  WinWaitActive, %WinTitle%,, 10
  WinMove, %WinTitle%,, %X%, %Y%, %W%, %H%
}


Load(App_Path, App_Process){
	
If WinExist(App_Process)
{
	;~ MsgBox exist
	WinActivate, %App_Process%
	WinWaitActive, %App_Process%
}
else
{
	Run, %App_Path%
	WinActivate, %App_Process%
	WinWaitActive, %App_Process%
}
}


ScreenShort(){
	Send #+s
	Clipboard :=""
	KeyWait, LButton, D
	KeyWait, LButton
	ClipWait, 1
}

