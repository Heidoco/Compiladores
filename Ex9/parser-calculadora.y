%{
#include <math.h>
#include <stdio.h>
#define YYSTYPE double
int yyerror (char const *s);
extern int yylex (void);
%}

%token NUMERO
%token MAIS MENOS VEZES DIVIDE POTENCIA RAIZ
%token ESQ DIR
%token FIM

%left MAIS MENOS 
%left VEZES DIVIDE
%left NEG 
%right POTENCIA RAIZ

%define parse.error verbose

%start Inicio

%%

Inicio: ; /* linha vazia */
Inicio: Inicio Linha;

Linha: FIM
Linha: Expressao FIM { printf("Resultado: %f\n", $1); }

Expressao: NUMERO                       { $$ = $1; };
Expressao: Expressao MAIS Expressao     { $$ = $1 + $3; printf("%f + %f\n", $1, $3); };
Expressao: Expressao MENOS Expressao    { $$ = $1 - $3; printf("%f - %f\n", $1, $3); };
Expressao: Expressao VEZES Expressao    { $$ = $1 * $3; printf("%f * %f\n", $1, $3); };
Expressao: Expressao DIVIDE Expressao   { $$ = $1 / $3; printf("%f / %f\n", $1, $3); };
Expressao: MENOS Expressao %prec NEG    { $$ = -$2; printf("- %f\n", $2); };
Expressao: Expressao POTENCIA Expressao { $$ = pow($1, $3); printf("%f ^ %f\n", $1, $3); };
Expressao: RAIZ Expressao	        { $$ = pow($2, 0.5); printf("V %f\n", $2); };
Expressao: ESQ Expressao DIR            { $$ = $2; };

%%

int yyerror(char const *s) {
  printf("%s\n", s);
}

int main() {
  int ret = yyparse();
  if (ret) {
    fprintf(stderr, "%d error found.\n",ret);
  }
  return 0;
}
