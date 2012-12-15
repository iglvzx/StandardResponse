; optimizations
#SingleInstance, Force
SetBatchLines, -1
SetWinDelay, -1
SetKeyDelay, -1
SetWorkingDir, %A_ScriptDir%

DefaultPath = Text\Signature.txt

; hotkeys
#/:: ; Win  + /
	
	ClipboardBackup := ClipboardAll
	
	; select a file
	FileSelectFile, FilePath, , %DefaultPath%, , Text Documents (*.txt)
	if (ErrorLevel = 1) ; if no file is selected
	{
		return
	}
	
	; read the file
	FileRead, FileText, %FilePath%
	if (ErrorLevel = 1) ; if the selected file is invalid
	{
		StringReplace, RelPath, FilePath, %A_WorkingDir%
		MsgBox, 48, Error, File not found:`n%RelPath%
		return
	}
	if (FileText = "") ; if the selected file is empty
	{
		StringReplace, RelPath, FilePath, %A_WorkingDir%
		MsgBox, 48, Error, No text in file:`n%RelPath%
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
