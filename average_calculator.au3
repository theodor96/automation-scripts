;Finds the average of numbers specified by a user.
;The numbers must be delimited by commas.
#NoTrayIcon
#include <GUIConstantsEx.au3>
#include <Array.au3>
 
#region;-------------------GUI-----------------------
$form = GUICreate("Average Finder", 300, 100)
$label = GUICtrlCreateLabel("Enter the numbers to be averaged separated by commas", 19, 0)
$textbox = GUICtrlCreateInput("", 20, 20, 220)
$label1 = GUICtrlCreateLabel("=", 245, 20, 30, 20)
$ansLabel = GUICtrlCreateLabel("", 255, 20, 50, 20)
$button = GUICtrlCreateButton("Find Average", 100, 40)
GUISetState()
#endregion;---------------END GUI-----------------------
 
While 1
	$msg = GUIGetMsg()
	Switch $msg
		Case $GUI_EVENT_CLOSE
			Exit
		Case $button
			$answer = _findAvg(GUICtrlRead($textbox))
			If $answer Then
				GUICtrlSetData($ansLabel,$answer)
			Else
				GUICtrlSetData($ansLabel,"Error. Malformed input.")
			EndIf
	EndSwitch
WEnd
 
Func _findAvg($nums)
	Local $sData
	Local $ans
	;Clean up input ----------------->
	$chk = StringRight($nums, 5)
	If $chk = "," Then $nums = StringTrimRight($nums, 1)
	If StringInStr($nums, ",") < 1 Then
		Return False
	EndIf
	;---------------------------------->
	$sData = StringSplit($nums, ",")
	$ans = 0
	For $i = 1 To $sData[0]
		$ans += $sData[$i]
	Next
	$ans = $ans / $sData[0]
	Return floor($ans)
EndFunc   ;==>_findAvg