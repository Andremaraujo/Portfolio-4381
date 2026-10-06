; **********************************************************************
; * Grupo: 30
; * Ricardo Pais 107264
; * Alexandre Gonçalves 106809
; * André Araújo 106521
; **********************************************************************
; **********************************************************************
; * Constantes / variaveis
; **********************************************************************

MASK_DIG1 EQU 0FH					; mascara para o primeiro digito do numero do display
MASK_DIG2 EQU 0FFH					; mascara para o segundo digito do numero do display
TEC_LIN EQU 0C000H  				; endereco das linhas do teclado (perifcrico POUT-2)
TEC_COL EQU 0E000H  				; endereco das colunas do teclado (perifcrico PIN)
DISP_END EQU 0A000H					; endereco do display de 7 segmentos (periferico POUT-1)
MASCARA  EQU 0FH     				; para isolar os 4 bits de menor peso, ao ler as colunas do teclado
NUM_MAX  EQU 09AH
DISP_MAX EQU 0FFFH				; valor maximo que o display de 7 segmentos vai guardar
DISP_MIN EQU 0					; valor minimo que o display de 7 segmentos vai guardar
DISP_INI EQU 100H				; valor inicial para a energia

PAUSA_TEC EQU 0DH                   		; tecla que vai chamar a rotina de pausa
INI_TEC EQU 0CH                        		; tecla que vai chamar a rotina de inicio de jogo
SOND1_TEC EQU 0                        		; tecla que vai habilitar a sonda 1
SOND2_TEC EQU 1                        		; tecla que vai habilitar a sonda 2
SOND3_TEC EQU 2                        		; tecla que vai habilitar a sonda 3
LOSER_TEC EQU 0EH				; tecla para desistir do jogo


NUKE_PIXEIS EQU 6000H				; endereco que apaga todos os pixeis na tela
SELECT_OVERLAY	 EQU 6046H			; seleciona uma imagem frontal
SELECT_BACKROUND EQU 6042H			; seleciona uma imagem de fundo
APAGA_OVERLAY	 EQU 6044H			; apaga a imagem frontal
APAGA_AVISO EQU 6040H				; apaga o aviso de nao haver imagem
SOM EQU 6048H					; endereco do som para colocar sons diferentes
VOLUME EQU 604AH				; endereco para modificar o volume do som
TOCA_SOM EQU 605AH				; endereco para tocar o som

LIN_PAINEL EQU 27	
COL_PAINEL EQU 25

LIN_BUTOES EQU 29
COL_BUTOES EQU 29

COLOR_RED EQU 0FF00H        			; cor vermelha para o mediacenter
COLOR_GREY EQU	0FDDDH        			; cor cinzenta para o mediacenter
COLOR_GREEN EQU 0F0F0H        			; cor verde para o mediacenter
COLOR_YELLOW EQU 0FFF0H        			; cor amarela para o mediacenter
COLOR_BLUE EQU	0F00FH        			; cor azul para o mediacenter
COLOR_MILITAR EQU 0F790H        		; cor verde militar para o mediacenter
COLOR_PURPLE EQU 0FB0FH        			; cor roxa para o mediacenter
COLOR_PINK EQU 0FF0FH				; cor rosa para o mediacenter


DEFINE_COL EQU 600CH				; endereco onde se coloca a coluna
DEFINE_LIN EQU 600AH				; endereco onde se coloca a linha
DEFINE_COLOR EQU 6012H				; endereco onde se coloca a a cor do pixel
MIN_COL EQU 0					; minimo das colunas
MIN_LIN	EQU 0					; minimo das linhas
MAX_COL EQU 63					; maximo das colunas
MAX_LIN EQU 31					; maximo das linhas
MAX_LIN_ASTER135 EQU 22				; linha antes do asteroide 1, 3 e 5 colidirem com a nave
MAX_LIN_ASTER24 EQU 31				; linha antes do asteroide 2 e 4 colidirem com a nave
COL_1_2 EQU 15					; coluna entre os asteroides 1 e 2 depois de se cruzarem
COL_4_5 EQU 48					; coluna entre os asteroides 4 e 5 depois de se cruzarem

LARGURA_BUTOES EQU 7
ALTURA_BUTOES EQU 2

LARGURA_PAINEL EQU 15
LARGURA EQU 5					; largura do asteroide
ALTURA 	EQU 5					; altura de ambos o painel e asteroide
LIN_INI1 EQU -1					; linha onde comeca o asteroide
COL_INI1 EQU -1					; coluna onde comeca o asteroide
LIN_INI2 EQU -1					; linha onde comeca o asteroide
COL_INI2 EQU 31					; coluna onde comeca o asteroide
LIN_INI3 EQU -1					; linha onde comeca o asteroide
COL_INI3 EQU 30					; coluna onde comeca o asteroide
LIN_INI4 EQU -1					; linha onde comeca o asteroide
COL_INI4 EQU 29					; coluna onde comeca o asteroide
LIN_INI5 EQU -1					; linha onde comeca o asteroide
COL_INI5 EQU 60					; coluna onde comeca o asteroide



SUB_8 EQU 08H					; numero 8 com diversos usos
SUB_12 EQU 0CH					; numero 12 com diversos usos
DIRECAO_POSITIVA EQU 1
DIRECAO_NEGATIVA EQU -1
NAO_MUDA_DIREC EQU 0

LIN_SONDA1 EQU 27				; linha onde comeca a sonda esquerda
COL_SONDA1 EQU 27				; coluna onde comeca a sonda esquerda
LIN_SONDA2 EQU 27				; linha onde comeca a sonda vertical
COL_SONDA2 EQU 32				; coluna onde comeca a sonda vertical
LIN_SONDA3 EQU 27				; linha onde comeca a sonda direita
COL_SONDA3 EQU 37				; coluna onde comeca a sonda direita
VAL_TESTE_SONDA EQU 26				; linha de teste para a sonda desaparecer e voltar á posicao inicial


PLACE 1000H
val_disp: Word 100H ; valor no display de 7 segmentos


POSICAO_INI1:						; posiao do asteroide 1 inicializada
	WORD LIN_INI1
	WORD COL_INI1
	WORD DIRECAO_POSITIVA
	WORD DIRECAO_POSITIVA


POSICAO_INI2:						; posiao do asteroide 2 inicializada
	WORD LIN_INI2
	WORD COL_INI2
	WORD DIRECAO_POSITIVA
	WORD DIRECAO_NEGATIVA


POSICAO_INI3:						; posiao do asteroide 3 inicializada
	WORD LIN_INI3
	WORD COL_INI3
	WORD DIRECAO_POSITIVA
	WORD NAO_MUDA_DIREC


POSICAO_INI4:						; posiao do asteroide 4 inicializada
	WORD LIN_INI4
	WORD COL_INI4
	WORD DIRECAO_POSITIVA
	WORD DIRECAO_POSITIVA

POSICAO_INI5:						; posiao do asteroide 5 inicializada
	WORD LIN_INI5
	WORD COL_INI5
	WORD DIRECAO_POSITIVA
	WORD DIRECAO_NEGATIVA



ASTEROIDE_1:
	WORD 0						; existencia do asteroide inicializada a 0 (quando a 1 o asteroide já foi feito e quando é destruido passa a 0)
	WORD 0						; ve se o asteroide já moveu
	WORD 0						; tipo do asteroide
	WORD 0						; linha do asteroide
	WORD 0						; coluna do asteroide
	WORD 0						; direcao do movimento do asteroide nas linhas
	WORD 0						; direcao do movimento do asteroide nas colunas


ASTEROIDE_2:
	WORD 0
	WORD 0
	WORD 0
	WORD 0
	WORD 0
	WORD 0
	WORD 0


ASTEROIDE_3:
	WORD 0
	WORD 0
	WORD 0
	WORD 0
	WORD 0
	WORD 0
	WORD 0


ASTEROIDE_4:
	WORD 0
	WORD 0
	WORD 0
	WORD 0
	WORD 0
	WORD 0
	WORD 0

