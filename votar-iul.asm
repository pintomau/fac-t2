#######################################################
#     Interface da aplica��o
#######################################################
jump main

str_escolha_opcao: .string "Escolha uma op��o :"
10
.string "1 - Votar"
10
.string "2 - Resultados"
10
.string "3 - Terminar"
0

str_resultados: .string "Resultados da Vota��o :"
0

str_new_line:
10
0

v_posicoes_voto: 0 0 0 0 0 0 0 0 
v_votos: 0 0 0 0 0 0 0 0 
v_ordem_opcoes: 0 0 0 0 0 0 0 0 
v_resultados: 0 0 0 0 0 0 0 0 

main:
	loco str_opcoes_votacao
	push
	call n_opcoes_string # inicializar n� op��es de voto 
	insp 1
    
    push    # guardar n�mero de op��es na stack
		
	loco str_opcoes_votacao
	push
	loco v_posicoes_voto
	push
	lodl 2  # n� votacoes
    push
	call pos_opcoes_string
	insp 3
	
	loco str_opcoes_votacao # substituir '/' por 0
	push
	loco '/'
	push
	loco 0
	push
	call subs_string
	insp 3	


menu_principal:	
	loco str_escolha_opcao # mostrar menu principal 
	push
	call imprime_str
	insp 1
	
	loco v_ordem_opcoes # popular vetor de ordena��o com os n�s de 0 a n-1 aleatoriamente
	push
	lodl 1
	push
	call nova_ordenacao
	insp 2

	lodd 4092 	#Pede Input menu principal
	push 	 	#coloca o input no SP		
		
	loco '3'
	subl 0	# ac = '3' - input
	jzer terminar # validar se � a op��o 3 - Terminar
		
		loco '2'
		subl 0 # ac = '2' - input
		jzer resultados # validar se � a op��o 2 - Resultados
			
			loco '1'
			subl 0	# ac = '1' - input
			jnze else # validar se � a op��o 1 - vota��o
				insp 1 # limpar o input da stack
		
				call print_nl
				call print_nl
		
				loco v_posicoes_voto
				pshi
				lodl 1
				push
				call imprime_opcoes
				insp 2
					
				# Incrementar Voto
				loco '1'  
				push
				lodd 4092  # input vota��o
				subl 0 # AC = input - 1
				insp 1
				
				push # AC = indice do vetor a aceder 
				
				loco v_ordem_opcoes
				addl 0
				pshi
				
				loco v_votos
				push
				lodl 1 	# indice do vetor a aceder
				push 	 	
				call inc_elemento_vector
				insp 4
				
				loco v_votos 	# Calcular resultados
				push
				loco v_resultados
				push
				lodl 2
				push
				call calcular_resultados 
				insp 3 	# Calcular resultados fim
				
				
				jump menu_principal # ap�s escolher op��o volta ao inicio
			else: 
				insp 1
				call print_nl
				call print_nl
				jump menu_principal # se n�o for nenhuma das 3 op��es
				
resultados: 
			call print_nl				
			call print_nl
			insp 1 # limpar o input da stack
			
			loco v_resultados
			pshi
			lodl 1 #AC = indice deo vetos
			push
			call imprime_resultados
			insp 2
				
			jump menu_principal 
				
print_nl:
    loco str_new_line
    push
    call imprime_str
    insp 1
    retn
	
print_space:	
	loco 1
	push
	call imprime_espacos
	insp 1
	retn

##############################
##	 Imprimir Op��es		##
##############################
imprime_opcoes:
    
	# STACK
	# 0 - 1 para incrementar a numera��o da linha
	# 1 - n� opcoes
	# 2 - opcoes
	# 3 - end. retorno
	# 4 - n� opcoes
	# 5 - opcoes
	
	loco 0 
	push    # opcoes
	lodl 2
	push    # n� opcoes
	loco 1
	push

	loco str_nome_votacao
	push
	call imprime_str
	insp 1 	
	call print_nl
		
imprime_opcoes_ciclo:

	lodl 1
	jzer imprime_opcoes_ciclo_end
	
		lodl 2 # imprime n� da op��o
		addl 0
		push
		call imprime_num
		insp 1
		
		call print_space
		
		loco '-'
		stod 4094
		
		call print_space
				
				
		loco v_ordem_opcoes
		addl 2 
		pshi
		
		loco v_posicoes_voto # imprime descricao da op��o
		addl 0 
		pshi
		call imprime_str
		insp 2		
		
		call print_nl
		
		incl 2
		decl 1

	jump imprime_opcoes_ciclo

imprime_opcoes_ciclo_end:
	insp 3
	call print_nl
	retn
		
##############################
##	 Imprimir Resultados	##
##############################
imprime_resultados:
    
	# STACK
	# 0 - n� opcoes
	# 1 - opcoes
	# 2 - end. retorno
	# 3 - n� opcoes
	# 4 - opcoes
	loco 0 
	push    # opcoes
	lodl 2
	push    # n� opcoes

	loco str_resultados # imprimir texto 
	push
	call imprime_str
	insp 1 	
	call print_nl
	
imprime_resultados_ciclo:

	lodl 0
	jzer imprime_resultados_ciclo_end
		
		loco v_posicoes_voto # imprime descricao da op��o
		addl 1 
		pshi
		call imprime_str
		insp 1	
		
		call print_space
		
		loco ':'
		stod 4094
		
		call print_space
			
		loco v_resultados 
		addl 1 
		pshi
		call imprime_num # imprime  resultado
		insp 1
		
		loco '%'
		stod 4094
		
		call print_nl
		
		incl 1
		decl 0

	jump imprime_resultados_ciclo

imprime_resultados_ciclo_end:
	insp 2
	call print_nl
	retn			
			
			
.include "votacao"
.include "votarlib"
.include "funcoes"

terminar:
insp 2
halt



