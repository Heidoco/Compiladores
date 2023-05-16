#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include "lex.h"
#include "erro.h"

// static int leCaractereIgnoravel(int ch) {
//     return ((ch == ' ' || ch == '\n' || ch == '\t')? 1 : 0);
// }

TipoToken Token;

void pegaProximoToken() {
    int ch;

    /* Pega um non-layout caractere: */
    do {
        ch = getchar();
        if (ch < 0) {
            Token.classe = FIMDEARQUIVO;
            Token.representacao = '#';
            return;
        }
    //} while (leCaractereIgnoravel(ch));
    } while (ch == ' ' || ch == '\n' || ch == '\t');

    /* Classifica o caractere lido: */
    if ('0' <= ch && ch <= '9')
        Token.classe = DIGITO;
    else if (ch == '(' || ch == ')')
        Token.classe = PARENTESE;
    else if (ch == '+' || ch == '-' || ch == '*' || ch == '/' || ch == '%')
        Token.classe = OPERADOR;
    else
        exibeErro("Classe de token desconhecida.");
    	//Token.classe = ch;

    Token.representacao = ch;
}