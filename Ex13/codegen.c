#include "parser.h"
#include "backend.h"
#include <stdio.h>

static void geraCodigoDaExpressao(Expressao *expr) {
    switch (expr->tipo) {
    case 'D':
        printf("PUSH %d\n", expr->valor);
        break;
    case 'P':
        geraCodigoDaExpressao(expr->esq);
        geraCodigoDaExpressao(expr->dir);
        switch (expr->oper) {
            case '+':
                printf("ADD\n");
                break;
            case '-':
                printf("SUB\n");
                break;
            case '*':
                printf("MULT\n");
                break;
	        case '/':
                printf("DIV\n");
                break;
            case '%':
                printf("MOD\n");
                break;
        }
        break;
    }
}

void Process(AST_node *icode) {
    geraCodigoDaExpressao(icode);
    printf("PRINT\n");
}