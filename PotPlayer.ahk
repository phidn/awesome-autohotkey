I_Icon = C:\Workspace\AutoHotKey\Icons\pot.ico
IfExist, %I_Icon%
Menu, Tray, Icon, %I_Icon%

^Numpad5::
  SendMessage,0x0111,20001,,,ahk_class PotPlayer64
return

^Numpad4::
  PotPlayer_JumpBackward()
return

^Numpad6::
  PotPlayer_JumpForward()
return

^Numpad8::
  SendMessage,0x0111,20001,,,ahk_class PotPlayer64
  PotPlayer_CopySubtile()
return

PotPlayer_JumpForward(Time := 15000)
{
  PPCT := GetTime(False)
  NewTime := PPCT + Time
  SendMessage, 0x0400, 0x5005, NewTime,, ahk_class PotPlayer64
}

PotPlayer_JumpBackward(Time := 15000)
{
  PPCT := GetTime(False)
  NewTime := PPCT - Time
  SendMessage, 0x0400, 0x5005, NewTime,, ahk_class PotPlayer64
}

GetTime(Convert := True) {
  SendMessage, 0x0400, 0x5004,,, ahk_class PotPlayer64
  PotPlayerConvert := ConvertMillisecToTime(ErrorLevel)
  Return, ((Convert == True) ? (PotPlayerConvert) : (ErrorLevel))
}

ConvertMillisecToTime(MSec)  {
	Secs := Floor(Mod((MSec / 1000), 60))
	Mins := Floor(Mod((MSec / (1000 * 60)), 60))
	Hour := Floor(Mod((MSec / (1000 * 60 * 60)), 24))
	Return, (Format("{:02}:{:02}:{:02}", Hour, Mins, Secs))
}

PotPlayer_CopySubtile()
{
  WinActivate, ahk_class PotPlayer64
  WinWaitActive, ahk_class PotPlayer64
  Send, ^c
  Send, {ALT DOWN}{TAB}{ALT UP}
}
