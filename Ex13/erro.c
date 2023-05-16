#include "erro.h"
#include <stdlib.h>
#include <stdio.h>

void exibeErro(char *msg) {
    printf("Erro do compilador demo: %s\n", msg);
    exit (1);
}