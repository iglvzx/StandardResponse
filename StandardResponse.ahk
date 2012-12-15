; Optimizations
#SingleInstance, Force
SetBatchLines, -1
SetWinDelay, -1

; Hotkeys
#/:: ; Win  + /
	
	ClipboardBackup := Clipboard
	WinGet, Window, ID, A
	
	; Select and read file
	FileSelectFile, FilePath, 1
	FileRead, FileText, %FilePath%
	
	; Copy file text to clipboard
	Clipboard =
	Clipboard := Filetext
	ClipWait
	
	; Paste file text
	WinActivate, ahk_id %Window%
	SendInput, ^v
	Sleep, 100
	
	; Restore clipboard
	Clipboard =
	Clipboard := ClipboardBackup
	ClipWait
	
	return
