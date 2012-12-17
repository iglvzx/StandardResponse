#StandardResponse
The universal [canned response](http://en.wikipedia.org/wiki/Canned_response) tool.&trade;

##About

- StandardResponse is a productivity application written in [AutoHokey_L](http://l.autohotkey.net/).
- StandardResponse allows you to quickly copy and paste text files, saving you time and energy!
- StandardResponse is universal. Use canned responses with **any** application or window that allows you to paste text using <kbd>Ctrl</kbd>**+**<kbd>V</kbd>!

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
- Have the file select dialog appear in the center of the active window.
- Add the ability to define keywords using **StandardResponse.ini** that expand to paste the given text/file.
- Add the ability to define the keyboard shortcut through **StandardResponse.ini**.

##FAQs
- **Will StandardResponse replace the contents of my clipboard?**<br> Only temporarily. StandardResponse saves a backup of the clipboard (text, images, etc) and then restores the clipboard after it is done copying and pasting a canned response.

##System Requirements
- Windows XP, Windows Vista, or Windows 7

##License

[GNU General Public License v3.0](http://www.gnu.org/licenses/gpl-3.0.html)

##Copyright

&copy;2012 Israel Galvez. All rights reserved.
