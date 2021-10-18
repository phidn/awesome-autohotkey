; ahk_class PotPlayer64
LControl & Space::
  SendMessage,0x0111,20001,,,ahk_class PotPlayer64
return

LControl & Numpad4::
  PotPlayer_JumpBackward()
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