EXISTE_ASTER_PARA_APAGAR:			; variavel que indica que existe uma animacao de asteroide destruido para ser apagada
	WORD 0



ASTEROIDE_DESTROY:				; informacoes do asteroide destruido para apagar
	WORD 0
	WORD 0
	WORD 0
	WORD 0
	WORD 0
	WORD 0
	WORD 0



DEF_BAD_ASTER:						; caracteristicas do asteroide vermelho
	WORD LARGURA
	WORD ALTURA
	WORD COLOR_RED,0,COLOR_RED,0,COLOR_RED
	WORD 0,COLOR_RED,COLOR_RED,COLOR_RED,0
	WORD COLOR_RED,COLOR_RED,0,COLOR_RED,COLOR_RED
	WORD 0,COLOR_RED,COLOR_RED,COLOR_RED,0
	WORD COLOR_RED,0,COLOR_RED,0,COLOR_RED

DEF_BAD_ASTER_DESTROY:					; caracteristicas da explusao do asteroide vermelho
	WORD LARGURA
	WORD ALTURA
	WORD 0,COLOR_BLUE,0,COLOR_BLUE,0
	WORD COLOR_BLUE,0,COLOR_BLUE,0,COLOR_BLUE
	WORD 0,COLOR_BLUE,0,COLOR_BLUE,0
	WORD COLOR_BLUE,0,COLOR_BLUE,0,COLOR_BLUE
	WORD 0,COLOR_BLUE,0,COLOR_BLUE,0


DEF_GOOD_ASTER:						; caracteristicas do asteroide verde
	WORD LARGURA
	WORD ALTURA
	WORD 0, COLOR_GREEN, COLOR_GREEN, COLOR_GREEN, 0
	WORD COLOR_GREEN, COLOR_GREEN, 0, COLOR_GREEN, COLOR_GREEN
	WORD COLOR_GREEN, 0, 0, 0, COLOR_GREEN
	WORD COLOR_GREEN, COLOR_GREEN, 0, COLOR_GREEN, COLOR_GREEN
	WORD 0, COLOR_GREEN, COLOR_GREEN, COLOR_GREEN, 0

DEF_GOOD_ASTER_DESTROY:					; caracteristicas da explusao do asteroide verde
	WORD LARGURA
	WORD ALTURA
	WORD COLOR_PINK, 0, 0, 0, COLOR_PINK
	WORD 0, 0, COLOR_PINK, 0, 0
	WORD 0, COLOR_PINK, COLOR_PINK, COLOR_PINK, 0
	WORD 0, 0, COLOR_PINK, 0, 0
	WORD COLOR_PINK, 0, 0, 0, COLOR_PINK



decr_var:						; variaveis que passam a 1 quando chamadas pela interupcao que indicam se uma rotina pode ser feita
	WORD 0
aster_var:
	WORD 0
sonda_var:
	WORD 0
nave_var:
	WORD 0

tab_BTE:						; tabela do BTE que tem os enderecos das interupcoes
	WORD aster_switch
	WORD sonda_switch
	WORD decr_switch
	WORD nave_switch


estado_do_jogo:						; quando a 0 o jogo nao iniciou, a 1 funcionamento normal, a 2 pausa, a 3 perda por asteroide, a 4 perda por energia e a 5  perda por desistencia
	WORD 0

PAINEL_INI:						; comeco da escrita do painel de controlo da nave
	WORD LIN_PAINEL
	WORD COL_PAINEL

DEF_PAINEL_CONTROLOS:					; caracteristicas do painel
	WORD LARGURA_PAINEL
	WORD ALTURA
	WORD 0 , 0 , COLOR_RED , COLOR_RED , COLOR_RED , COLOR_RED , COLOR_RED , COLOR_RED , COLOR_RED , COLOR_RED , COLOR_RED , COLOR_RED , COLOR_RED , 0 , 0
	WORD 0 , COLOR_RED , COLOR_MILITAR , COLOR_MILITAR , COLOR_MILITAR , COLOR_MILITAR , COLOR_MILITAR , COLOR_MILITAR , COLOR_MILITAR , COLOR_MILITAR , COLOR_MILITAR , COLOR_MILITAR , COLOR_MILITAR , COLOR_RED , 0
	WORD COLOR_RED , COLOR_MILITAR , COLOR_MILITAR , COLOR_MILITAR , COLOR_GREY , COLOR_RED , COLOR_GREEN , COLOR_GREY , COLOR_GREEN , COLOR_GREY , COLOR_PURPLE , COLOR_MILITAR , COLOR_MILITAR , COLOR_MILITAR ,COLOR_RED
	WORD COLOR_RED , COLOR_MILITAR , COLOR_MILITAR , COLOR_MILITAR , COLOR_GREEN , COLOR_GREY , COLOR_RED , COLOR_GREEN , COLOR_YELLOW , COLOR_BLUE , COLOR_GREY , COLOR_MILITAR , COLOR_MILITAR , COLOR_MILITAR ,COLOR_RED
	WORD COLOR_RED , COLOR_MILITAR , COLOR_MILITAR , COLOR_MILITAR , COLOR_MILITAR , COLOR_MILITAR , COLOR_MILITAR , COLOR_MILITAR , COLOR_MILITAR , COLOR_MILITAR , COLOR_MILITAR , COLOR_MILITAR , COLOR_MILITAR , COLOR_MILITAR , COLOR_RED



DEF_PAINEL_CONTROLOS_ESCUDO:				; caracteristicas do painel com escudo
	WORD LARGURA_PAINEL
	WORD ALTURA
	WORD 0 , 0 , COLOR_BLUE , COLOR_BLUE , COLOR_BLUE , COLOR_BLUE ,COLOR_BLUE , COLOR_BLUE , COLOR_BLUE , COLOR_BLUE , COLOR_BLUE , COLOR_BLUE , COLOR_BLUE , 0 , 0
	WORD 0 , COLOR_BLUE , COLOR_MILITAR , COLOR_MILITAR , COLOR_MILITAR , COLOR_MILITAR , COLOR_MILITAR , COLOR_MILITAR , COLOR_MILITAR , COLOR_MILITAR , COLOR_MILITAR , COLOR_MILITAR , COLOR_MILITAR , COLOR_BLUE , 0
	WORD COLOR_BLUE , COLOR_MILITAR , COLOR_MILITAR , COLOR_MILITAR , COLOR_GREY , COLOR_RED , COLOR_GREEN , COLOR_GREY , COLOR_GREEN , COLOR_GREY , COLOR_PURPLE , COLOR_MILITAR , COLOR_MILITAR , COLOR_MILITAR ,COLOR_BLUE
	WORD COLOR_BLUE , COLOR_MILITAR , COLOR_MILITAR , COLOR_MILITAR , COLOR_GREEN , COLOR_GREY , COLOR_RED , COLOR_GREEN , COLOR_YELLOW , COLOR_BLUE , COLOR_GREY , COLOR_MILITAR , COLOR_MILITAR , COLOR_MILITAR ,COLOR_BLUE
	WORD COLOR_BLUE , COLOR_MILITAR , COLOR_MILITAR , COLOR_MILITAR , COLOR_MILITAR , COLOR_MILITAR , COLOR_MILITAR , COLOR_MILITAR , COLOR_MILITAR , COLOR_MILITAR , COLOR_MILITAR , COLOR_MILITAR , COLOR_MILITAR , COLOR_MILITAR , COLOR_BLUE


DEF_BUTOES_PAINEL:					; caracteristicas dos butoes do painel
	WORD LARGURA_BUTOES
	WORD ALTURA_BUTOES
	WORD 0, 0, 0, 0, 0, 0, 0
	WORD 0, 0, 0, 0, 0, 0, 0




EXISTENCIA_DE_ESCUDO:					; variavel que indica a 1 que existe escudo
	WORD 0 




ASTEROIDES_DESTRUIDOS:					; variavel que guarda o numero de asteroides destruidos
	WORD 0






