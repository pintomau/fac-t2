# sp = Stack Pointer

#######################################################
#     Funcao: n_opcoes_string
# 
# Argumentos: endereco da string
#
# Devolve em AC: numero de opcoes de voto
#
# Descricao: Esta função deverá devolver o número de opções de voto existentes na
#            string A. Por exemplo, se a string for definida como
#            .string "Brasil/Portugal/Espanha", a função deverá devolver 3.
#
# Disposicao dos argumentos no stack: 
#         +----------------+
#  SP --> |  end. retorno  |
#         +----------------+ 
#         |  end string a  |
#         +----------------+
#
#######################################################

# Posicoes stack
# contador = 0
# caracter = 1
# end. retorno = 2
# end string a = 3

n_opcoes_string:

    # STACK
    # 0 - contador
    # 1 - caracter
    # 2 - end. retorno
    # 3 - end string a

    loco '/'
    push            # caracter limite
    loco 0
    push            # contador de opcoes

n_opcoes_ciclo:
    
    lodl 3          # ac = endA
    pshi            # (--sp) = m[ac]
    pop             # ac = m[sp++]
    jzer n_opcoes_end
    
        subl 1          # comparar com caracter
        incl 3          # incrementar ponteiro endA
    jnze n_opcoes_ciclo
    
        incl 0          # incrementar contador
    jump n_opcoes_ciclo

n_opcoes_end:
    lodl 0          # ac = contador
    insp 2          # limpar locais
    retn
    

#######################################################
#     Funcao: pos_opcoes_string
# 
# Argumentos: endereco string A, endereco vector B, n
#
# Devolve em AC: -
#
# Descricao:
#           Dada a string A, contendo as opções de votação, e o número n de opções,
#           a função deverá preencher o vector B com os endereços das posições de
#           memórias relativas a cada opção. Por exemplo, se a string A estiver
#           guardada a partir da posição de memória 1:
#           str_opcoes_votacao: .string "Brasil/Portugal/Espanha"
#           o vector B deverá conter os números 1, 8 e 17.
#
# Disposicao dos argumentos no stack:
#         +----------------+
#  SP --> |  end. retorno  |
#         +----------------+ 
#         |  end string a  | (endA)
#         +----------------+
#         |  end vector b  | (endB)
#         +----------------+
#         |        n       |
#         +----------------+
#
#######################################################

pos_opcoes_string:

    # STACK
    # 0 - caracter limite
    # 1 - end. ret
    # 2 - n
    # 3 - endB
    # 4 - endA

    loco '/'
    push        # caracter limite (cl)

pos_opcoes_ciclo:

    # while
    # n > 0
    lodl 2              # ac = n
    jzer pos_opcoes_end # sair quando opções esgotaram (n == 0)

        # str[endA] != 0
        lodl 4              # ac = endA
        pshi                # m[--sp] = m[ac]
        pop                 # AC = m[sp++]
    jzer pos_opcoes_end # sair quando str[endA] == 0
        incl 4                  # endA++

        # do
        # subtrair cl
        subl 0                  # ac = ac - '/'
    jnze pos_opcoes_ciclo   # ciclo seguinte se ac != '/'
        lodl 4                  # ac = endA
        push                    # (--sp) = ac
        #decl 0                  # m[sp]--
        lodl 4                  # ac = endB
        popi                    # m[ac] = m[sp]
        incl 3                  # endB++
        decl 2                  # n--
    jump pos_opcoes_ciclo

pos_opcoes_end:
    insp 1  # limpar caracter limite
    retn

    
    
#######################################################
#     Funcao: calcular_resultados
# 
# Argumentos: endereco vector A, endereco vector B, n
#
# Devolve em AC: -
#
# Descricao:
#           Esta função preenche o vector B com o resultado das votações em percentagem. O vector A contém a votação em cada uma das n opções.
#           O resultado da votação é arredondado às unidades (basta apresentar o
#           resultado da divisão inteira).
#
# Disposicao dos argumentos no stack:
#         +----------------+
#  SP --> |  end. retorno  |
#         +----------------+
#         |        n       |
#         +----------------+
#         |  end vector b  | (endB)
#         +----------------+
#         |  end string a  | (endA)
#         +----------------+
#
#######################################################

calcular_resultados: 
	
    # STACK
    # 0 - Contador
    # 1 - Nº Votos
    # 2 - Multiplicador 100
    # 3 - end. retorno
    # 4 - n (tamanho vector)
    # 5 - end. vetor b
    # 6 - end. vetor a
	
    loco 100 
    push
    loco 0  # Nº Votos
    push
    push    # contador

calcular_resultados_votos_ciclo:
	
    subl 4 # ac = contador - tamanho vector
    jzer calcular_resultados_multiplicador

        lodl 0
        addl 6  # ac = Posição actual do vector
        
        pshi
        pop     # ac = Votos na actual posição do vector
        
        addl 1  # ac += Nº Votos
        stol 1  # Guardar valor final
        
        incl 0  # Incrementar contador
        lodl 0
    
    jump calcular_resultados_votos_ciclo




calcular_resultados_multiplicador:

    loco 0
    stol 0 # Reiniciar contador

calcular_resultados_multiplicador_ciclo:

    subl 4 # ac = contador - tamanho vector
    jzer calcular_resultados_end
        
        lodl 0
        addl 6  # ac = Posição actual do vector a
        pshi
        pop     # ac = Votos na actual posição do vector
        
        mull 2  # Multiplicar votos por 100
        divl 1  # Dividir por número total de votos        
        push    # Guardar na Stack, SP + 1
        
        lodl 1  # ac = contador
        addl 6  # ac = Posição actual do vector b
        popi    # Guardar valor no vector B, SP - 1
        
        incl 0  # Incrementar contador
        lodl 0
    
    jump calcular_resultados_multiplicador_ciclo
        
	
calcular_resultados_end:
    insp 3
    retn

