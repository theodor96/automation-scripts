#include<GUIConstants.au3>

GUICreate("Send",200,120)
$File = GUICtrlCreateInput("",10,10,100,20)
$fileopendialog = GUICtrlCreateButton(" ... ",120,10,40,20)
$serverinput = GUICtrlCreateInput("",10,40,100,20)
GUICtrlCreateLabel("Server-IP",120,40)
$ok = GUICtrlCreateButton(" Send ",40,80,40,20)
GUISetState()

While 1
    $msg = GUIGetMsg()

    If $msg = $GUI_EVENT_CLOSE Then
        Exit
    EndIf
    If $msg = $fileopendialog Then
        $Fileopen = FileOpenDialog("File open",@desktopdir,"All (*.*)")
        GUICtrlSetData($File,$Fileopen)
    EndIf
    If $msg = $ok Then
        Call("sendfile")
    EndIf
WEnd

Func sendfile()

Local $szConfirm = ""
Local $sock = -1
Local $data

$server = GUICtrlRead($serverinput)
$FileSent = GUICtrlRead($File)

TCPStartup()
$sock = TCPConnect($server,50911)
$data = FileRead($FileSent,FileGetSize($FileSent))
SplashTextOn("Send","Sending ...",200,40)
TCPSend($sock,FileGetSize($FileSent) & "," & $data)
SplashOff()
While 1
    $szConfirm = TCPRecv($sock,128)
    If @error Or StringLen($szConfirm) Then
        TCPShutdown()
        ExitLoop
    EndIf
WEnd

EndFunc