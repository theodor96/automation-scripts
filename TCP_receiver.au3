Dim $iMainSocket = -1, $iSocket = -1
Dim $buffer = ""
Dim $bytes = -1
Dim $iRet = -1

TCPStartup()

$iMainSocket = TCPListen("127.0.0.1",50911)

While 1
    If $iSocket = -1 Then
        $iRet = TCPAccept($iMainSocket)
        If Not @error Then $iSocket = $iRet
    Else
        $buffer &= TCPRecv($iSocket,4096)
        If $bytes = -1 And StringInStr($buffer,",") Then
            $bytes = StringLeft($buffer,StringInStr($buffer,",")-1)
            $buffer = StringTrimLeft($buffer,StringInStr($buffer,","))
        Else
            SplashTextOn("Receive","Receiving ...",200,40)
            If StringLen($buffer) = $bytes Then
                SplashOff()
                $FileReceived = FileSaveDialog("File save",@desktopdir,"All (*.*)")
                ExitLoop
            EndIf
        EndIf
    EndIf
WEnd

FileDelete($FileReceived)
FileWrite($FileReceived,$buffer)

MsgBox(4096,"","Transfer Complete")

TCPShutdown()