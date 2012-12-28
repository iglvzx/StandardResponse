; optimizations ----------------------------------------------------------------
#SingleInstance, Force
SetBatchLines, -1
SetWinDelay, -1
SetKeyDelay, -1
SetWorkingDir, %A_ScriptDir%
#Include, %A_ScriptDir%

; tray icon menu setup ---------------------------------------------------------
Menu, Tray, Icon, StandardResponse.ico
Menu, Tray, NoStandard
Menu, Tray, Tip, StandardResponse (c)2012 Israel Galvez
Menu, Tray, Add, &About, About
Menu, tray, Add, &Refresh, Refresh
Menu, Tray, Add, &Quit, Quit

; set the default path ---------------------------------------------------------
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


; subroutines ------------------------------------------------------------------
About:
	Run, https://github.com/iglvzx/StandardResponse
	return
	
Refresh:
	Reload

Quit:
	ExitApp

; hotkeys ----------------------------------------------------------------------
#/:: ; Win  + /

	KeyWait, LWin
	KeyWait, RWin
	KeyWait, /
	
	ClipboardBackup := ClipboardAll
	
	; select a file
	FileSelectFile, FilePath, , %DefaultPath%, StandardResponse, Text Documents (*.txt)
	if (ErrorLevel = 1) ; if no file is selected
	{
		return
	}
	
	; read the file
	FileRead, FileText, %FilePath%
	if (ErrorLevel = 1) ; if the selected file is invalid
	{
		StringReplace, RelPath, FilePath, %A_WorkingDir%
		MsgBox, 48, StandardResponse, File not found:`n%RelPath%
		return
	}
	if (FileText = "") ; if the selected file is empty
	{
		StringReplace, RelPath, FilePath, %A_WorkingDir%
		MsgBox, 48, StandardResponse, No text in file:`n%RelPath%
		return
	}
	
	; type file contents, line by line
	Loop, Parse, FileText, `n, `r
	{
		SendInput, {Raw}%A_LoopField%
		SendInput,`n
	}
	
	return
