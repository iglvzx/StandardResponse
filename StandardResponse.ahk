; optimizations
#SingleInstance, Force
SetBatchLines, -1
SetWinDelay, -1
SetKeyDelay, -1
SetWorkingDir, %A_ScriptDir%

; global variabls
WinX =
WinY =
WinWidth =
WinHeight =

; tray icon menu setup
Menu, Tray, Icon, StandardResponse.ico
Menu, Tray, NoStandard
Menu, Tray, Tip, StandardResponse (c)2012 Israel Galvez
Menu, Tray, Add, &About, About
Menu, tray, Add, &Refresh, Refresh
Menu, Tray, Add, &Quit, Quit

; set the default path
DefaultPath := ""
IniRead, DefaultPath, StandardResponse.ini, Default, Path, %A_Space%
if (DefaultPath = "") ; if no settings found
{
	MsgBox, 52, StandardResponse, No settings found.`nDo you want to set a default path?
	IfMsgBox, Yes
	{
		FileSelectFile, DefaultPath, , %A_ScriptDir%, StandardResponse, Text Documents (*.txt)
	}
	else
	{
		DefaultPath := A_ScriptDir
	}
}
TrayTip, StandardResponse, Hotkey: Win + /

return

; subroutines

About:
	Run, https://github.com/iglvzx/StandardResponse
	return
	
Refresh:
	Reload

Quit:
	ExitApp
	
CenterDialog:
	IfWinNotExist, StandardResponse
	{
		return
	}
	SetTimer, CenterDialog, Off
	WinGetPos, , , MyWidth, MyHeight, StandardResponse
	WinMove, StandardResponse, , WinX + (WinWidth/2 - MyWidth/2), WinY + (WinHeight/2 - MyHeight/2)
	WinActivate, StandardResponse
	return

; hotkeys
#/:: ; Win  + /
	
	ClipboardBackup := ClipboardAll
	
	; get the active window's coordinates and dimensions
	WinGetPos, WinX, WinY, WinWidth, WinHeight, A
	
	; select a file
	SetTimer, CenterDialog, 50
	FileSelectFile, FilePath, , %DefaultPath%, StandardResponse, Text Documents (*.txt)
	if (ErrorLevel = 1) ; if no file is selected
	{
		SetTimer, CenterDialog, Off
		return
	}
	
	; read the file
	FileRead, FileText, %FilePath%
	if (ErrorLevel = 1) ; if the selected file is invalid
	{
		SetTimer, CenterDialog, 50
		StringReplace, RelPath, FilePath, %A_WorkingDir%
		MsgBox, 48, StandardResponse, File not found:`n%RelPath%
		SetTimer, CenterDialog, Off
		return
	}
	if (FileText = "") ; if the selected file is empty
	{
		SetTimer, CenterDialog, 50
		StringReplace, RelPath, FilePath, %A_WorkingDir%
		MsgBox, 48, StandardResponse, No text in file:`n%RelPath%
		SetTimer, CenterDialog, Off
		return
	}
	
	; copy the file's text to the clipboard
	Clipboard =
	Clipboard := Filetext
	ClipWait
	
	; paste the file's text
	SendInput, ^v
	Sleep, 100
	
	; restore the clipboard
	if (ClipboardBackup = "") ; if the clipboard was originally empty
	{
		; do nothing
	}
	else
	{
		Clipboard =
		Clipboard := ClipboardBackup
		ClipWait
		ClipboardBackup = ; free memory
	}
	
	return
