func bye()
   Exit
EndFunc
HotKeySet("{esc}", "bye")

sleep(3000)
while 1
   Send("<ding>")
   Send("{enter}")
   sleep(334)
WEnd