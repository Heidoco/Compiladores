#include "parser.h"
#include "backend.h"
#include "erro.h"

#include <stdio.h>

static int interpretaExpressao(Expressao *expr) {
    switch (expr->tipo) {
        case 'D':
            return expr->valor;
            break;
        case 'P': {
            int e_esq = interpretaExpressao(expr->esq);
            int e_dir = interpretaExpressao(expr->dir);
            switch (expr->oper) {
                case '+': return e_esq + e_dir;
                case '-': return e_esq - e_dir;                
                case '*': return e_esq * e_dir;
                case '/': {
                    if (e_dir != 0) {
                        return e_esq / e_dir;
                    } else {
                        exibeErro("DIVISAO POR 0");
                    }
                }
                case '%': {
                    if (e_dir != 0) {
                        return e_esq % e_dir;
                    } else {
                        exibeErro("DIVISAO POR 0");
                    }
                }
            }
        }
            break;
    }
}

void Process(AST_node *icode) {
    printf("%d\n", interpretaExpressao(icode));
}