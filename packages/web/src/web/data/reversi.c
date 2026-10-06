/*

---------------------------------
-  Programa desenvolvido por:   -
-  André Araújo Nº106521        -
---------------------------------

*/

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define SIZE 8 /* Tamanho do tabuleiro */

char board[SIZE][SIZE]; /* Tabuleiro do jogo */

/* Função para imprimir o tabuleiro */
void printBoard() {
    printf("  1 2 3 4 5 6 7 8\n");
    for (int i = 0; i < SIZE; i++) {
        printf("%d ", i + 1);
        for (int j = 0; j < SIZE; j++) {
            printf("%c ", board[i][j]);
        }
        printf("\n");
    }
}

/* Função para inicializar o tabuleiro com as peças iniciais */
void initializeBoard() {
    for (int i = 0; i < SIZE; i++) {
        for (int j = 0; j < SIZE; j++) {
            board[i][j] = ' ';
        }
    }
    board[3][3] = board[4][4] = 'O';
    board[3][4] = board[4][3] = 'X';
}

/* Função para verificar se uma jogada é válida */
int isValidMove(int row, int col, char player) {
    if (board[row][col] != ' ') {
        return 0; /* A posição já está ocupada */
    }
    char opponent = (player == 'X') ? 'O' : 'X';
    /* Verificar nas 8 direções (horizontal, vertical e diagonais) */
    int directions[8][2] = {{-1, -1}, {-1, 0}, {-1, 1}, {0, -1}, {0, 1}, {1, -1}, {1, 0}, {1, 1}};
    for (int i = 0; i < 8; i++) {
        int r = row + directions[i][0];
        int c = col + directions[i][1];
        int foundOpponent = 0;

        while (r >= 0 && r < SIZE && c >= 0 && c < SIZE && board[r][c] == opponent) {
            r += directions[i][0];
            c += directions[i][1];
            foundOpponent = 1;
        }
        if (foundOpponent && r >= 0 && r < SIZE && c >= 0 && c < SIZE && board[r][c] == player) {
            return 1; /* Jogada válida */
        }
    }
    return 0; /* Jogada inválida */
}

/* Função para fazer uma jogada */
void makeMove(int row, int col, char player) {
    char opponent = (player == 'X') ? 'O' : 'X';
    /* Atualizar a peça na posição escolhida */
    board[row][col] = player;
    /* Virar as peças do oponente nas direções válidas */
    int directions[8][2] = {{-1, -1}, {-1, 0}, {-1, 1}, {0, -1}, {0, 1}, {1, -1}, {1, 0}, {1, 1}};
    for (int i = 0; i < 8; i++) {
        int r = row + directions[i][0];
        int c = col + directions[i][1];
        int foundOpponent = 0;
        int piecesToFlip = 0;
        while (r >= 0 && r < SIZE && c >= 0 && c < SIZE && board[r][c] == opponent) {
            r += directions[i][0];
            c += directions[i][1];
            foundOpponent = 1;
            piecesToFlip++;
        }
        if (foundOpponent && r >= 0 && r < SIZE && c >= 0 && c < SIZE && board[r][c] == player) {
            /* Virar as peças do oponente */
            r = row + directions[i][0];
            c = col + directions[i][1];
            for (int j = 0; j < piecesToFlip; j++) {
                board[r][c] = player;
                r += directions[i][0];
                c += directions[i][1];
            }
        }
    }
}

/* Função para fazer a jogada da IA */
void makeAIMove(char player) {
    char opponent = (player == 'X') ? 'O' : 'X';
    int maxPiecesToFlip = 0;
    int bestRow = -1;
    int bestCol = -1;
    /* Percorrer todas as posições vazias do tabuleiro */
    for (int i = 0; i < SIZE; i++) {
        for (int j = 0; j < SIZE; j++) {
            if (board[i][j] == ' ' && isValidMove(i, j, player)) {
                int piecesToFlip = 0;
                /* Virar as peças do oponente nas direções válidas */
                int directions[8][2] = {{-1, -1}, {-1, 0}, {-1, 1}, {0, -1}, {0, 1}, {1, -1}, {1, 0}, {1, 1}};
                for (int k = 0; k < 8; k++) {
                    int r = i + directions[k][0];
                    int c = j + directions[k][1];
                    int foundOpponent = 0;
                    while (r >= 0 && r < SIZE && c >= 0 && c < SIZE && board[r][c] == opponent) {
                        r += directions[k][0];
                        c += directions[k][1];
                        foundOpponent = 1;
                        piecesToFlip++;
                    }
                    if (foundOpponent && r >= 0 && r < SIZE && c >= 0 && c < SIZE && board[r][c] == player) {
                        piecesToFlip += 1; /* Contar a peça que será colocada na jogada */
                    }
                }
                /* Verificar se a jogada é a melhor até agora */
                if (piecesToFlip > maxPiecesToFlip) {
                    maxPiecesToFlip = piecesToFlip;
                    bestRow = i;
                    bestCol = j;
                }
            }
        }
    }
    /* Fazer a jogada escolhida pela IA */
    if (bestRow != -1 && bestCol != -1) {
        makeMove(bestRow, bestCol, player);
    }
}

