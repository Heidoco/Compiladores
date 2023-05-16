#include <stdio.h>
#include "parser.h"
#include "backend.h"
#include "erro.h"

/* Ponto de partida do programa */
int main() {
    AST_node *icode;

    if (!analisaPrograma(&icode))
        exibeErro("Não há expressão de nível superior.");
    
    Process(icode);

    return 0;
}