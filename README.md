Executar o exercicio 9:

Gerando o scanner: flex scanner-calculadora.l 
Gerando o parser: bison -y -d parser-calculadora.y 
Compilando os arquivos gerados: gcc lex.yy.c y.tab.c -lfl -lm