void countPiecesAndEmptySpaces(int *numX, int *numO, int *numEmpty) {
    *numX = 0;
    *numO = 0;
    *numEmpty = 0;
    for (int i = 0; i < SIZE; i++) {
        for (int j = 0; j < SIZE; j++) {
            if (board[i][j] == 'X') {
                (*numX)++;
            } else if (board[i][j] == 'O') {
                (*numO)++;
            } else {
                (*numEmpty)++;
            }
        }
    }
}

void writeBoardToFile(FILE *file, char board[][SIZE]) {
    /* Escreve o tabuleiro no arquivo de saída */
    fprintf(file,"  1 2 3 4 5 6 7 8\n");
    for (int i = 0; i < SIZE; i++) {
        fprintf(file, "%d ", i + 1);
        for (int j = 0; j < SIZE; j++) {
            fprintf(file, "%c ", board[i][j]);
        }
        fprintf(file, "\n");
    }
}

/* Função para verificar se o jogo acabou */
int isGameOver() {
    for (int i = 0; i < SIZE; i++) {
        for (int j = 0; j < SIZE; j++) {
            if (board[i][j] == ' ') {
                return 0; /* Ainda há espaços vazios no tabuleiro */
            }
        }
    }
    return 1; /* O jogo acabou */
}

int main(int argc, char *argv[]) {

    char* filename = NULL; /* Nome do arquivo de saída (se fornecido) */
    FILE* file = NULL; /* Ponteiro para o arquivo de saída */
    for (int i = 1; i < argc; i++) {
        if (strcmp(argv[i], "-f") == 0 && i + 1 < argc) {
            /* A opção -f foi fornecida, armazena o nome do arquivo */
            filename = argv[i + 1];
            i++; /* Pula o próximo argumento, que é o nome do arquivo */
        }
    }
    if (filename != NULL) {
        /* Abre o arquivo de saída para escrita */
        file = fopen(filename, "w");
        if (file == NULL) {
            fprintf(stderr, "Erro ao abrir arquivo de saída.\n");
            exit(1);
        }
    }

    char humanPlayer = 'X'; /* O jogador humano começa com X */
    /* Verificar se o jogador escolheu a opção -p */
    if (argc == 3 && strcmp(argv[1], "-p") == 0) {
        if (strcmp(argv[2], "O") == 0) {
            humanPlayer = 'O'; /* O jogador humano escolheu O */
        } else if (strcmp(argv[2], "X") != 0) {
            printf("Opção inválida para -p. Use -p X ou -p O.\n");
            return 1;
        }
    }

    int row, col;
    int numX, numO, numEmpty;
    char currentPlayer = 'X'; /* O jogador X começa o jogo */
    initializeBoard();

    while (!isGameOver()) {
        printBoard();
        if (currentPlayer == humanPlayer) {
            printf("Jogador %c, faça sua jogada (linha coluna): ", humanPlayer);
            scanf("%d %d", &row, &col);

            if (isValidMove(row - 1, col - 1, humanPlayer)) {
                makeMove(row - 1, col - 1, humanPlayer);
                currentPlayer = (currentPlayer == 'X') ? 'O' : 'X';
            }
            else {
                printf("Jogada inválida. Tente novamente.\n");
            }
        }
        else {
            /* É a vez da inteligência artificial */
            printf("Jogada da IA (%c):\n", currentPlayer);
            makeAIMove(currentPlayer);
            currentPlayer = (currentPlayer == 'X') ? 'O' : 'X';
        }

        countPiecesAndEmptySpaces(&numX, &numO, &numEmpty);
        printf("Peças do jogador X: %d\n", numX);
        printf("Peças do jogador O: %d\n", numO);
        printf("Espaços vazios: %d\n", numEmpty);

        if (file != NULL) {
            /* Grava a jogada no arquivo de saída */
            fprintf(file, "Jogada %c jogou em %d %d.\n", currentPlayer, row, col);
            writeBoardToFile(file, board);
        }
    }

    printf("Jogo acabou! \nResultado: Jogador X - %d peças, Jogador O - %d peças, Espaços vazios - %d\n", numX, numO, numEmpty);
    if(numX > numO){
        printf("Jogador X ganhou!");
    }
    if(numX < numO){
        printf("Jogador O ganhou!");
    }
    if(numX == numO){
        printf("Empate!");
    }
    return 0;
}
