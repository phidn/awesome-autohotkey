I_Icon = C:\Workspace\AutoHotKey\YT-Scapple-Notestyles\mindmap_list_icon_155124.ico
IfExist, %I_Icon%
Menu, Tray, Icon, %I_Icon%

#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance, Force 





;if scapple active
/*
;~ DefaultNote				LButton + D
;~ Heading 1				LButton + 1
;~ Heading 2	 			LButton + 2
;~ Heading 3	 			LButton + 3
;~ Quote					LButton + Q
;~ Label 					LButton + L
;~ Text Red
;~ Text Gray 			
;~ Fade					LButton + G
;~ Bubble Pink 			LButton + P
;~ Bubble Blue 			LButton + B
;~ Bubble Yellow 			LButton + Y
;~ Bubble Red 				LButton + R
;~ NewShapeBackground		LButton + X
;~ Auto-Fit				LButton + F
;~ SizeNote 			LButton + S

;Align\ Horizontal Centers  LButton + h
;Align\ Vertical Centers 	LButton + v

;Distribute\ Horizontally 	Ctrl + Win + h
;Distribute\ Vertically		Ctrl + Win + v


*/

;if scapple exist
/*
Copy to scapple 		F1
Multiple Sentences		CTRL + ALT + Tab
Picture to Scapple		CTRL + ALT + S
*/

global AutoFit := 12

;NoteStyle
global DefaultNote := 01
global Heading1 := 02
global Heading2 := 03
global Heading3 := 04
global Quote := 05
global TextGray := 06
global TextRed := 07
global Label := 08
;~ global BubbleGreen := 09
global BubbleYellow := 10
global BubblePink := 11
global BubbleRed := 12
global BubbleBlue := 13
global SizeNote := 14

ApplyNoteType(Option){
	Option := Option -1
	Send, {Down %Option%}
	Send, {Enter}
}


;Align
Align(Option){
	Option := Option - 1
	Send, {Down %Option%}
	Send, {Enter}
}


DownAndPick(Option){
	Send, {Down %Option%}
	Send, {Enter}
}

Distribute(Option){
	Option := Option - 1
	Send, {Down %Option%}
	Send, {Enter} 
}



New(Option){
	Option := Option - 1
	Send, {Down %Option%}
	Send, {Enter}
	if(Option != 0){
		Send, ^+m
		Send, {CtrlUp}
	}
}

Format(Option){
	Option := Option -1
	Send, !n
	;~ Sleep, 100
	Send, {Right}
	;~ Sleep, 100
	Send, {Down %Option%}
	;~ Sleep, 100
	Send, {Enter}
	Sleep, 100
}

	global Step_RightClickAll_O := 0
	global ApplyNoteType_O := 0
	global Align_O := 0
	global Distribute_O := 0
	
CursorCheck(){
	if(A_Cursor == "IBeam"){
		Send, {Esc}
		Sleep, 100
	}
}
;*************************************************************************WINACTIVE*******************************************************************