DEF_SONDA1:						; cafracteristicas da sonda esquerda
	WORD 0						; confirma a existencia da sonda quando a 1
	WORD 0						; diz quantas vezes foi desenhado
	WORD LIN_SONDA1
	WORD COL_SONDA1
	WORD COLOR_PURPLE
	WORD DIRECAO_NEGATIVA
	WORD DIRECAO_NEGATIVA

DEF_SONDA2:						; cafracteristicas da sonda vertical
	WORD 0
	WORD 0
	WORD LIN_SONDA2
	WORD COL_SONDA2
	WORD COLOR_PURPLE
	WORD DIRECAO_NEGATIVA
	WORD NAO_MUDA_DIREC

DEF_SONDA3:						; cafracteristicas da sonda direita 
	WORD 0
	WORD 0
	WORD LIN_SONDA3
	WORD COL_SONDA3
	WORD COLOR_PURPLE
	WORD DIRECAO_NEGATIVA
	WORD DIRECAO_POSITIVA




pilha: STACK 200H
pilha_ini:



; **********************************************************************
; * Codigo
; **********************************************************************


PLACE      0
inicio:
; inicializacoes
	MOV		BTE, tab_BTE
	MOV 	SP, pilha_ini				; colocacao do SP no inicio da pilha
	MOV  	R2, TEC_LIN   				; endereco do periferico das linhas
	MOV  	R3, TEC_COL   				; endereco do periferico das colunas
	MOV  	R5, MASCARA   				; para isolar os 4 bits de menor peso, ao ler as colunas do teclado
	MOV 	R4, 0
	MOV  	[APAGA_AVISO], R4			; apaga o aviso de nenhum cenario selecionado (o valor de R1 nao e relevante)
	MOV  	[SELECT_BACKROUND], R4 		; cenario de fundo
	MOV		[estado_do_jogo], R4		; inicializa o estado do jogo a 0
	MOV		R4, [val_disp]				;
	MOV 	[DISP_END], R4				; coloca o display de 7 segmentos a 100H
	MOV 	R4, 3H						; valor de
	MOV		R7, 0
	MOV		R11, 0



; corpo principal do programa

ciclo: ; ciclo "main" do programa, responsavel por chamar as varias rotinas principais do programa
	MOV		R10, [estado_do_jogo]
	CMP		R10, 3H
	JLT		teclado_call
	CALL		jogo_fim
teclado_call:
	CALL	teclado
	CMP		R10, 1
	JNZ		ciclo ; caso o estado do jogo nao seja 1 entao apenas o teclado e chamado
	MOV		R11, [decr_var]
	CMP		R11, 1
	JNZ		aster_call	; verificacao da ativacao da interrupcao, é igual para as outras rotinas que sao chamadas neste ciclo
	CALL 	decr
aster_call:
	MOV		R11, [aster_var]
	CMP		R11, 1
	JNZ		sonda_call
	CALL 	move_aster
sonda_call:
	MOV		R11, [sonda_var]
	CMP		R11, 1
	JNZ		luzes_call
	CALL	sonda_verificacao
luzes_call:
	MOV		R11, [nave_var]
	CMP		R11, 1
	JNZ		ciclo
	CALL	nave_luzes

	JMP	ciclo



; **********************************************************************
; * Nome: teclado
; * Descricao: Trata do processamento das teclas do teclado e das funcionalidades das varias teclas (e a unica rotina que e sempre chamada independentemente do estado do jogo)
; * Altera: todos os registos que usa exceto o R4, e as variaveis em memoria relativas as sondas
; **********************************************************************
teclado:
	PUSH	R4
	MOV 	R4, 4H
	CMP		R7, 1
	JZ ha_tecla

teclado_ciclo:
	MOV 	R1, 1					; valor para testar a linha (neste caso a primeira linha)
	MOV 	R6, -1					; numero da linha (-1 pois a proxima instrucao vai passar este numero para 0)

espera_tecla:						; neste ciclo espera-se ate uma tecla ser premida
	ADD	R6, 1						; mudar o numero da linha para aquela que esta a ser testada
	CMP	R6, 4						; garantir que apenas testamos as 4 linhas
	JZ	teclado_fim
	MOVB	[R2], R1      				; escrever no periferico de saida (linhas)
	MOVB	R0, [R3]       				; ler do periferico de entrada (colunas)
	SHL	R1, 1							; passar o teste para a linha seguinte
	AND 	R0, R5        				; elimina bits para alem dos bits 0-3
	CMP 	R0, 0         				; ha tecla premida?
	JZ	espera_tecla  				; se nenhuma tecla premida, repete
	Mov	R8, -1
	SHR	R1,1						; anular o shift left a mais

col_num: ; ciclo para descobrir o numero da coluna que foi lida
	SHR	R0, 1
	ADD	R8, 1
	CMP	R0, 0						; acabou a contagem?
	JNZ	col_num
	; calculo do numero da tecla
	MUL	R6, R4
	ADD	R8, R6
	MOV		R7, 1
;	 chamadas das funcoes de acordo com a tecla
	MOV		R4, 5H	; valor a decrementar a energia no disparo da sonda
	MOV    R9 , SOND1_TEC
    CMP    R8 , R9 ; teste da tecla da sonda1
    JZ    sonda1_call
    MOV    R9 , SOND2_TEC
    CMP    R8 , R9 ; teste da tecla da sonda2
    JZ    sonda2_call
    MOV    R9 , SOND3_TEC
    CMP    R8 , R9 ; teste da tecla da sonda3
    JZ    sonda3_call
    MOV    R9, PAUSA_TEC
    CMP    R8, R9 ; teste da tecla da pausa
    JZ    pausa_call
    MOV     R9, INI_TEC
    CMP    R8, R9; teste da tecla para iniciar o jogo
    JZ    ini_call
	MOV 	R9, LOSER_TEC
    CMP    R8, R9
    JZ		loser_call
    ; se a tecla nao coincide com nenhuma funcao
    JMP     ha_tecla




sonda1_call: ; chamada da rotina da sonda da esquerda
    MOV    R9, [DEF_SONDA1]
    CMP R9, 0		; verificacao do estado da existencia da sonda, igual para as outras
    JNZ ha_tecla
    CALL decr
    MOV    R9, 1
    MOV    [DEF_SONDA1], R9
    JMP     ha_tecla

sonda2_call: ; chamada da rotina da sonda do meio
    MOV    R9, [DEF_SONDA2]
    CMP R9, 0
    JNZ ha_tecla
    CALL decr
    MOV    R9, 1
    MOV    [DEF_SONDA2], R9
    JMP     ha_tecla

sonda3_call: ; chamada da rotina da sonda da direita
	MOV    R9, [DEF_SONDA3]
    CMP R9, 0
    JNZ ha_tecla
    CALL decr
    MOV    R9, 1
    MOV    [DEF_SONDA3], R9
    JMP     ha_tecla


ini_call:	; chamada da rotina de incicio do jogo
	CALL ini_jogo
	JMP ha_tecla


pausa_call: ; chamada da rotina da pausa do jogo
	CALL	pausa
	JMP		ha_tecla

loser_call:	; chamada da rotina para desistir do jogo
	CALL	loser
	JMP		ha_tecla





ha_tecla:						; neste ciclo espera-se ate NENHUMA tecla estar premida
	MOVB 	[R2], R1      				; escrever no periferico de saida (linhas)
	MOVB 	R0, [R3]      				; ler do periferico de entrada (colunas)
	AND  	R0, R5        				; elimina bits para alem dos bits 0-3
	CMP  	R0, 0         				; ha tecla premida?
	JNZ  	teclado_fim      				; se ainda houver uma tecla premida, espera ate nao haver
	MOV		R7, 0
teclado_fim:
	POP	R4
	RET




; **********************************************************************
; * Nome: jogo_fim
; * Descricao: Rotina que acaba o jogo e mostra um cenario final diferente de acordo com a maneira que o jogador perdeu o jogo
; * Altera: Estado do jogo, contagem de astroites destruidos, fundo, interupcoes, e os pixeis do ecra
; **********************************************************************

