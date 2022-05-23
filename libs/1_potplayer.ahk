/*
	; PotPlayer Function Library
	; Original by Specter333
	; Modified by Delta

	; USAGE:
		; Press play on the player and after 1 second get the current time.
		Player := New PotPlayer()
		Player.Message("PLAY")
		Sleep, 1000
		MsgBox, % Player.GetTime()
		Return

		; Set the volume to 10% and toggle play state on the player.
		Player := New PotPlayer()
		Player.SetVol(10)
		Player.Message("PLAY_PAUSE")
		Return

		; Get the current state of the player.
		Player := New PotPlayer()
		MsgBox, % Player.Status()
		Return

	; NOTES:
		; Use one of the numbers from the commands below with the Instance.Message(MSG)
		; function to call commands not included in this library.
		; Use only the number or a string after CMD.
		; Example: the Open File function:
			; Player.Message(10158)								; Open a file with the player.
			; Player.Message("TOGGLE_OSD")						; Toggle the OSD of the player.
		; These commands use 0x0111 as the Msg parameter.
		Local CMD_PLAY				:= 20001
		Local CMD_PAUSE				:= 20000
		Local CMD_STOP				:= 20002
		Local CMD_PREVIOUS			:= 10123
		Local CMD_NEXT				:= 10124
		Local CMD_PLAY_PAUSE		:= 10014
		Local CMD_VOLUME_UP			:= 10035
		Local CMD_VOLUME_DOWN		:= 10036
		Local CMD_TOGGLE_MUTE		:= 10037
		Local CMD_TOGGLE_PLAYLIST	:= 10011
		Local CMD_TOGGLE_CONTROL	:= 10383
		Local CMD_OPEN_FILE			:= 10158
		Local CMD_TOGGLE_SUBS		:= 10126
		Local CMD_TOGGLE_OSD		:= 10351
		Local CMD_CAPTURE			:= 10224

		; These commands use 0x0400 as the Msg parameter
		Local POT_GET_VOLUME		:= 0x5000					; 0 ~ 100
		Local POT_SET_VOLUME		:= 0x5001					; 0 ~ 100
		Local POT_GET_TOTAL_TIME	:= 0x5002					; ms unit
		Local POT_GET_PROGRESS_TIME	:= 0x5003					; ms unit
		Local POT_GET_CURRENT_TIME	:= 0x5004					; ms unit
		Local POT_SET_CURRENT_TIME	:= 0x5005					; ms unit
		Local POT_GET_PLAY_STATUS	:= 0x5006					; -1:Stopped, 1:Paused, 2:Running
		Local POT_SET_PLAY_STATUS	:= 0x5007					; 0:Toggle, 1:Paused, 2:Running
		Local POT_SET_PLAY_ORDER	:= 0x5008					; 0:Prev, 1:Next
		Local POT_SET_PLAY_CLOSE	:= 0x5009
		Local POT_SEND_VIRTUAL_KEY	:= 0x5010					; Virtual Key(VK_UP, VK_DOWN....)
*/

Class PotPlayer {
	__New(Handle := "ahk_class PotPlayer") {
		If (DllCall("IsWindow", "Ptr", Handle)) {				; Check to see if the passed parameter is a handle or not.
			This.WindowHandle := "ahk_id " . Handle
		} Else {
			This.WindowHandle := WinExist(Handle)
		}
		If (This.WindowHandle == Null) {						; If This.WindowHandle is blank (somehow).
			Return, (False)
		}
		Return, (This)
	}

	Send(MsgValOrName)  {
		Static Names := {
		(LTrim Join
			"PLAY":				20001,
			"PAUSE":			20000,
			"STOP":				20002,
			"PREVIOUS":			10123,
			"NEXT":				10124,
			"PLAY_PAUSE":		10014,
			"VOLUME_UP":		10035,
			"VOLUME_DOWN":		10036,
			"TOGGLE_MUTE":		10037,
			"TOGGLE_PLAYLIST":	10011,
			"TOGGLE_CONTROL":	10383,
			"OPEN_FILE":		10158,
			"TOGGLE_SUBS":		10126,
			"TOGGLE_OSD":		10351,
			"CAPTURE":			10224
		)}

		Msg := ((Names.HasKey(MsgValOrName)) ? (Names[MsgValOrName]) : (MsgValOrName))
		SendMessage, 0x0111, Msg,,, % This.WindowHandle
		Return, (ErrorLevel)
	}

	GetVol() {
		SendMessage, 0x0400, 0x5000,,, % This.WindowHandle
		Return, (ErrorLevel)
	}

	SetVol(NewVol) {
		SendMessage, 0x0400, 0x5001, NewVol,, % This.WindowHandle
	}		
	
	GetTotalTime() {
		SendMessage, 0x0400, 0x5002,,, % This.WindowHandle
		PotPlayerTotalTime := ConvertMillisecToTime(ErrorLevel)
		Return, (PotPlayerTotalTime)
	}		

	GetTime(Convert := True) {
		SendMessage, 0x0400, 0x5004,,, % This.WindowHandle
		PotPlayerConvert := ConvertMillisecToTime(ErrorLevel)
		Return, ((Convert == True) ? (PotPlayerConvert) : (ErrorLevel))
	}

	SetTime(NewTime) {											; Value in milliseconds.
		SendMessage, 0x0400, 0x5005, NewTime,, % This.WindowHandle
	}

	JumpForward(Time := 5000) {									; Set for 5 seconds but seems to jump an arbitrary amount.
		PPCT := This.GetTime(False)
		NewTime := PPCT + Time									; Add 5 seconds to current time.
		SendMessage, 0x0400, 0x5005, NewTime,, % This.WindowHandle
	}

	JumpBackward(Time := 5000) {								; Set for -5 seconds but seems to jump an arbitrary amount.
		PPCT := This.GetTime(False)
		NEWTIME := PPCT - Time									; Subract 5 seconds from current time. 
		SendMessage, 0x0400, 0x5005, NEWTIME,, % This.WindowHandle
	}

	Status() {
		SendMessage, 0x0400, 0x5006,,, % This.WindowHandle
		Return, (ErrorLevel)
	}	
}

; External functions, used by PotPlayer class but can be replaced.
; This function provided by Odlanir.
ConvertMillisecToTime(MSec)  {
	Secs := Floor(Mod((MSec / 1000), 60))
	Mins := Floor(Mod((MSec / (1000 * 60)), 60))
	Hour := Floor(Mod((MSec / (1000 * 60 * 60)), 24))
	Return, (Format("{:02}:{:02}:{:02}", Hour, Mins, Secs))
}