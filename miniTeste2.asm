
jump main
str1: .string "/Portugal/Gana/Brasil/China/Espanha"
0
V2: 1 4 4 6 4

main: 	loco str1 
		push
		loco V2
		push
		loco 5
		push
		call pos_opcoes_string
		insp 3
		
.include "votarlib"
.include "funcoes"
halt