jogo_fim:
	PUSH	R0
	MOV R0, [estado_do_jogo]
	MOV [APAGA_OVERLAY], R0 ; retirar o ecra de pausa caso esteja a ser mostrado
	MOV [SELECT_BACKROUND], R0 ; escolher o cenario correspondente ao estado do jogo
	MOV R0, 0
	CALL nuke_asteroides
	CALL nuke_sondas
	MOV [EXISTENCIA_DE_ESCUDO], R0 ; reset ao escudo
	MOV [ASTEROIDES_DESTRUIDOS], R0 ; reset a contagem de asteroides destruidos
	MOV [NUKE_PIXEIS], R0	; limpar o ecra
	MOV [estado_do_jogo], R0 ; colocar o estado do jogo a 0
	DI
	POP 	R0
	RET



; **********************************************************************
; * Nome: nuke_asteroides
; * Descricao: apaga a existencia dos asteroides 
; * Altera: Memoria das variaveis dos asteroides
; **********************************************************************
nuke_asteroides:					
	PUSH	R0
	MOV R0, ASTEROIDE_1
	CALL	coloca_a_zero_aster
	MOV R0, ASTEROIDE_2
	CALL	coloca_a_zero_aster
	MOV R0, ASTEROIDE_3
	CALL	coloca_a_zero_aster
	MOV R0, ASTEROIDE_4
	CALL	coloca_a_zero_aster
	POP	R0
	RET



; **********************************************************************
; * Nome: nuke_sondas
; * Descricao: apaga a existencia das sondas
; * Altera: Memoria das variaveis das sondas
; **********************************************************************


nuke_sondas:
	PUSH	R6
	MOV	R6, DEF_SONDA1
	CALL coloca_a_0_sonda
	MOV	R6, DEF_SONDA2
	CALL coloca_a_0_sonda
	MOV	R6, DEF_SONDA3
	CALL coloca_a_0_sonda
	POP	R6
	RET


; **********************************************************************
; * Nome: incr
; * Descricao: Incrementa o valor que esta no display de 7 segmentos (trata o valor como se estivesse em BCD)
; * Altera: Memoria do POUT-1 e da variavel val_disp
; **********************************************************************
incr:
	PUSH 	R0
	PUSH 	R1
	PUSH	R2
	PUSH	R3
	MOV		R3, 0
	MOV		R2, 25H
	MOV 	R1, DISP_MAX
	MOV 	R0, [val_disp] 	; endreco do display de 7 segmentos
	ADD 	R0, R2  			; incremento do valor da variavel do display
	CMP 	R0, R1			; valor maximo?
	JGE		incr_max
	CALL carry_finder ; descobrir se o valor precisa de ser acertado
	JMP incr_carry

incr_max:
	MOV		R0, R1 ; garantir que o valor nao passa o maximo
	JMP incr_fim

incr_carry:
	ADD		R0, R3 ; acerto do resultado
incr_fim:
	MOV 	[val_disp], R0	; atualizar a variavel
	MOV 	[DISP_END], R0 	; atualizar o display
	POP		R3
	POP		R2
	POP 	R1
	POP 	R0
	RET

; **********************************************************************
; * Nome: decr
; * Descricao: Decrementa o valor que esta no display de 7 segmentos (trata o valor como se estivesse em BCD)
; * Recebe: R4 (quantidade a ser subtraida)
; * Altera: Memoria do POUT-1 e da variavel val_disp
; **********************************************************************
decr:
	PUSH 	R0
	PUSH	R2
	PUSH	R3
	MOV		R3, 0
	MOV R0, [val_disp]
	SUB 	R0, R4			; decremento do valor da variavel do display
	JLE		decr_min
	CALL carry_finder
	JMP decr_carry

decr_min:
	MOV		R3, 4
	MOV		[estado_do_jogo], R3
	MOV		R0, DISP_MIN
	JMP		decr_out

decr_carry:
	SUB 	R0, R3	; acerto do resultado

decr_out:
	MOV		R2, 0
	MOV 	[val_disp], R0	; atualizar a variavel
	MOV 	[DISP_END], R0	; atualizar o display
	MOV		[decr_var], R2


decr_fim:
	POP		R3
	POP		R2
	POP 	R0
	RET


; **********************************************************************
; * Nome: carry_finder
; * Descricao: Rotina auxiliar as de incrementos e decrementos que descobre se o os algarismos precisam de ser acertados (sao maiores que 9) e retorna o acerto
; * Recebe: R0 (o resultado da operacao)
; * Retorna: R3
; * Altera: R3
; **********************************************************************

carry_finder:
	PUSH	R1
	PUSH	R2
	MOV		R2, 0AH
	MOV		R1, MASK_DIG1
	AND		R1, R0
	CMP		R1, R2 ; teste do primeiro algarismo
	JLT		carry_dig2
	ADD		R3, 6H ; acerto do primeiro algarismo
carry_dig2:
	MOV		R2, 0A0H
	MOV		R1, MASK_DIG2
	AND		R1, R0
	CMP		R1, R2 ; teste do segundo algarismo
	JLT		carry_fim
	MOV		R1, 60H
	ADD		R3, R1	; acerto do segundo algarismo
carry_fim:
	POP		R2
	POP		R1
	RET


; **********************************************************************
; * Nome: ini_jogo
; * Descricao: Rotina que inicia o jogo quando o estado do mesmo é 0
; * Altera: fundo, estado do jogo, valor do display, existencia do painel e interrupcoes
; **********************************************************************
ini_jogo:
	PUSH R1
	MOV R1, 0
	CMP R10, R1
	JNZ ini_fim
	MOV R1, DISP_INI
	MOV [val_disp], R1
	MOV R1, 1
	MOV  	[SELECT_BACKROUND], R1 		; cenario de fundo 1
	MOV		[estado_do_jogo], R1		; estado do jogo 1
	CALL	posicao_painel				; criar o painel
	; ativar todas as interrupcoes
	EI
	EI0
	EI1
	EI2
	EI3
ini_fim:
	POP R1
	RET

; **********************************************************************
; * Nome: pausa
; * Descricao: Rotina que coloca o jogo num estado de pausa e retira o jogo desse mesmo estado
; * Recebe: R10 (registo que esta a guardar o estado do jogo)
; * Altera: cenario frontal, interupcoes e estado do jogo
; **********************************************************************
pausa:
	PUSH R1
	MOV R1, 2
	CMP R10, R1 ; se o estado for 2 retira a pausa
	MOV R1, 1
	JZ pausa_unpause
	CMP R10, R1 ; se o estado for 1 pausa
	JNZ pausa_fim
	MOV R1, 2
	DI
	MOV		[SELECT_OVERLAY], R1
	JMP pausa_estado

pausa_unpause: ; retira da pausa
	MOV		[APAGA_OVERLAY], R1
	EI

pausa_estado: ; muda o estado de jogo para refletir a pausa ou a falta da mesma
	MOV	[estado_do_jogo], R1

pausa_fim:
	POP R1
	RET

; **********************************************************************
; * Nome: loser
; * Descricao: Rotina que altera o estado do jogo para um que reflete o jogador desistir do jodo
; * Altera: estado do jogo
; **********************************************************************

loser:
	PUSH R1
	MOV R1, [estado_do_jogo]
;	o jogador so pode desistir caso o jogo esteja no estado 1 ou 2
	CMP R1, 0
	JZ loser_fim
	CMP R1, 3
	JGE loser_fim
	MOV R1, 5
	MOV [estado_do_jogo], R1
loser_fim:
	POP R1
	RET


; **********************************************************************
; * rotinas de interrupcao que sao sinal ao programa para correr as rotinas controladas pelas respetivas variaveis que as interrupcoes mudam
; **********************************************************************
decr_switch:
	PUSH R1
	MOV R1, 1
	MOV [decr_var], R1
	POP R1
	RFE

aster_switch:
	PUSH R1
	MOV R1, 1
	MOV [aster_var], R1
	POP R1
	RFE

sonda_switch:
	PUSH R1
	MOV R1, 1
	MOV [sonda_var], R1
	POP R1
	RFE

nave_switch:
	PUSH R1
	MOV R1, 1
	MOV [nave_var], R1
	POP R1
	RFE




