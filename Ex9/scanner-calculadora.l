%{
#define YYSTYPE double
#include "y.tab.h"
%}

ignorar		[ \t]+
digito 		[0-9]
inteiro		{digito}+
real 		{inteiro}("."{inteiro})?

%%

{ignorar} 	{ }
{real} 		{ yylval = atof(yytext); return NUMERO; }

"+"			return MAIS;
"-"			return MENOS;
"*"			return VEZES;
"/"			return DIVIDE;
"^"			return POTENCIA;
"("			return ESQ;
")"			return DIR;
"V"			return RAIZ;
"\n"			return FIM;
