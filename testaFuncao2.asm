jump main
strT1: .string "/aa"
0
strT2: .string "/aa/a/aaaaa/a"
0
strT3: .string "/a/a/a/a/a/a/a"
0
V1: 1000 1001 
V2: 1002 1003 1004 1005 1006 1007 1008 1009 
V3: 1010 1011 1012 1013 1014 1015 1016 1017 1018
V4: 1019 1020 1021 1022

str1: .string "Testar a funcao pos_opcoes_string: "
0
str2: .string "OK"
10
0
str3: .string "com erros!"
10
0

VT: 1000 1001 6 9 11 17 1006 1007 1008 1009 20 22 24 26 28 30 32 1017 1018 2 1020 1021 1022
main:   #loco str1
        #push
        #call imprime_str
        #insp 1
		
        loco  strT1
        push
        loco V4
        push
        loco 1
        push
        call pos_opcoes_string
        insp 3
		
        loco  strT2
        push
        loco V2
        push
        loco 4
        push
        call pos_opcoes_string
        insp 3

        loco  strT3
        push
        loco V3
        push
        loco 7
        push
        call pos_opcoes_string
        insp 3

		loco 0
		push
		loco V1
		push
		loco VT
		push
cicloTeste: loco 23  # numero de posicoes a testar
            subl 2
            jzer semerro
            lodl 1
            pshi
            lodl 1
            pshi
            pop
            subl 0
            insp 1
            jnze comerro
            incl 0
            incl 1
            incl 2
            jump cicloTeste
            
semerro:  insp 3
          loco str2
		  push
		  call imprime_str
		  insp 1
		  halt 
comerro:  insp 3
          loco str3
		  push
		  call imprime_str
		  insp 1
		  halt           		


              
.include "votarlib"
.include "funcoes"
halt
