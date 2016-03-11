sleep(1500)

func ex()
   send('{f5}')
   Exit
EndFunc
HotKeySet("{esc}", "ex")

AutoItSetOption("SendKeyDelay", 0)

$i = 0
AutoItSetOption("SendKeyDownDelay", 100)
Do
   send('{space}')
   $i = $i+1
Until $i>66

$i = 0
AutoItSetOption("SendKeyDownDelay", 403);416
Do
   send('{space}')
   $i = $i+1
Until $i>11;11

$i = 0
AutoItSetOption("SendKeyDownDelay", 695);699
Do
   send('{space}')
   $i = $i+1
Until $i>6

$i = 0
AutoItSetOption("SendKeyDownDelay", 778);776
Do
   send('{space}')
   $i = $i+1
Until $i>7

$i = 0
AutoItSetOption("SendKeyDownDelay", 950)
Do
   send('{space}')
   $i = $i+1
Until $i>2