#IfWinActive ahk_exe scapple.exe
{
	

	;RightClickAll(0,0,0,0,0)
	;RightClickAll(Step_RightClickAll_O, ApplyNoteType_O, Align_O, Distribute_O)
	RightClickAll(Step_RightClickAll_O, ApplyNoteType_O, Align_O, Distribute_O){
		CursorCheck()

		;Position in RightClick_Interface
		ApplyNoteType_RightClickAll:= 5
		Align_RightClickAll:= 13
		Distribute_RightClickAll :=14
		
		if(ApplyNoteType_O != 0){
			gosub, rightclick
			DownAndPick(ApplyNoteType_RightClickAll)
			ApplyNoteType(ApplyNoteType_O)
		}
		if(Align_O != 0){
			gosub, rightclick
			DownAndPick(Align_RightClickAll)
			Align(Align_O)
		}	
		if(Distribute_O != 0){
			gosub, rightclick
			DownAndPick(Distribute_RightClickAll)
			Distribute(Distribute_O)
		}
		if(Step_RightClickAll_O != 0 ){
			gosub, rightclick
			DownAndPick(Step_RightClickAll_O)
		}	
		;~ if(Step_RightClickAll_O != 0 & != 12){
			;~ gosub, rightclick
			;~ DownAndPick(Step_RightClickAll_O)
		;~ }
		;~ if(Step_RightClickAll_O == 12){ ;Autofit
			;~ Step_RightClickAll_O := 10
			;~ Send, !n
			;~ DownAndPick(Step_RightClickAll_O)
		;~ }
		Send, {CtrlUp}
	}



	;~ DefaultNote				LButton + D
	~LButton & d::
	RightClickAll(AutoFit, DefaultNote, Align_O, Distribute_O)
	return

	;~ Heading 1				LButton + 1
	~LButton & 1::
	RightClickAll(AutoFit, Heading1, Align_O, Distribute_O)
	return

	;~ Heading 2	 			LButton + 2
	~LButton & 2::
	RightClickAll(AutoFit, Heading2, Align_O, Distribute_O)
	return

	;~ Heading 3	 			LButton + 3
	~LButton & 3::
	RightClickAll(AutoFit, Heading3, Align_O, Distribute_O)
	return


	;~ Quote					LButton + Q
	~LButton & q::
	RightClickAll(AutoFit, Quote, Align_O, Distribute_O)
	return


	;~ Text Gray 			
	;~ ~LButton & g::
	;~ RightClickAll(Step_RightClickAll_O, TextGray, Align_O, Distribute_O)
	;~ return



	;~ Fade					LButton + G
	~LButton & g::
	;~ MsgBox check
	Format(9)
	return


	;~ Label 					LButton + L
	~LButton & l::
	RightClickAll(Step_RightClickAll_O, Label, Align_O, Distribute_O)
	return


	;~ Bubble Pink 			LButton + P
	~LButton & p::
	RightClickAll(Step_RightClickAll_O, BubblePink, Align_O, Distribute_O)
	return


	;~ Bubble Yellow 			LButton + Y
	~LButton & y::
	RightClickAll(Step_RightClickAll_O, BubbleYellow, Align_O, Distribute_O)
	return

	;~ Bubble Blue 			LButton + B
	~LButton & b::
	RightClickAll(Step_RightClickAll_O, BubbleBlue, Align_O, Distribute_O)
	return

	;~ Bubble Red 				LButton + R
	~LButton & r::
	RightClickAll(Step_RightClickAll_O, BubbleRed, Align_O, Distribute_O)
	return


	;~ Sizenote			LButton + S
	~LButton & s::
	RightClickAll(Step_RightClickAll_O, SizeNote, Align_O, Distribute_O)
	return

	;~ ~LButton & n::
	;~ RightClickAll(0,0,0,0)
	;~ return

	;Auto-Fit
	~LButton & f::
	;~ RightClickAll(AutoFit,0,0,0)
	RightClickAll(AutoFit, ApplyNoteType_O, Align_O, Distribute_O)
	return

	;Background Shape 	LButton + X
	~LButton & x::
	CursorCheck()
	gosub, rightclick
	DownAndPick(1)
	New(2)
	Send, {CtrlUp}
	return

	;Align\ Horizontal Centers  LButton + h
	~LButton & h:: 
	RightClickAll(Step_RightClickAll_O, ApplyNoteType_O, 5, 0)
	return

	;Align\ Vertical Centers 	LButton + v
	~LButton & v:: 
	RightClickAll(Step_RightClickAll_O, ApplyNoteType_O, 6, 0)
	;~ Send, {CtrlUp}
	return

	;Distribute\ Horizontally 	Ctrl + Win + h
	^#h::
	RightClickAll(Step_RightClickAll_O, 0, 0, 1)
	return

	;Distribute\ Vertically		Ctrl + Win + h
	^#v::
	RightClickAll(Step_RightClickAll_O, ApplyNoteType_O, 0, 2)
	return

	;split
	~LButton & k::
	Send, ^k
	RightClickAll(AutoFit, ApplyNoteType_O, Align_O, Distribute_O)
	return

	~LButton & 6::
	RightClickAll(AutoFit, 16, Align_O, Distribute_O)
	return

}

;*************************************************************************WINEXIST*******************************************************************
#IfWinExist ahk_exe Scapple.exe
{
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;Copy to Scapple
	F1:: ;press F1
	SetClipboard()
	Sleep, 50

	Load(Path_Scapple, Process_Scapple)

	Send ^{Enter} ;new note
	sleep, 200
	Send ^v ;paste
	Return

	;;;;;;;;;;;;;;;;;;;;;;;;;;;;***splitting a text into multiple sentences SCAPPLE***
	^!Tab:: ;press Ctrl+Alt+Tab

	SetClipboard()
	if ErrorLevel{
			Clipboard:=Clipback
			MsgBox, No text was sent to clipboard
			return
		}
	StringReplace, Clipboard, Clipboard, .`", `"., All
	StringReplace, Clipboard, Clipboard, .`), `)., All
	StringReplace, Clipboard , Clipboard , `r`n, %A_Space%, All
	separate := RegExReplace(Clipboard,"((?<!\w\.\w.)(?<![A-Z][a-z]\.)(?<=\.|\?)\s)","@@@`n")
	;~ MsgBox %separate%

	Load(Path_Scapple, Process_Scapple)

	for i, row in StrSplit(separate,"@@@`n"){
		data.= row 
		Clipboard:=data
		Send ^{Enter}
		send, ^v
		Sleep, 150
		Clipboard := Clipback
		data:=""
	}
	return


	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;***screenshort a PICTURE to SCapple***
	^!s:: ;press Ctrl+Alt+s
	ScreenShort()
	Load(Path_Scapple, Process_Scapple)
	Send, ^v
	return

}

; #IfWinExist
; ^!+\::
; Run, H:\MyHotKey\Lib_Autohotkey_VuDuchihi\Scapple AutoHotkey\ScappleSetupNoteStyle.ahk
; return

rightclick:
Send, +{F10}
return

#Include C:\Workspace\AutoHotKey\YT-Scapple-Notestyles\Lib.ahk