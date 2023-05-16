typedef int Operador;

typedef struct _expressao {
    char tipo; /* 'D' (dígito) ou 'P' (parênteses) */
    int valor; /* Para 'D' */
    struct _expressao *esq, *dir; /* Para 'P' */
    Operador oper; /* Para 'P' */
} Expressao;

typedef Expressao AST_node; /* O nó do topo é uma Expressao */

int analisaPrograma(AST_node **);