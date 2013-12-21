jump main

V1: 2 2 2 2 2 2 2 2 2 2  # 20
V2: 0 0 0 0 0 0 0 0 0 0

main:
    loco  V1
    push
    loco V2
    push
    loco 10
    push
    call calcular_resultados
    insp 3
		
.include "votarlib"
.include "funcoes"
halt
