#######################################################
#  
#  Fundamentos de Arquitectura de Computadores
#  ISCTE-IUL - 2013
#
#######################################################
#  Ficheiro: masterbib.asm
# 
# Descricao: conjunto de funcoes para usar na resolucao
#            do programa votar-iul
# 
#      Data: 9 / 12 / 2013
#######################################################

#######################################################
#     Funcao: random_number
# 
# Argumentos: inteiro n
#
# Devolve em AC: um numero aleatorio entre 0 e n-1
#
# Disposicao dos argumentos no stack: 
#         +----------------+
#  SP --> |  end. retorno  |
#         +----------------+ 
#         |       n        |
#         +----------------+
#######################################################
random_number:  lodd 4093
                modl 1
                retn
	

#######################################################
#     Funcao: imprime_num
# 
# Argumentos: inteiro n
#
# Devolve em AC: um numero aleatorio entre 1 e n
#
# Descricao: Imprime no ecrã o número n usando c caracteres.
#            (funcao recursiva!) 
#
# Disposicao dos argumentos no stack: 
#         +----------------+
#  SP --> |  end. retorno  |
#         +----------------+ 
#         |       c        |
#         +----------------+
#         |       n        |
#         +----------------+
#######################################################
imprime_num:     loco -10
                 addl 1
                 jneg imprime_num_end
                 loco 10
                 push
                 lodl 2
                 divl 0
                 stol 0
                 call imprime_num
                 insp 1				
imprime_num_end: loco 10
                 push
                 lodl 2
                 modl 0
                 push
                 loco '0'
                 addl 0
                 insp 1
                 stod 4094
                 insp 1
                 retn


#######################################################
#     Funcao: imprime_espacos
# 
# Argumentos: inteiro n
#
# Devolve em AC: ---
#
# Descricao: imprime no ecra n espacos
#
# Disposicao dos argumentos no stack:  
#         +----------------+
#  SP --> |  end. retorno  |
#         +----------------+ 
#         |       n        |
#         +----------------+
#######################################################
imprime_espacos:    lodl 1
                    jzer fimimprimeespacos
                    loco ' '
                    stod 4094
                    decl 1
                    jump imprime_espacos		
fimimprimeespacos:  retn


#######################################################
#     Funcao: imprime_str
# 
# Argumentos: endereco da string
#
# Devolve em AC: ---
#
# Descricao: imprime no ecra uma string que comeca no
#            endereco especificado
#
# Disposicao dos argumentos no stack:  
#         +----------------+
#  SP --> |  end. retorno  |
#         +----------------+ 
#         |  end. string   |
#         +----------------+
#######################################################
imprime_str:        lodl 1
                    push  # faz uma copia de end. string 
cicloimprime_str:   lodl 0
                    pshi
                    pop
                    jzer fimimprimestr 
                    stod 4094
                    incl 0
                    jump cicloimprime_str		
fimimprimestr:      insp 1
                    retn

#######################################################
#     Funcao: subs_string
# 
# Argumentos: endereco da string, caracteres c1 e c2.
#
# Devolve em AC: ---
#
# Descricao: substitui todas as ocorrencias do caracter
#            c1 pelo caracter c2 na string.
#
# Disposicao dos argumentos no stack:
#         +----------------+
#  SP --> |  end. retorno  |
#         +----------------+ 
#         |       c2       |
#         +----------------+
#         |       c1       |
#         +----------------+
#         |  end. string   |
#         +----------------+
#######################################################
subs_string:          lodl 3
                      push
ciclo_subs_str:       lodl 0
                      pshi
                      pop
                      jzer fim_ciclo_subs_str				
                      subl 3
                      jnze ciclo_subs_str_cont
                      lodl 2
                      push
                      lodl 1
                      popi
ciclo_subs_str_cont:  incl 0
                      jump ciclo_subs_str
fim_ciclo_subs_str:	  insp 1
                      retn

#######################################################
#     Funcao: inc_elemento_vector
# 
# Argumentos: endereco do vector A, posicao i.
#
# Devolve em AC: ---
#
# Descricao: incrementa a posicao A[i] do vector.
#
# Disposicao dos argumentos no stack:
#         +----------------+
#  SP --> |  end. retorno  |
#         +----------------+ 
#         |       i        |
#         +----------------+
#         | end. vector A  |
#         +----------------+
#######################################################
inc_elemento_vector:  lodl 2
                      addl 1
                      pshi
                      incl 0
                      lodl 3
                      addl 2
                      popi
                      retn



#######################################################
#     Funcao: troca_elementos_vector
# 
# Argumentos: endereco do vector A, indices i e j
#
# Devolve em AC: ---
#
# Descricao: Troca o conteudo de A[i] com A[j].
#
# Disposicao dos argumentos no stack:
#         +----------------+
#  SP --> |  end. retorno  |
#         +----------------+ 
#         |       j        |
#         +----------------+
#         |       i        |
#         +----------------+
#         | end. vector A  |
#         +----------------+
#######################################################
troca_elementos_vector:	lodl 3
                        addl 2
                        pshi
                        lodl 4
                        addl 2
                        pshi
                        lodl 5
                        addl 4
                        popi
                        lodl 4
                        addl 2
                        popi
                        retn
