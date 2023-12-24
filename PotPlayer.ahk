I_Icon = D:\AutoHotKey\Icons\pot.ico
IfExist, %I_Icon%
  Menu, Tray, Icon, %I_Icon%

^Numpad5::
  SendMessage,0x0111,20001,,,ahk_class PotPlayer64
return

^Numpad4::
  JumpBackward(10000)
return

^Numpad6::
  JumpForward(10000)
return

^Numpad8::
  CopySubtileToQTranslate()
return

CopySubtileToQTranslate()
{
  WinActivate, ahk_class PotPlayer64
  WinWaitActive, ahk_class PotPlayer64
  Send, ^c
  WinActivate, ahk_exe QTranslate.exe
  WinWaitActive, ahk_exe QTranslate.exe
  Clipboard := RegExReplace(Clipboard,"\r\n"," ")
  Send, !q
}

JumpForward(Time := 15000)
{
  PPCT := GetTime(False)
  NewTime := PPCT + Time
  SendMessage, 0x0400, 0x5005, NewTime,, ahk_class PotPlayer64
}

JumpBackward(Time := 15000)
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

ConvertMillisecToTime(MSec) {
  Secs := Floor(Mod((MSec / 1000), 60))
  Mins := Floor(Mod((MSec / (1000 * 60)), 60))
  Hour := Floor(Mod((MSec / (1000 * 60 * 60)), 24))
Return, (Format("{:02}:{:02}:{:02}", Hour, Mins, Secs))
}
