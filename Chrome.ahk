I_Icon = C:\Workspace\AutoHotKey\Icons\chrome_16650.ico
IfExist, %I_Icon%
Menu, Tray, Icon, %I_Icon%


LControl & Numpad5::
  DetectHiddenWindows, on
  SetTitleMatchMode, 2
  ControlGet, controlID, Hwnd,,Chrome_RenderWidgetHostHWND1, Google Chrome
  ControlFocus,,ahk_id %controlID%
  ControlSend, Chrome_RenderWidgetHostHWND1, {space}, Google Chrome
return

LControl & Numpad4::
  DetectHiddenWindows, on
  SetTitleMatchMode, 2
  ControlGet, controlID, Hwnd,,Chrome_RenderWidgetHostHWND1, Google Chrome
  ControlFocus,,ahk_id %controlID%
  ControlSend, Chrome_RenderWidgetHostHWND1, {NumpadLeft}, Google Chrome
return

LControl & Numpad6::
  DetectHiddenWindows, on
  SetTitleMatchMode, 2
  ControlGet, controlID, Hwnd,,Chrome_RenderWidgetHostHWND1, Google Chrome
  ControlFocus,,ahk_id %controlID%
  ControlSend, Chrome_RenderWidgetHostHWND1, {NumpadRight}, Google Chrome
return