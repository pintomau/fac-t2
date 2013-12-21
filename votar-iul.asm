#######################################################
#     Interface da aplica��o
#######################################################
jump main

# num_opcoes_votacao: 0 

str_escolha_opcao: .string "Escolha uma op��o :"
10
0

str_new_line:
10
0
	
v_posicoes_voto:    0 0 0 0 0 0 0 0 
v_votos:            0 0 0 0 0 0 0 0 
v_ordem_opcoes:     0 0 0 0 0 0 0 0 
v_resultados:       0 0 0 0 0 0 0 0 

main:
	loco str_opcoes_votacao
	push
	call n_opcoes_string # inicializar n� op��es de voto 
	insp 1
    
    
    push    # guardar n�mero de op��es na stack
	call imprime_num
		
	
		
	loco str_opcoes_votacao
	push
	loco v_posicoes_voto
	push
	lodl 2  # n� votacoes
    push
	call pos_opcoes_string
	insp 3
	
	#loco str_escolha_opcao # mostrar menu principal 
	#push
	#call imprime_str
	#insp 1
	
	loco str_opcoes_votacao # substituir '/' por 0
	push
	loco '/'
	push
	loco 0
	push
	call subs_string
	insp 3
	
	loco v_posicoes_voto
	push
    lodl 1
    push    # carrega n� opcoes para argumento
	call imprime_opcoes
	insp 2
	
	
.include "votacao"
.include "votarlib"
.include "funcoes"
halt


imprime_opcoes:
    
    # STACK
    # 0 - n� opcoes
    # 1 - opcoes
    # 2 - end. retorno
    # 3 - n� opcoes
    # 4 - opcoes
    
    lodl 2
    push    # opcoes
    lodl 2
    push    # n� opcoes

imprime_opcoes_ciclo:

    lodl 0
    jzer imprime_opcoes_ciclo_end
    
        lodl 1
        pshi
        call imprime_str
        
        loco str_new_line
        push
        call imprime_str
        
        insp 2
        
        incl 1
        decl 0

    jump imprime_opcoes_ciclo

imprime_opcoes_ciclo_end:
    insp 2
    retn