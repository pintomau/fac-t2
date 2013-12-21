jump main

V1: 0 0 0 0 0

main:
    loco  V1
    push
    loco 5
    push
    call nova_ordenacao
    insp 2
		
.include "votarlib"
.include "funcoes"
halt
