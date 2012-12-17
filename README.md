#StandardResponse

##About

StandardResponse is a productivity application written in [AutoHokey_L](http://l.autohotkey.net/). StandardResponse allows you to quickly copy and paste text files, saving you time and energy!

##Instructions
1. Press <kbd>Win</kbd>**+**<kbd>/</kbd> to open the file select dialog.
2. Select a file to open.
3. The file contents will be automatically pasted to the active window.

##StandardResponse.ini
This configuration file can be used to set the **default path**. The default path is the file that is automatically selected when the file select dialog is opened. The default path is relative to the location of **StandardResponse.exe**.

	[Default]
	Path=Text\Signature.txt
	
If no **StandardResponse.ini** exists or the contents are formatted incorrectly, StandardResponse will ask you to select a default path each time it is launched. If no default path is selected, the default path will be the folder where **StandardResponse.exe** is located.

##Roadmap
- Add the ability to define keywords using **StandardResponse.ini** that expand to paste the given text/file.

##System Requirements
- Windows XP, Windows Vista, or Windows 7

##License

[GNU General Public License v3.0](http://www.gnu.org/licenses/gpl-3.0.html)

##Copyright

&copy;2012 Israel Galvez. All rights reserved.
