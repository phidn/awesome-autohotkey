SendControl(__Control)
{
  IfWinExist, ahk_class PotPlayer64
  {
    WinActivate, ahk_class PotPlayer64
    WinWaitActive, ahk_class PotPlayer64
    Switch __Control
    {
      Case "Space":
        ControlSend, , {Space}
      Case "Numpad4":
        ControlSend, , {Left}
      Case "Numpad6":
        ControlSend, , {Right}
    }
    IfWinExist, ahk_class MindManager21WndClass 
      WinActivate, ahk_class MindManager21WndClass
  }
}