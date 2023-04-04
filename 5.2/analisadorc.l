%{
#include <stdio.h>

int escreve(char* lexema, char* categoria) {
    
    FILE *arquivo;
    arquivo = fopen("saida.txt", "a");
    if (arquivo == NULL) {
        printf("Erro ao abrir arquivo.\n");
        return 1;
    }
    fprintf(arquivo, "<%s,%s>\n", categoria, lexema);
    fclose(arquivo);
    return 0;
}


%}

OPERADORES "="|"+"|"-"|"*"|"/"|"%"|"++"|"--"|"=="|"!="|">"|"<"|">="|"<="|"&&"|"||"|"!"|"&"|"|"|"^"|"~"|"<<="|">>="|"+="|"-="|"*="|"/="|"%="|"&="|"|="|"^="|"<<="|">>="|"?"|":"|","|"->"|"."
LETRA [a-zA-Z]
NUMERO [0-9]
RESERVADA "auto"|"break"|"case"|"char"|"const"|"continue"|"default"|"do"|"double"|"else"|"enum"|"extern"|"float"|"for"|"goto"|"if"|"int"|"long"|"register"|"return"|"short"|"signed"|"sizeof"|"static"|"struct"|"switch"|"typedef"|"union"|"unsigned"|"void"|"volatile"|"while"
DELIMITADOR [\(\)\{\}\[\];,]

%%
"//"({LETRA}*{NUMERO}*)*
"/*"([^*]|[\r\n]|(\*+([^*/]|[\r\n])))*\*+"/"
{NUMERO}+{LETRA}{LETRA}*   {printf("ERRO: variável inválida\n");exit(1);}
{OPERADORES}  {escreve(yytext, "");}
{RESERVADA}   {escreve(yytext, "");}
{LETRA}({LETRA}|{NUMERO})*      {escreve(yytext, "id");}
{NUMERO}+     {escreve(yytext, "");}
{DELIMITADOR} {escreve(yytext, "");}
[[:space:]]+
. {printf("ERRO");exit(1);}

%%

int main(void){
    yylex();
    return 0;
}

int yywrap(){
    return 1;
}
