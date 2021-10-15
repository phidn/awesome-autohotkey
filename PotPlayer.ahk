I_Icon = C:\Workspace\AutoHotKey\Icons\MindMixPot-phidndev.ico
IfExist, %I_Icon%
Menu, Tray, Icon, %I_Icon%
;return

^Space::
IfWinActive, ahk_class MindManager21WndClass 
{
  IfWinNotActive, ahk_class PotPlayer64 
  {
    WinActivate, ahk_class PotPlayer64
    WinWaitActive, ahk_class PotPlayer64
    ControlSend,,{Space},ahk_class PotPlayer64

    WinActivate, ahk_class MindManager21WndClass
  }
}
return

^Numpad4::
IfWinActive, ahk_class MindManager21WndClass 
{
  IfWinNotActive, ahk_class PotPlayer64 
  {
    WinActivate, ahk_class PotPlayer64
    WinWaitActive, ahk_class PotPlayer64
    ControlSend,,{Left},ahk_class PotPlayer64

    WinActivate, ahk_class MindManager21WndClass
  }
}
return

^Numpad6::
IfWinActive, ahk_class MindManager21WndClass 
{
  IfWinNotActive, ahk_class PotPlayer64 
  {
    WinActivate, ahk_class PotPlayer64
    WinWaitActive, ahk_class PotPlayer64
    ControlSend,,{Right},ahk_class PotPlayer64

    WinActivate, ahk_class MindManager21WndClass
  }
}
return