; **********************************************************************
; * Nome: move_aster
; * Descricao: trata de dar direcao e cor aos asteroides que nao a tenha
; * Altera: Memoria das variaveis dos asteroides e escreve no ecram
; **********************************************************************




move_aster:
	PUSH    R0
	PUSH    R1
	PUSH    R2
	PUSH    R3
	PUSH    R4
	PUSH    R5
	PUSH    R6
	PUSH    R7
	PUSH    R8
	PUSH    R9
	PUSH    R10
	PUSH	R11


	MOV  	R1, 1
	MOV 	R10, SOM
	MOV 	[R10], R1
	MOV	R2, TOCA_SOM
	MOV	[R2], R1
	
	MOV	R11, 0



aster_:	
	JMP	verifica_existencia_aster




dar_direc:								; caso um asteroide nao esteja inicializado ele recebe uma direcao e um tipo(verde ou vermelho)
	CALL	recebe_direc
	MOV	R4, R3





verifica_existencia_aster:						; verifica se os ateroides estao inicializados e se existe explusao de asteroide para apagar
	MOV	R0, ASTEROIDE_DESTROY
	MOV	R1, [R0]
	MOV	R2, 0
	CMP	R1, R2
	JZ	nao_ha_aster_destroy
	ADD	R0, 4
	MOV	R4, [R0]
	ADD	R0, 2
	MOV	R1, [R0]
	ADD	R0, 2
	MOV	R2, [R0]
	CALL	apaga_aster
	SUB	R0, 4
	SUB	R0, 4
	MOV	R1, R0
	CALL	coloca_a_zero_aster
nao_ha_aster_destroy:	
	MOV	R0, ASTEROIDE_1
	MOV	R1, ASTEROIDE_2
	MOV	R2, ASTEROIDE_3
	MOV	R10, ASTEROIDE_4
	MOV	R4, 0
existencia_asteroide_1:
	MOV	R0, ASTEROIDE_1
	CMP	R4, R0
	JZ	existencia_asteroide_2
	MOV	R3, R0
	MOV	R5, [R3]
	CMP	R5, 1
	JNZ	dar_direc


existencia_asteroide_2:
	CMP	R4, R1
	JZ	existencia_asteroide_3
	MOV	R3, R1
	MOV	R5, [R3]
	CMP	R5, 1
	JNZ	dar_direc


existencia_asteroide_3:
	CMP	R4, R2
	JZ	existencia_asteroide_4
	MOV	R3, R2
	MOV	R5, [R3]
	CMP	R5, 1
	JNZ	dar_direc


existencia_asteroide_4:
	MOV	R3, R10
	MOV	R5, [R3]
	CMP	R5, 1
	JNZ	dar_direc



	

saida_da_verificacao:

	CMP	R11,0						; desenha os 4 asteroides
	JZ	print_asteroide1
	CMP	R11,1
	JZ	print_asteroide2
	CMP	R11,2
	JZ	print_asteroide3
	CMP	R11,3
	JZ	print_asteroide4
	
print_asteroide1:
	MOV	R0, ASTEROIDE_1
	JMP	posicao_aster
	
print_asteroide2:
	MOV	R0, ASTEROIDE_2
	JMP	posicao_aster
	
print_asteroide3:
	MOV	R0, ASTEROIDE_3
	JMP	posicao_aster
	
print_asteroide4:
	MOV	R0, ASTEROIDE_4


posicao_aster:
	
	ADD	R0, 4
	MOV	R4, [R0]				; tipo de asteroide
	ADD	R0, 2
	MOV  	R1, [R0]				; linha do asteroide
	ADD	R0, 2
	MOV  	R2, [R0]				; coluna do asteroide


	CMP  	R1, MIN_LIN				; verifica se e a primeira vez
	JLT 	desenha_aster
	CALL	apaga_aster



depois_de_apagar:
			
	MOV	R10, MAX_LIN_ASTER135			
	SUB	R10, 1					; na linha 21 (ou até antes) os asteroides estao em colunas diferentes
	CMP	R1, R10
	JLT	desenha_aster
	MOV	R10, COL_INI3				; coluna do pixel principal do asteroide do meio
	CMP	R2, R10
	JZ	final_aster_135				
	
	MOV	R10, COL_1_2				; verifica se o asteroide em questao é o que vem do meio ou o que vem do canto
	CMP	R2, R10
	JLT	final_aster_2_4
	
	MOV	R10, COL_4_5				; verifica se o asteroide em questao é o que vem do meio ou o que vem do canto
	CMP	R2, R10
	JGT	final_aster_2_4


final_aster_135:					; final para os asteroides que destroem a nave
	MOV	R9, MAX_LIN_ASTER135
	CMP	R1, R9
	JLT     desenha_aster				; verifica se o asteroide está prestes a colidir com uma restricao
	MOV	R1, SUB_8
	SUB	R0, R1
	CALL	coloca_a_zero_aster

	
	MOV	R0, EXISTENCIA_DE_ESCUDO		; verifica a existencia do escudo
	MOV	R1, [R0]
	MOV	R9, 1
	CMP	R1, R9
	JNZ	aster_lost				;se este nao existir acaba o jogo
	PUSH	R1
	PUSH	R2
	PUSH	R10
	MOV  	R1, 4
	MOV 	R10, SOM
	MOV 	[R10], R1
	MOV	R2, TOCA_SOM
	MOV	[R2], R1
	POP	R10
	POP	R2
	POP	R1						


;se existir coloca a variavel do escudo a 0
	MOV	R9, 0
	MOV	[R0], R9
	CALL	posicao_painel
	CALL	nave_luzes
	JMP	aster_				

final_aster_2_4:					; final dos asteroides que nao acertam na nave
	MOV	R9, MAX_LIN_ASTER24

	CMP	R1, R9
	JLT     desenha_aster				; verifica se o asteroide está prestes a colidir com uma restricao
	MOV	R1, SUB_8
	SUB	R0, R1
	CALL	coloca_a_zero_aster
	JMP	aster_




desenha_aster:       					; desenha o asteroide a partir da tabela vendo qual a direcao que este segue

	ADD	R0, 4
	MOV	R9, [R0]
	CMP	R9, 1
	JNZ	e_diferente_de_1
	ADD	R2, 1
e_diferente_de_1:
	CMP	R9, -1
	JNZ	e_zero
	SUB	R2, 1					
e_zero:
	ADD	R1, 1					; adiciona 1  posiao inicial do astroide (para 0,0 caso seja o primeiro print)
	SUB	R0, 6
	MOV	[R0], R1
	ADD	R0, 2
	MOV	[R0], R2
	CALL	desenha_boneco

aster_fim:


	ADD	R11, 1
	CMP	R11, 4
	JLT	saida_da_verificacao
	MOV	R11, 0
	MOV 	[aster_var], R11
	POP	R11
	POP	R10
	POP	R9
	POP	R8
	POP	R7
	POP	R6
	POP	R5
	POP	R4
	POP	R3
	POP	R2
	POP	R1
	POP	R0
	RET





; **********************************************************************
; * Nome: apaga_aster
; * Descricao: trata de apagar um asteroide na tela
; * Recebe: a linha coluna e defenicao do boneco(R1,R2 e R4)
; * Altera: o display
; **********************************************************************

apaga_aster:
	MOV	R8, R1					; cpia da linha
	MOV	R5, [R4]				; obtm a largura do asteroide
	MOV	R9, R5
	ADD	R4, 2
	MOV	R6, [R4]				; obtem a altura do asteroide
	SUB	R4, 2

apaga_pixelsnl:
	MOV	R7, R2					; cpia da coluna
	MOV	R5, R9
apaga_pixels:       					; desenha os pixels do asteroide a partir da tabela
	MOV	R3, 0					; para apagar, a cor do pixel  sempre 0
	MOV  	[DEFINE_LIN], R8			; seleciona a linha
	MOV  	[DEFINE_COL], R7			; seleciona a coluna
	MOV  	[DEFINE_COLOR], R3			; altera a cor do pixel na linha e coluna selecionadas
	ADD  	R7, 1               			; prxima coluna
	SUB  	R5, 1					; menos uma coluna para tratar
	JNZ  	apaga_pixels				; continua at percorrer toda a largura do asteroide
	ADD	R8, 1					; proxima linha
	SUB  	R6, 1					; menos uma linha para tratar
	JNZ	apaga_pixelsnl				; passa para uma nova linha
	RET





