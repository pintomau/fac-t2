jump main
.include "votarlib"
.include "funcoes"
halt

str1: .string "Testar a funcao n_opcoes_string: "
0
str2: .string "OK"
10
0
str3: .string "com erros!"
10
0
strT1: '/'
strT2: .string "/a/aa/aaaaa/aaaaa"
0
strT3: .string "//bbbb/"
0
strT4: .string "aaaaa"
0


main:   #loco str1
        #push
        #call imprime_str
        #insp 1

        call testafuncao
		jnze erro
        loco str2
        push
        call imprime_str
        insp 1
        halt

erro:   loco str3
        push
        call imprime_str
        insp 1
		halt



testafuncao:  loco strT1
              push
              call n_opcoes_string
              insp 1

              push
              loco 5
              subl 0
              insp 1
              jzer teste2
			  loco 1
			  retn
      
      teste2: loco strT2
              push
              call n_opcoes_string
              insp 1

              push
              loco 4
              subl 0
              insp 1
              jzer teste3
			  loco 1
			  retn

      teste3: loco strT3
              push
              call n_opcoes_string
              insp 1

              push
              loco 3
              subl 0
              insp 1
              jzer teste4
			  loco 1
			  retn
			  
      teste4: loco strT4
              push
              call n_opcoes_string
              insp 1

              jzer teste5
			  loco 1
			  retn
      teste5: loco 0
              retn