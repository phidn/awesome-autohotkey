I_Icon = D:\AutoHotKey\Icons\chrome_16650.ico
IfExist, %I_Icon%
Menu, Tray, Icon, %I_Icon%

LControl & Numpad5::
{
    WinGet, currentWinID, ID, A  ; Lưu ID của cửa sổ hiện tại
    WinGet, id, list, ahk_class Chrome_WidgetWin_1  ; Lấy danh sách cửa sổ Chrome
    Loop, %id%
    {
        this_id := id%A_Index%
        WinGetTitle, title, ahk_id %this_id%
        if InStr(title, "Awesome Player")  ; Kiểm tra xem tiêu đề có chứa từ "Player" không
        {
            WinActivate, ahk_id %this_id%  ; Kích hoạt cửa sổ chứa từ "Player"
            ControlSend, , {Space}, ahk_id %this_id%  ; Gửi phím Space để dừng hoặc bắt đầu video
            WinActivate, ahk_id %currentWinID%  ; Quay lại cửa sổ ban đầu
            return
        }
    }
}  

LControl & Numpad4::
    WinGet, currentWinID, ID, A  ; Lưu ID của cửa sổ hiện tại
    WinGet, id, list, ahk_class Chrome_WidgetWin_1  ; Lấy danh sách cửa sổ Chrome
    Loop, %id%
    {
        this_id := id%A_Index%
        WinGetTitle, title, ahk_id %this_id%
        if InStr(title, "Awesome Player")  ; Kiểm tra xem tiêu đề có chứa từ "Player" không
        {
            WinActivate, ahk_id %this_id%  ; Kích hoạt cửa sổ chứa từ "Player"
            ControlSend, , {NumpadLeft}, ahk_id %this_id%  ; Gửi phím Space để dừng hoặc bắt đầu video
            WinActivate, ahk_id %currentWinID%  ; Quay lại cửa sổ ban đầu
            return
        }
    }
return

LControl & Numpad6::
    WinGet, currentWinID, ID, A  ; Lưu ID của cửa sổ hiện tại
    WinGet, id, list, ahk_class Chrome_WidgetWin_1  ; Lấy danh sách cửa sổ Chrome
    Loop, %id%
    {
        this_id := id%A_Index%
        WinGetTitle, title, ahk_id %this_id%
        if InStr(title, "Awesome Player")  ; Kiểm tra xem tiêu đề có chứa từ "Player" không
        {
            WinActivate, ahk_id %this_id%  ; Kích hoạt cửa sổ chứa từ "Player"
            ControlSend, , {NumpadRight}, ahk_id %this_id%  ; Gửi phím Space để dừng hoặc bắt đầu video
            WinActivate, ahk_id %currentWinID%  ; Quay lại cửa sổ ban đầu
            return
        }
    }
return