aster_lost:
	PUSH	R1
	PUSH	R2
	PUSH	R10
	MOV  	R1, 5
	MOV 	R10, SOM
	MOV 	[R10], R1
	MOV	R2, TOCA_SOM
	MOV	[R2], R1
	POP	R10
	POP	R2
	POP	R1
	MOV 	R0, 3
	MOV 	[estado_do_jogo], R0

JMP aster_



; **********************************************************************
; * Nome: recebe_direc
; * Descricao: trata de dar uma direcao a um asteroide
; * Recebe: o endereco do asteroide
; * Altera: a variavel do asteroide em questao
; **********************************************************************


recebe_direc:					; da ao asteroide uma cor, coordenadas e direcao
	PUSH	R0
	PUSH	R1
	PUSH	R2  
	PUSH	R4
	PUSH	R5
	MOV	R1, 1
	MOV	[R3], R1			; mete-se 1 para dizer que este asteroide passou a existir
	ADD	R3, 4
	

	MOV	R1, TEC_COL
	MOV	R0, [R1]
	SHR	R0, SUB_12			; R0 agora tem um valor entre 0 e 7
	SHR	R0, 1	
	MOV	R1, R0					
	SHR	R1, 1				
	CMP	R1,0 				; R1 tem depois do SHR 2/8 de possibilidade de estar a 0 (1/4)
	JZ	dar_cor_verde			
	MOV	R1, DEF_BAD_ASTER
	MOV	[R3], R1
	ADD	R3, 2



valor_direc:

	MOV	R1, TEC_COL
	MOV	R0, [R1]
	SHR	R0, SUB_12
	SHR	R0, 1	
	ADD	R0, 1
	MOV	R1, 6
	CMP	R0, R1
	JGE	valor_direc			; se o valor de R0 for maior ou igual a 6 (existem 5 possibilidades) ele vai buscar um valor novo

	CMP	R0, 1
	JZ	direc_1
	CMP	R0, 2
	JZ	direc_2
	CMP	R0, 3
	JZ	direc_3
	CMP	R0, 4
	JZ	direc_4
	CMP	R0, 5
	JZ	direc_5

direc_1:
	MOV	R4,  POSICAO_INI1
	JMP	depois_de_direc
	
	
direc_2:
	MOV	R4,  POSICAO_INI2
	JMP	depois_de_direc
	
	
direc_3:
	MOV	R4,  POSICAO_INI3
	JMP	depois_de_direc
	
	
direc_4:
	MOV	R4,  POSICAO_INI4
	JMP	depois_de_direc
	
	
direc_5:
	MOV	R4,  POSICAO_INI5



depois_de_direc:
	MOV	R5, [R4]
	MOV	[R3], R5
	ADD	R4, 2
	ADD	R3, 2
	MOV	R5, [R4]
	MOV	[R3], R5
	ADD	R4, 2
	ADD	R3, 2
	MOV	R5, [R4]
	MOV	[R3], R5
	ADD	R4, 2
	ADD	R3, 2
	MOV	R5, [R4]
	MOV	[R3], R5
	JMP	final_direc
	




dar_cor_verde:
	MOV	R1, DEF_GOOD_ASTER			
	MOV	[R3], R1
	ADD	R3, 2
	jmp	valor_direc

final_direc:
	MOV	R1, SUB_12
	SUB	R3, R1
	POP R5
	POP R4
	POP R2
	POP R1
	POP R0
	RET


; **********************************************************************
; * Nome: coloca_a_zero_aster
; * Descricao: coloca a variavel de um asteroide especifico a zero
; * Recebe: o endereco do asteroide
; * Altera: a variavel do asteroide em questao
; **********************************************************************


coloca_a_zero_aster:
	PUSH	R1
	MOV	R1, 0
	MOV	[R0], R1
	ADD	R0, 2
	MOV	[R0], R1
	ADD	R0, 2
	MOV	[R0], R1
	ADD	R0, 2
	MOV	[R0], R1
	ADD	R0, 2
	MOV	[R0], R1
	ADD	R0, 2
	MOV	[R0], R1
	ADD	R0, 2
	MOV	[R0], R1
	POP	R1
	RET







; **********************************************************************
; * Nome: desenha_boneco
; * Descricao: desenha o boneco em questao
; * Recebe: o endereco do boneco em questao
; * Altera:o display
; **********************************************************************





desenha_boneco:
	
	MOV	R7, R2					; cpia da coluna do boneco
	MOV	R8, R1					; cpia da linha do boneco
	MOV	R5, [R4]				; obtm a largura do boneco
	MOV	R9, R5
	ADD	R4, 2
	MOV	R6, [R4]				; obtem a altura do boneco
	ADD	R4, 2					; endereo da cor do 1 pixel (2 porque a largura  uma word)
desenha_pixelsnl:
	MOV	R7, R2					; cpia da coluna
	MOV	R5, R9
desenha_pixels:       					; desenha os pixels do boneco a partir da tabela
	MOV	R3, [R4]				; obtm a cor do prximo pixel do boneco
	MOV  	[DEFINE_LIN], R8			; seleciona a linha
	MOV  	[DEFINE_COL], R7			; seleciona a coluna
	MOV  	[DEFINE_COLOR], R3			; altera a cor do pixel na linha e coluna selecionadas
	ADD	R4, 2					; endereo da cor do prximo pixel (2 porque cada cor de pixel  uma word)
	ADD  	R7, 1               			; prxima coluna
	SUB  	R5, 1					; menos uma coluna para tratar
	JNZ  	desenha_pixels      			; continua at percorrer toda a largura do boneco
	ADD	R8, 1					; proxima linha
	SUB  	R6, 1					; menos uma linha para tratar
	JNZ	desenha_pixelsnl			; passa para a proxima linha do boneco
	RET						; retorna a funcao depois de desenhar o boneco      






; **********************************************************************
; * Nome: posicao_painel
; * Descricao: ve qual painel e que tem de ser desenhado e desenha
; * Altera:o display
; **********************************************************************



posicao_painel:
	PUSH	R0
	PUSH	R1
	PUSH	R2
	PUSH	R3
	PUSH	R4
	PUSH	R5
	PUSH	R6
	PUSH	R7
	PUSH	R8
	PUSH	R9

	MOV	R0, EXISTENCIA_DE_ESCUDO		; ve se se desenha o painel normal ou com escudo
	MOV	R1, [R0]
	CMP	R1, 1
	JZ	posicao_painel_escudo
	MOV	R4, DEF_PAINEL_CONTROLOS		; endereo da tabela que define o boneco
	JMP	info_painel
posicao_painel_escudo:
	MOV	R4, DEF_PAINEL_CONTROLOS_ESCUDO		; endereo da tabela que define o boneco

info_painel:
	MOV	R0, PAINEL_INI
	MOV	R1, [R0]
	ADD	R0, 2
	MOV	R2, [R0]
	

	CALL	desenha_boneco

	POP	R9
	POP	R8
	POP	R7
	POP	R6
	POP	R5
	POP	R4
	POP	R3
	POP	R2
	POP	R1
	POP	R0
	RET




; **********************************************************************
; * Nome: nave_luzes
; * Descricao: com aleatoriedade fica com um padrao que depois desenha nos butoes do painel
; * Altera:o display e a variavel das luzes da nave
; **********************************************************************




nave_luzes:
	PUSH	R0
	PUSH	R1
	PUSH	R2
	PUSH	R3
	PUSH	R4
	PUSH	R5
	PUSH	R6
	PUSH	R7
	PUSH	R8
	PUSH	R9
	PUSH	R10
	PUSH	R11
	MOV	R1, LIN_BUTOES
	MOV	R2, COL_BUTOES
	MOV	R3, 14
	MOV	R4, DEF_BUTOES_PAINEL
	ADD	R4, 2
