I_Icon = D:\Workspace\my_app\autohotkey\Icons\arena_bluestack.ico
IfExist, %I_Icon%
Menu, Tray, Icon, %I_Icon%

LControl & Space::
  WinActivate, BlueStacks
  WinWaitActive, BlueStacks
  ControlSend,,{Space},BlueStacks
return

LControl & Numpad4::
  PotPlayer_JumpBackward()
return

LControl & Numpad6::
  PotPlayer_JumpForward()
return

PotPlayer_JumpForward() ; Set for 5 seconds but seems to jump an arbitrary amount.
{
  ppct := ppctm()
  newtime := ppct+5000 ; Add 5 seconds to current time.
  SendMessage, 0x0400, 0x5005, newtime,, ahk_class PotPlayer64
}
PotPlayer_JumpBackward() ; Set for -5 seconds but seems to jump an arbitrary amount.
{
  ppct := ppctm()
  newtime := ppct-5000 ; Subract 5 seconds from current time.
  SendMessage, 0x0400, 0x5005,newtime,, ahk_class PotPlayer64
}
ppctm() ; Retrives the current possition in milliseconds
{
  SendMessage, 0x0400, 0x5004,,, ahk_class PotPlayer64
  Return, %ErrorLevel%
}