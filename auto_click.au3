;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;    Copyright Ⓒ 2014 -- G. Th. Șerbana    ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

#include <IE.au3>
#include <Date.au3>
#include <TrayConstants.au3>
#include <MsgBoxConstants.au3>

;;;;;;;;;;;;;;;;;;;;;
;    Global Code    ;
;;;;;;;;;;;;;;;;;;;;;

HotKeySet('!{esc}', 'terminate')
HotKeySet('^{TAB}', 'toggleVisibility')
OnAutoItExitRegister('onProgramShutDown')
Global $beginTime = @YEAR & '/' & @MON & '/' & @MDAY & ' ' & @HOUR & ':' & @MIN & ':' & @SEC
Global $clickCount = _DateDiff('s', "1970/01/01 00:00:00", _NowCalc())
Global $keepTrackOf = $clickCount
Global $oIE = false
AutoClickBegin(getUrl() & getRandomString())

;;;;;;;;;;;;;;;;;;;;;
;     Functions	    ;
;;;;;;;;;;;;;;;;;;;;;

; shows/hides the iexplore window (if it exists) (Ctrl+Tab combination)
;
Func toggleVisibility()
	If $oIE <> false Then
		Local $hWnd = _IEPropertyGet($oIE, 'hwnd')
		If BitAND(WinGetState($hWnd), 2) Then ;window is visible, make it invisible
			WinSetState($hWnd, '', @SW_MINIMIZE)
			WinSetState($hWnd, '', @SW_HIDE)
		Else ;make it visible
			WinSetState($hWnd, '', @SW_SHOW)
			WinSetState($hWnd, '', @SW_RESTORE)
		EndIf
	EndIf
EndFunc			

; exit the program by user request (Alt+Esc combination)
;
Func terminate()
	If MsgBox($MB_YESNO + $MB_ICONQUESTION, 'AutoClick', 'Are you sure you want to exit?') = $IDYES Then
		Exit
	EndIf
EndFunc

; @param $sec - receives a number of seconds and returns the time in words
;
Func getTimeFromSeconds($sec)
	If $sec < 60 Then
		Return $sec & ' second(s)'
	EndIf
	
	If $sec < 3600 Then
		Return Int($sec / 60) & ' minute(s) and ' & Mod($sec, 60) & ' second(s)'
	EndIf
	
	Return Int($sec / 3600) & ' hour(s) and ' & Int(Mod($sec, 3600) / 60) & ' minute(s)'
EndFunc

; give info & statistics (only if we have done work) then clear whatever resource might be used
;
Func onProgramShutDown()
	Local $diff = $clickCount - $keepTrackOf
	If $oIE <> false Or $diff <> 0 Then
		TrayTip('AutoClick', 'Terminating the program...', 5, $TIP_ICONASTERISK)
		MsgBox($MB_ICONINFORMATION, 'AutoClick', 'Clicks generated: ' & $diff & @CRLF & 'Runtime: ' & getTimeFromSeconds(_DateDiff('s', $beginTime, _NowCalc())) & @CRLF & @CRLF & 'Thank you for using this software.' & @CRLF & 'If it helped you, then please consider donating.' & @CRLF & 'PayPal e-mail: tedy_096@yahoo.com')
	EndIf
	_IEQuit($oIE)
EndFunc

; show input textbox for url
;
Func getUrl()
	Local $inputUrl = InputBox('AutoClick', 'Alt+Esc = Exit' & @CRLF & 'Ctrl+Tab = Toggle IE visiblity' & @CRLF & 'Dev contact: tedy_096@yahoo.com' & @CRLF & 'Copyright: 2014 Teddy aka pgmforever' & @CRLF & @CRLF & 'Please enter your URL', 'http://www.buxvertise.com/icon.php?i=4096')
	
	If @error <> 0 Then
		Exit
	EndIf
	
	If _IsValidURL($inputUrl) <> 1 Then
		If MsgBox($MB_RETRYCANCEL + $MB_ICONERROR, 'AutoClick', 'Error!' & @CRLF & @CRLF & 'The URL you have entered is invalid') = $IDRETRY Then
			Return getUrl()
		EndIf
		Exit 
	EndIf
	
	Return $inputUrl
EndFunc

; generate a random string of a random length
;
Func getRandomString()
    Local $text = ""
    For $i = 1 To Random(5, 20, 1) ; Return an integer between 5 and 20 to determine the length of the string.
        $text &= Chr(Random(97, 122, 1)) ; Return an integer between 65 and 122 which represent the ASCII characters between a-z lowercase
    Next
	Return $text
EndFunc

;validate an url
Func _IsValidURL($sPath)
    Local Const $sRet = DllCall('Shlwapi.dll', 'BOOL', 'PathIsURL', 'str', $sPath)
    Return $sRet[0]
EndFunc

; begin the actual clicking
;
Func AutoClickBegin($url, $restart = false)
	If $restart = true Then
		$oIE = _IECreate('about: blank', 0, 0)
		Local $hWnd = _IEPropertyGet($oIE, 'hwnd')
		WinSetState($hWnd, '', @SW_MINIMIZE)
	Else
		$oIE = _IECreate('about:blank', 0, (MsgBox($MB_YESNO + $MB_ICONQUESTION, 'AutoClick', 'Do you want IE to start invisible?') = $IDYES) ? 0 : 1)
		TrayTip('AutoClick', 'Starting the program...' & @CRLF & @CRLF & 'URL: ' & $url, 5, $TIP_ICONASTERISK)
	EndIf
	
	While (true)
		_IENavigate($oIE, $url & $clickCount)
		Local $button = _IEGetObjByName($oIE, 'click')
		
		If @error <> 0 Then
			TrayTip('AutoClick', 'Server is down or URL is incorrect... retrying in 10 sec' & @CRLF & @CRLF & 'URL: ' & $url, 5, $TIP_ICONASTERISK)
			_IEQuit($oIE)
			$oIE = true
			Sleep(10000)
			AutoClickBegin($url, true)
		EndIf
		
		_IEAction($button, 'click')
		_IELoadWait($oIE)

		$clickCount = $clickCount + 1
	WEnd
EndFunc

