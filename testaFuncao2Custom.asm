jump main

strT1: .string "/aa"
0

V1: 1000 1001

main:
    loco strT1
    push
    loco V1
    push
    loco 1
    push
    call pos_opcoes_string
    insp 3

    
.include "votarlib"
.include "funcoes"
halt