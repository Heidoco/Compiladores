#!/bin/bash

# É necessário passar como parâmetro o código-fonte do back-end
BACKEND="$1"

# O arquivo de saída terá o mesmo nome sem a extensão
SAIDA="${BACKEND%.*}"

# Compila os arquivos com o back-end informado e gera o arquivo executável do back-end
gcc lex.c parser.c main.c erro.c "$BACKEND" -o $SAIDA

# Efetua os testes
TESTES=(
	"7"
	"((7+2)*(3+5))"
	"(2*((3* 4)+9))"
	"(2*((3* 4)+((9-1)/2)))"
	"(2-2)"
	"(22-24)"
	"(10%2)"
	"(3%2)"
	"(10%8)"
)
CONTADOR=1
for TESTE in "${TESTES[@]}"
do
	echo "Teste #$CONTADOR: $TESTE"
    # echo $TESTE | ./$SAIDA
    ./$SAIDA <<< "$TESTE"
    CONTADOR=$((CONTADOR + 1))
done