jump main

str1: 
10
.string "Testar a funcao nova_ordenacao: "
0
str2: .string "OK"
10
0
str3: .string "com erros!"
10
0

V1: 0 0 0 0 0 0 0 0 0 0

stat: 0 0 0 0 0 0 0 0
0 0 0 0 0 0 0 0
0 0 0 0 0 0 0 0
0 0 0 0 0 0 0 0
0 0 0 0 0 0 0 0
0 0 0 0 0 0 0 0
0 0 0 0 0 0 0 0
0 0 0 0 0 0 0 0

str4: .string "Numero de ocorrencias do indice na posicao:"
10
.string  "num   0    1    2    3    4    5    6    7"
10
0  
str5: .string "  "
0

str6: .string "Introduza o numero de opcoes (1 a 8): "
0
str7: 
10
.string "Introduza o numero de runs (10 a 99): "
0

SIZE: 6
RUNS: 50
zero: '0'
main:	loco str6
		push
		call imprime_str
		insp 1
		lodd 4092
		stod 4094
		subd zero
		stod SIZE
				
		loco str1
        push
	    call imprime_str
	    insp 1
       
        lodd RUNS   # numero de vezes
        push
        loco 0
        push
cicloMain:  lodl 0
            subl 1
            jpos fimcicloMain       

            #####  chamar a funcao
			loco V1
			push
			lodd SIZE
			push
			call nova_ordenacao
            insp 2

			lodl 0
			# verificar min
			loco V1
			push
			lodd SIZE
			push
			call minVector
			insp 2
			jnze comerro
			
			# verificar max
			loco V1
			push
			lodd SIZE
			push
			call maxVector
			insp 2
			push
			loco -1
			addd SIZE
		    subl 0
		    insp 1
		    jnze comerro
			
			# verifica se todos diferentes
 			loco V1
			push
			lodd SIZE  
			push
			call verificaIguais
			insp 2
			jnze comerro
            
			lodd SIZE
            push
            loco 0
            push
ciclofor:   lodl 0
            subl 1
            jpos fimciclofor
            loco V1
            addl 0
            pshi
            loco 8
            mull 0
            addl 1
            push
            loco stat
            addl 0
            stol 0
            pshi
            incl 0
            popi
            insp 2
            incl 0
            jump ciclofor

fimciclofor: insp 2		
			 incl 0
			 jump cicloMain

fimcicloMain:

semerro: insp 2
         loco str2
         push
         call imprime_str
         insp 1

		 loco str4
		 push
		 call imprime_str
		 insp 1
    
         lodd SIZE
         push
         loco 0
         push
 cfori:	 lodl 0
		 subl 1
		 jpos endcfori      
    		
    	 call imprime_num
    	 loco str5
    	 push
    	 call imprime_str
    	 call imprime_str
    	 insp 1
    		
    	 loco stat
    	 push
    	 loco 8
    	 mull 1
    	 addl 0
    	 stol 0 

    	 loco 0
    	 push
  cforj: loco -8
         addl 0
         jpos endcforj
    	 lodl 0
    	 addl 1
    	 pshi
    	 loco 3
    	 push
    	 call impnum
    	 insp 2
    	 loco str5
    	 push
    	 call imprime_str
    	 insp 1
    	 incl 0
    	 jump cforj     
	         
endcforj:  insp 2
           loco 10
           stod 4094
           incl 0
           jump cfori
           
endcfori:  	insp 2       
			halt         

comerro:  insp 2
		  loco str3
		  push
		  call imprime_str
		  insp 1
		  halt  

minVector:  
            lodl 1
            push
            loco 1000
            push
ciclominV:  lodl 1
            jzer fimciclominV
			lodl 4
			pshi
			pop
			subl 0
			jpos nextciclominV	
			addl 0
			stol 0
nextciclominV: decl 1
               incl 4
               jump ciclominV

fimciclominV: pop
              insp 1
              retn

maxVector: lodl 1
            push
            loco -1000
            push
ciclomaxV:  lodl 1
            jzer fimciclomaxV
			lodl 4
			pshi
			pop
			subl 0
			jneg nextciclomaxV	
			jzer nextciclomaxV	
			addl 0
			stol 0
nextciclomaxV: decl 1
               incl 4
               jump ciclomaxV

fimciclomaxV: pop
              insp 1
              retn

verificaIguais: loco 0
				push
				push
	cicloIv:	lodl 1
	            subl 3		
                jpos fimCiclos 
				loco 1
				addl 1
				stol 0

	cicloJv:    lodl 0
	    		subl  3
	    		jpos nextIv
	    		lodl 4
	    		addl 1
	    		pshi
	    		lodl 5
	    		addl 1
	    		pshi
	    		pop
	    		subl 0
	    		insp 1
	    		jnze contCicloJv
                insp 2
                loco 1
                retn 
contCicloJv:    incl 0
                jump cicloJv

      
    nextIv:     incl 1
                jump cicloIv
                
    fimCiclos:  insp 2
    			loco 0
                retn  
                
                
impnum:
	lodl 1
	jzer nextimpnum
	loco 10
	push
	lodl 3
	modl 0
	push
	lodl 4
	divl 1
	push
	decl 4
	lodl 4
	push
	call impnum
	insp 2
	loco '0'
	addl 0
	stod 4094
	insp 2
	retn	
nextimpnum:
	retn       
.include "votarlib"
.include "funcoes"
halt