acontecer_14_vezes:	 				; para os 14 butoes do painel
	ADD	R4, 2
	CALL	random_butoes
	SUB	R3, 1
	CMP	R3, 0
	JNZ	acontecer_14_vezes
	MOV	R4, DEF_BUTOES_PAINEL
	CALL	desenha_boneco
	MOV	R1, 0
	MOV	[nave_var], R1

	POP	R11
	POP	R10
	POP	R9
	POP	R8
	POP	R7
	POP	R6
	POP	R5
	POP	R4
	POP	R3
	POP	R2
	POP	R1
	POP	R0
	RET

random_butoes:
	PUSH	R0
	PUSH	R1
	PUSH	R2
	PUSH	R3


	MOV	R1, TEC_COL
	MOV	R0, [R1]
	SHR	R0, SUB_12
	SHR	R0, 1
	MOV	R2, 0		
	CMP	R0, R2
	JNZ	ncor_vermelha_
	MOV	R3, COLOR_RED
	MOV	[R4], R3
ncor_vermelha_:	
	CMP	R0, R2
	JNZ	ncor_cinza_
	MOV	R3, COLOR_GREY
	MOV	[R4], R3
ncor_cinza_:	
	MOV	R2, 2	
	CMP	R0, R2
	JNZ	ncor_verde_
	MOV	R3, COLOR_GREEN
	MOV	[R4], R3
ncor_verde_:	
	MOV	R2, 3	
	CMP	R0, R2
	JNZ	ncor_amarelo_
	MOV	R3, COLOR_YELLOW
	MOV	[R4], R3
ncor_amarelo_:
	MOV	R2, 4	
	CMP	R0, R2
	JNZ	ncor_azul_
	MOV	R3, COLOR_BLUE
	MOV	[R4], R3
ncor_azul_:
	MOV	R2, 5	
	CMP	R0, R2
	JNZ	ncor_militar_
	MOV	R3, COLOR_MILITAR
	MOV	[R4], R3
ncor_militar_:
	MOV	R2, 6	
	CMP	R0, R2
	JNZ	ncor_roxo_
	MOV	R3, COLOR_PURPLE
	MOV	[R4], R3
ncor_roxo_:
	MOV	R2, 7	
	CMP	R0, R2
	JNZ	final_nave_cor
	MOV	R3, COLOR_PINK
	MOV	[R4], R3
final_nave_cor:
	POP	R3
	POP	R2
	POP	R1
	POP	R0
	RET



; **********************************************************************
; * Nome: sonda_verificacao
; * Descricao: trata de mover as sondas inicializadas e confirma se houve alguma colisao sonda_asteroide
; * Altera:a variavel das sondas e dos asteroides
; **********************************************************************


sonda_verificacao:			; verifica se as sondas nao existem e se já andaram 12 pixeis se alguma destas condicoes for verdade a sonda é reinicializada
	PUSH	R0
	PUSH	R1
	PUSH	R6
	PUSH	R7

	MOV	R7, 12

sonda_existe1:						
	MOV	R6, DEF_SONDA1
	MOV	R0, [R6]
	CMP	R0, 0
	JZ	sonda_existe2	
	ADD	R6, 2
	MOV	R1, [R6]
	CMP	R1, R7
	JLE	inferior_a_12_1
	SUB	R6, 2
	CALL	coloca_a_0_sonda
	JMP	sonda_existe2
inferior_a_12_1:
	ADD	R1, 1
	MOV	[R6], R1
	CALL	sonda


	
sonda_existe2:
	MOV	R6, DEF_SONDA2
	MOV	R0, [R6]
	CMP	R0, 0
	JZ	sonda_existe3	
	ADD	R6, 2
	MOV	R1, [R6]
	CMP	R1, R7
	JLE	inferior_a_12_2
	SUB	R6, 2
	CALL	coloca_a_0_sonda
	JMP	sonda_existe3
inferior_a_12_2:
	ADD	R1, 1
	MOV	[R6], R1
	CALL	sonda
	
sonda_existe3:
	MOV	R6, DEF_SONDA3
	MOV	R0, [R6]
	CMP	R0, 0
	JZ	sonda_existe_final
	ADD	R6, 2
	MOV	R1, [R6]
	CMP	R1, R7
	JLE	inferior_a_12_3
	SUB	R6, 2
	CALL	coloca_a_0_sonda
	JMP	sonda_existe_final
inferior_a_12_3:
	ADD	R1, 1
	MOV	[R6], R1
	CALL	sonda


sonda_existe_final:
	CALL	colisao_sondaasteroide
	MOV 	R7, 0
	MOV 	[sonda_var], R7
	POP	R7
	POP 	R6
	POP	R1
	POP	R0
	RET






coloca_a_0_sonda:                        ; coloca a sonda da esquerda inicializada
    PUSH    R1
    PUSH    R3
    PUSH    R4
    PUSH    R5
    PUSH    R6
    ADD    R6, 4
    MOV    R4, [R6]
    ADD    R6, 2
    MOV    R5, [R6]
    SUB    R6, 6
    MOV    R3, 0                    ; para apagar, a cor do pixel  sempre 0
    MOV      [DEFINE_LIN], R4            ; seleciona a linha
    MOV      [DEFINE_COL], R5            ; seleciona a coluna
    MOV      [DEFINE_COLOR], R3            ; altera a cor do pixel na linha e coluna selecionadas
    CALL	inicializa_a_posicao_sonda
    MOV    R1, 0
    MOV    [R6], R1
    ADD    R6, 2
    MOV    [R6], R1
    ADD    R6, 2
    POP    R6
    POP    R5
    POP    R4
    POP    R3
    POP    R1
    RET

inicializa_a_posicao_sonda:						; coloca dependendo da sonda em que se esta a trabalhar e coloca os respetivos valores de inicializacao
	PUSH R1
	PUSH R6
	MOV R1, DEF_SONDA1
	CMP	R6, R1
	JZ	inicializa_a_posicao_sonda1
	MOV R1, DEF_SONDA2
	CMP	R6, R1
	JZ	inicializa_a_posicao_sonda2
	MOV R1, DEF_SONDA3
	CMP	R6, R1
	JZ	inicializa_a_posicao_sonda3
inicializa_a_posicao_sonda1:
	ADD	   R6, 4
	MOV    R1, LIN_SONDA1
    MOV    [R6], R1
    ADD    R6, 2
    MOV    R1, COL_SONDA1
    MOV    [R6], R1
    JMP		inicializa_a_posicao_sonda_fim
inicializa_a_posicao_sonda2:
	ADD	   R6, 4
	MOV    R1, LIN_SONDA2
    MOV    [R6], R1
    ADD    R6, 2
    MOV    R1, COL_SONDA2
    MOV    [R6], R1
    JMP		inicializa_a_posicao_sonda_fim
inicializa_a_posicao_sonda3:
	ADD	   R6, 4
	MOV    R1, LIN_SONDA3
    MOV    [R6], R1
    ADD    R6, 2
    MOV    R1, COL_SONDA3
    MOV    [R6], R1
inicializa_a_posicao_sonda_fim:
	POP R6
	POP R1
	RET







colisao_sondaasteroide:							; verifica se alguma das sondas colide com um asteroide
	PUSH	R4
	PUSH	R5
	PUSH	R6
	MOV	R6, DEF_SONDA1
	MOV	R4,[R6] 
	MOV	R5, 1
	CMP	R4, R5
	JNZ	ve_se_sonda_existe_colisao2
	CALL	asteroides_sonda
ve_se_sonda_existe_colisao2:
	MOV	R6, DEF_SONDA2
	MOV	R4,[R6] 
	MOV	R5, 1
	CMP	R4, R5
	JNZ	ve_se_sonda_existe_colisao3
	CALL	asteroides_sonda
ve_se_sonda_existe_colisao3:
	MOV	R6, DEF_SONDA3
	MOV	R4,[R6] 
	MOV	R5, 1
	CMP	R4, R5
	JNZ	final_verificacao_sonda_existe_colisao
	CALL	asteroides_sonda
