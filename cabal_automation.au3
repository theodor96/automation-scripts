;; exit function keybounded on Esc
func exitProgram()
   Exit
EndFunc
HotKeySet("{esc}", "exitProgram")

;; give time to set up
sleep(5000)

;; start
While True
   send('{1}')
   sleep(2000)
   send('{2}')
   sleep(2000)
   send('{3}')
   sleep(2000)
   send('{space}{space}{space}{z}')
WEnd