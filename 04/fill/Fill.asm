  (START)
    // Existem 8192 registros lidando com a tela
	// inicialize numScreenRegistersToPaint para 8192
	// D = variavel, A= adress, M = Memoria RAM
    @8192
    D=A
    @numScreenRegistersToPaint
    M=D

    // setando o valor de variavel currentScreenRegister para o primeiro registro da tela
    @SCREEN
    D=A
    @currentScreenRegister
    M=D

    // setando D com o valor do teclado. 0 => Não pressione // 1 => pressione.
    @KBD
    D=M

    // Se nada for pressionado => setar para a cor branca
    @SETWHITE
    D; JEQ

    // Se pressionado => setar para a cor preta
    @SETBLACK
    0; JMP

  // Setar variavel para a cor 0
  (SETWHITE)
    @color
    M=0

    @PAINT
    0;JMP

  // Setar variavel para a cor -1
  (SETBLACK)
    @color
    M=-1

    @PAINT
    0;JMP

  // Pintar a tela
  (PAINT)
    // Setar D para o valor da cor
    @color
    D=M

    // Setar o valor de A para o numero de registro da tela e modificar seu valor
    // para se ter o valor da cor (0 Branco; -1 Preto)
    @currentScreenRegister
    A=M
    M=D

    // incrementar um de currentScreenRegister (isso pintara o lado direito dos pixels no proximo loop)
    @currentScreenRegister
    M=M+1

    // Subitrair 1 de numScreenRegistersToPaint
    @numScreenRegistersToPaint
    M=M-1
    D=M

    // Se numScreenRegistersToPaint for 0 => iniciar o programa
    @START
    D; JEQ

    // Se numScreenRegistersToPaint não for 0, continue pintando
    @PAINT
    0; JMP

