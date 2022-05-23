#NoEnv  
SendMode Input
SetWorkingDir, %A_ScriptDir%
#SingleInstance, Force
SetTitleMatchMode, 2 ;important ;if write "regex", it won't run Scapple



; WinTitle_GoldenDict:="GoldenDict$ ahk_exe GoldenDict.exe"
; WinTitle_Glosbe:= "Glosbe ahk_exe chrome.exe"
; WinTitle_WordInformation:= "Word Information ahk_exe msedge.exe"
; WinTitle_Image := "Firefox ahk_exe firefox.exe"
; WinTitle_FoxitReader := "Foxit Reader$ ahk_exe FoxitReader.exe"

;~ FoxitReader
;~ GoldenDict
;~ Scapple



LoadandMove(Path, WinTitle, X, Y, W, H)
{
  IfWinExist, %WinTitle%
  {  
    WinActivate, %WinTitle%
  }
  else
  {
    Run, %Path%
  }
  WinWaitActive, %WinTitle%,, 10
  WinMove, %WinTitle%,, %X%, %Y%, %W%, %H%
}

WinTitle_GoldenDict:="GoldenDict"
WinTitle_Glosbe:= "Glosbe"
WinTitle_WordInformation:= "Word Information"
WinTitle_Image := "Firefox"
WinTitle_FoxitReader := "Foxit Reader"

path_WordInformation:= "msedge.exe https://wordinfo.info/results?searchString=a"
path_Image:= "firefox.exe https://www.google.com.vn/search?q=a&tbm=isch"
path_Glosbe:= "chrome.exe https://glosbe.com/en/vi/a"
path_FoxitReader:= "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Foxit Reader\Foxit Reader.lnk" ;pathfoxitreader
path_GoldenDict:= "H:\GoldenDict-1.5.0-RC2-372-gc3ff15f_(QT_5123)(64bit)\GoldenDict\GoldenDict.exe" ;pathgoldendict

LoadandMove(path_Image, WinTitle_Image, 71, 540, 935, 547)
LoadandMove(path_Image, WinTitle_Image, 71, 540, 935, 547)
LoadandMove(path_WordInformation, WinTitle_WordInformation, 1975, 326, 666, 775)
LoadandMove(path_WordInformation, WinTitle_WordInformation, 1975, 326, 666, 775)
LoadandMove(path_FoxitReader, WinTitle_FoxitReader, 78, 0, 921, 540)
LoadandMove(path_GoldenDict, WinTitle_GoldenDict, 992, 0, 935, 1087)
LoadandMove(path_Glosbe, WinTitle_Glosbe, 2627, 326, 666, 775)





Activate_Scapple(){
    If WinExist("ahk_exe Scapple.exe")
    {
        WinActivate, ahk_exe Scapple.exe
        WinWaitActive, ahk_exe Scapple.exe
    }
    else
    {
        Run, C:\Program Files (x86)\Scapple\scapple.exe ;pathscapple
        WinActivate, ahk_exe Scapple.exe
        WinWaitActive, ahk_exe Scapple.exe
        Sleep, 2000
        ; MsgBox a1
    }
}

Scapple_Word(){
    Send ^{Enter 1}
    Send ^v   
}

Scapple_Image(){
    Send ^d
	KeyWait, d, L
    ; MsgBox, before paste image
    Send ^v
    Sleep, 100
}


Activate_GoldenDict(){
    If WinExist("ahk_exe GoldenDict.exe")
    {
        WinActivate, ahk_exe GoldenDict.exe
        WinWaitActive, ahk_exe GoldenDict.exe
    }	
    else
    {
        
        Run, H:\GoldenDict-1.5.0-RC2-372-gc3ff15f_(QT_5123)(64bit)\GoldenDict\GoldenDict.exe ;pathgoldendict
        WinActivate, ahk_exe GoldenDict.exe
        WinWaitActive, ahk_exe GoldenDict.exe
        
    }
}

GoldenDict_LookUp(){
    Send ^l
    Sleep 20
    SendInput ^v
    KeyWait, v, L
    Send {Enter}
}

SetClipboard(){
    Clipback := ClipboardAll
    Clipboard =
    Send ^c
    ClipWait,1
    Clipboard := StrReplace(Clipboard, "`r`n", " ")
}

SearchWordInforWeb(){
    ; IfWinExist, %Clipboard% - GoldenDict ahk_exe GoldenDict.exe
    Run, firefox.exe "https://www.google.com.vn/search?q=%Clipboard%&tbm=isch" ;ggImage
    Run, msedge.exe "https://wordinfo.info/results?searchString=%Clipboard%" ;wordinfor.com
    Run, chrome.exe "https://glosbe.com/en/vi/%Clipboard%" ;glosbe.com
    ; Run, chrome.exe "http://www.finedictionary.com/p/search.html?query=%Clipboard%" ;fineDictionary.com
    ; Run, "http://www.finedictionary.com/%Clipboard%.html" ;fineDictionary.com
    Return
}


SearchWordGoldendict(){
    Activate_GoldenDict()
    GoldenDict_LookUp()
    Return
}


WordtoScapple(){
    Activate_Scapple()
    Scapple_Word()
}

ImagetoClipboard(){
    Send #+s
    Clipboard :=
    KeyWait, LButton, D
    KeyWait, LButton
    ClipWait, 1
}


;~ Ctrl: ^
;~ Shift: +
;~ Alt: !
;~ WIn: #



^F4:: ;Look up Important Word Infor
    SetClipboard()
    Clipboard_Word := Clipboard
    SearchWordGoldendict()
    Sleep, 100 ;important
    SearchWordInforWeb()
Return

^F5:: 
    SetClipboard()
    Activate_Scapple()
    Sleep, 100 ;important
    Scapple_Word()
Return

^F1::
    ImagetoClipboard() ;Cut Image to Clipboard
    ; Sleep, 1500
    ; MsgBox a1
    Activate_Scapple() 
    Scapple_Image() ;Paste Image to Scapple
    ; MsgBox a2
    Clipboard := Clipboard_Word ;Attach word to picture
    Sleep, 100
    Send, !{Right 1}
    Sleep, 100
    Send, ^v
    Sleep, 100
    Send, !esc
Return


^F2:: ;LookUp Important Word + Image 
    SetClipboard()
    Clipboard_Word := Clipboard
    Run, firefox.exe "https://www.google.com.vn/search?q=%Clipboard%&tbm=isch" ;ggImage
Return

^F3:: ;Look Up UnImportant Word Infor
    SetClipboard()
    SearchWordGoldendict()
    Sleep, 100 ;important
    Run, firefox.exe "https://www.google.com.vn/search?q=%Clipboard%&tbm=isch"
    Run, chrome.exe "https://glosbe.com/en/vi/%Clipboard%"
Return













