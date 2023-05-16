#include <stdlib.h>
#include <stdio.h>
#include "lex.h"
#include "erro.h"
#include "parser.h"

static Expressao *novaExpressao() {
    return (Expressao *)malloc(sizeof (Expressao));
}

static void liberaExpressao(Expressao *expr) {
    free((void *)expr);
}

static int analisaOperador(Operador *oper) {
    if (Token.classe == OPERADOR) {
        if (Token.representacao == '+'
            || Token.representacao == '-'
            || Token.representacao == '*'
            || Token.representacao == '/'
            || Token.representacao == '%') {
            *oper = Token.representacao;
            pegaProximoToken();
            return 1;
        }
    }
    return 0;
}

static int analisaExpressao(Expressao **expr_p) {
    Expressao *expr = *expr_p = novaExpressao();

    /* Tenta analisar um dígito: */
    if (Token.classe == DIGITO) {
        int valor = 0;
        expr->tipo = 'D'; 
        //Enquanto os digitos forem seguidos
        while (Token.classe == DIGITO) {
            //Valor de acordo com a casa decimal do digito, converte para decimal.
            valor = valor * 10 + (Token.representacao - 48);
            //Busca o proximo token
            pegaProximoToken();
        }
        expr->valor = valor;
        return 1;
    }

    /* Tenta analisar uma expressao com parênteses: */
    if (Token.classe = PARENTESE) {
        if (Token.representacao == '(') {
            expr->tipo = 'P';
            pegaProximoToken();
            if (!analisaExpressao(&expr->esq))
                exibeErro("Falta uma expressão.");
            if (!analisaOperador(&expr->oper))
                exibeErro("Falta um operador.");
            if (!analisaExpressao(&expr->dir))
                exibeErro("Falta uma expressao.");
            if (Token.representacao != ')')
                exibeErro("Falta um ).");
            pegaProximoToken();
            return 1;
        }
    }

    /* Falhou em ambas tentativas */
    liberaExpressao(expr);
    return 0;
}

int analisaPrograma(AST_node **icode_p) {
    Expressao *expr;

    pegaProximoToken(); /* Inicia o analisador léxico */
    if (analisaExpressao(&expr)) {
        if (Token.classe != FIMDEARQUIVO)
            exibeErro("Lixo após o fim do programa.");
        *icode_p = expr;
        return 1;
    }
    return 0;
}