final_verificacao_sonda_existe_colisao:
	POP	R6
	POP	R5
	POP	R4
	RET




asteroides_sonda:							; verifica se a sonda em questao colide com algum dos asteroides 
	PUSH	R0
	PUSH	R6
	MOV	R0, ASTEROIDE_1
	CALL	asteroidesonda
	MOV	R0, ASTEROIDE_2
	CALL	asteroidesonda
	MOV	R0, ASTEROIDE_3
	CALL	asteroidesonda
	MOV	R0, ASTEROIDE_4
	CALL	asteroidesonda
	POP	R6
	POP	R0
	RET







asteroidesonda:							; verifica se a sonda em questao colide com o asteroide em questao
	PUSH	R1
	PUSH	R2
	PUSH	R3
	PUSH	R4
	PUSH	R5
	PUSH	R6
	PUSH	R7

	ADD	R0, 6
	MOV	R1, [R0]					; linha do ponto principal do asteroide
	ADD	R0, 2
	MOV	R2, [R0]					; coluna do ponto principal do asteroide
	ADD	R6, 4
	MOV	R3, [R6]					; linha da sonda em questao
	ADD	R6, 2
	MOV	R4, [R6]					; linha da sonda em questao
	MOV	R5, R1						; linha do outro extremo do asteroide
	ADD	R5, 5
	MOV	R7, R2						; coluna do outro extremo do asteroide
	ADD	R7, 5

	CMP	R3, R1
	JLT	nao_colidem
	CMP	R4, R2
	JLT	nao_colidem
	CMP	R3, R5
	JGT	nao_colidem
	CMP	R4, R7
	JGT	nao_colidem
								; se nao der JUMP para o  "nao_colidem" quer dizer que que a sonda colide com o asteroide
	MOV	R7, ASTEROIDES_DESTRUIDOS
	MOV	R5, [R7]
	ADD	R5, 1
	MOV	R1, SUB_12
	MOV	[R7], R5
	CMP	R5, R1
	JNZ	n_escudo_ainda					; dá escudo caso os 12 asteroides necessarios tenham sido destruidos
	MOV	R1, 0
	MOV	[R7], R1			
	MOV	R1, EXISTENCIA_DE_ESCUDO			
	MOV	R2, 1
	MOV	[R1], R2
	CALL	posicao_painel
	CALL	nave_luzes

n_escudo_ainda:							; se o valor de asteroides destruidos nao for o sufu«iciente nao tem escudo



								; o codigo abaixo trata de colocar a animacao de explusao dependendo do asteroide destruido
	PUSH	R6
	SUB	R0, 4
	MOV	R1, 1
	MOV	R2, ASTEROIDE_DESTROY				
	MOV	[R2], R1
	ADD	R2, 4
	MOV	R1, DEF_GOOD_ASTER
	MOV	R3, [R0]
	CMP	R3, R1
	JNZ	nao_verde
	CALL	incr
	PUSH	R1
	PUSH	R2
	PUSH	R10
	MOV  	R1, 3
	MOV 	R10, SOM
	MOV 	[R10], R1
	MOV	R2, TOCA_SOM
	MOV	[R2], R1
	POP	R10
	POP	R2
	POP	R1
	MOV	R3, DEF_GOOD_ASTER_DESTROY
	MOV	[R2], R3
nao_verde:	
	MOV	R3, [R2]
	MOV	R1, DEF_GOOD_ASTER_DESTROY 
	CMP	R3, R1
	JZ	nao_e_vermelho
	PUSH	R1
	PUSH	R2
	PUSH	R10
	MOV  	R1, 2
	MOV 	R10, SOM
	MOV 	[R10], R1
	MOV	R2, TOCA_SOM
	MOV	[R2], R1
	POP	R10
	POP	R2
	POP	R1
	MOV	R3, DEF_BAD_ASTER_DESTROY 
	MOV	[R2], R3
nao_e_vermelho:
	ADD	R2, 2
	ADD	R0, 2
	MOV	R3, [R0]
	MOV	[R2], R3						; o asteroide para destruir recebe a linha do asteroide destruido

	ADD	R2, 2
	ADD	R0, 2
	MOV	R3, [R0]
	MOV	[R2], R3						; o asteroide para destruir recebe a coluna do asteroide destruido

	SUB	R0, 4
	SUB	R0, 4
	SUB	R2, 4

	MOV	R4, [R2]
	ADD	R2, 2
	MOV	R1, [R2]
	ADD	R2, 2
	MOV	R2, [R2]
	CALL	desenha_boneco

	MOV	R1, R0
	CALL	coloca_a_zero_aster
	
	POP	R6
	SUB	R6, 6
	MOV	R1, DEF_SONDA1
	CMP	R6, R1
	JZ	destroi_sonda1

	MOV	R1, DEF_SONDA2
	CMP	R6, R1
	JZ	destroi_sonda2

	MOV	R1, DEF_SONDA3
	CMP	R6, R1
	JZ	destroi_sonda3
	

destroi_sonda1:
	CALL	coloca_a_0_sonda
	JMP	nao_colidem


destroi_sonda2:
	CALL	coloca_a_0_sonda
	JMP	nao_colidem


destroi_sonda3:
	CALL	coloca_a_0_sonda
	JMP	nao_colidem






nao_colidem:
	POP	R7
	POP	R6
	POP	R5
	POP	R4
	POP	R3
	POP	R2
	POP	R1
	RET








;***************************************************************************************
;	Nome:			sonda
;	Descricao:		apaga e desenha a sonda na nova posicao no ecra
;	recebe:			o endereco da sonda (qualquer uma)
;	Altera:			a variavel com a posicao da sonda
;***************************************************************************************


sonda:
	PUSH  	R0
	PUSH  	R1
	PUSH  	R2
	PUSH  	R3
	PUSH  	R4
	PUSH	R5
	MOV  	R1, 0
	MOV 	R5, SOM                		; endereço para colocar o som
	MOV 	[R5], R1               	 	; proximo som a ser tocado sera o zero
    	MOV     R1 , 1
	MOV	R2, TOCA_SOM                	; endereço para tocar o som
	MOV	[R2], R1                    	; tocar o som
	MOV	R1, R6				; obtemos as caracteristicas da sonda em questao
	ADD	R1, 2
	MOV 	R2 , [R1]               	; linha da sonda
	ADD 	R1 , 2
	MOV 	R3 , [R1]               	; coluna da sonda
	MOV 	R4 , VAL_TESTE_SONDA    	; ver se a sonda ja esta desenhada
	CMP 	R2 , R4
	JGT 	desenha_sonda

apaga_sonda:
	MOV 	R0, 0                   	; cor zero para apagar a sonda
	MOV 	[DEFINE_LIN] , R2       	; seleciona a linha
	MOV 	[DEFINE_COL] , R3       	; seleciona a coluna
	MOV 	[DEFINE_COLOR] , R0     	; apaga o pixel da linha e da coluna selecionadas


desenha_sonda:

	SUB	R1, 2
	SUB 	R2 , 1
	MOV 	[R1] , R2               	; coloca a nova linha na memoria
	ADD 	R1, 4
	ADD 	R1, 4
	MOV	R4, [R1]
	CMP	R4, 0
	JLT	sub_sonda
	CMP	R4, 0
	JZ	salva_coluna
	ADD	R3, 1
	JMP	salva_coluna
sub_sonda:
	SUB 	R3, 1
salva_coluna:
	SUB	R1, 6
	MOV	[R1], R3
	ADD 	R1 , 2
	MOV 	R4 , [R1]               	; obtem a cor da sonda
	MOV 	[DEFINE_LIN] , R2       	; seleciona a linha
	MOV 	[DEFINE_COL] , R3       	; seleciona a coluna
	MOV 	[DEFINE_COLOR] , R4     	; altera a cor do pixel na linha e coluna selecionadas
	POP	R5
	POP 	R4
	POP 	R3
	POP 	R2
	POP 	R1
	POP 	R0
	RET