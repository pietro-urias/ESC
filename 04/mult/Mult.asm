// Multiplica R0 e R1 e guardar o resultado em R2.
// (R0, R1, R2 referem-se a RAM[0], RAM[1], e RAM[2], respectivamente.)


// Inicializa i para R1
@R1
D=M
@i
M=D

// Inicializa resultado com 0
@R2
M=0

// O loop irá começar a decrescer i um por um, se i for maior que 0, nós somamos R1, se não nós vamos para o final
(LOOP)
// Se i for 0 => fim do programa
@i
D=M
@END
D;JEQ

// Adicione R0 ao resultado
@R0
D=M
@R2
M=D+M

// Decrementar o valor de i
@i
M=M-1

@LOOP
0; JMP


(END)
@END
0; JMP
