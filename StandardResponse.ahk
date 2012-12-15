; Optimizations
#SingleInstance, Force
SetBatchLines, -1
SetWinDelay, -1
SetKeyDelay, -1
SetWorkingDir, %A_ScriptDir%

DefaultPath = Text\Signature.txt

; Hotkeys
#/:: ; Win  + /
	
	ClipboardBackup := ClipboardAll
	WinGet, Window, ID, A
	
	; Select file
	FileSelectFile, FilePath, , %DefaultPath%, , Text Documents (*.txt)
	
	; Read file
	FileRead, FileText, %FilePath%
	if (ErrorLevel = 1) ; if file selected is invalid
	{
		StringReplace, RelPath, FilePath, %A_WorkingDir%
		MsgBox, 48, Error, File not found:`n%RelPath%
		return
	}
	if (FileText = "")
	{
		StringReplace, RelPath, FilePath, %A_WorkingDir%
		MsgBox, 48, Error, No text in file:`n%RelPath%
		return
	}
	
	; Copy file text to clipboard
	Clipboard =
	Clipboard := Filetext
	ClipWait
	
	; Paste file text
	WinActivate, ahk_id %Window%
	SendInput, ^v
	Sleep, 100
	
	; Restore clipboard
	if (ClipboardBackup = "") ; if clipboard was originally empty
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
