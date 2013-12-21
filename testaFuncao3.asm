jump main

V1: 0 0 0 0 0 0 0 0 0 0  
V2: 1 10 10 0 0 0 0 0 0 0 
V3: 2 2 2 2 2 2 2 2 0 0  
V4: 5 0 0 6 0 0 0 0 0 0  
V5: 0 0 0 0 0 0 0 0 0 0
V6: 0 0 0 0 0 0 0 0 0 0  
V7: 0 0 0 0 0 0 0 0 0 0 
V8: 0 0 0 0 0 0 0 0 0 0  
V9: 0 0 0 0 0 0 0 0 0 0 

str1: .string "Testar a funcao calcular_resultados: "
0
str2: .string "OK"
10
0
str3: .string "com erros!"
10
0

VT: 0 0 0 0 0 0 0 0 0 0 4 47 47 0 0 0 0 0 0 0 12 12 12 12 12 12 12 12 0 0 45  0 0 54 0 0 0 0 0 0 
main:   loco str1
        push
        call imprime_str
        insp 1
		
        loco  V2
        push
        loco V6
        push
        loco 3
        push
        call calcular_resultados
        insp 3

        loco V3
        push
        loco V7
        push
        loco 8
        push
        call calcular_resultados
        insp 3
		
        loco V4
        push
        loco V8
        push
        loco 4
        push
        call calcular_resultados
        insp 3
		



		loco 0
		push
		loco V5
		push
		loco VT
		push
cicloTeste: loco 40  # numero de posicoes a testar
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
