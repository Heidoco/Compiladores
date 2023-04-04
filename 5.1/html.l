TAG <\/?[^<>/]+>
ESPACO [[:space:]]*

%%

{ESPACO}"<p"({ESPACO}[^>]+)?>{ESPACO}        {printf("\t");}
{ESPACO}"<br"({ESPACO}[^>]+)?>{ESPACO}       {printf("\n");}
{ESPACO}"<title"({ESPACO}[^>]+)?>{ESPACO}    {printf("!!!");}
{ESPACO}"</title>"{ESPACO}                   {printf("???");}
{ESPACO}{TAG}{ESPACO}

%%

int yywrap();

int main(void){
    yylex();
}

int yywrap(){
    return 1;
}