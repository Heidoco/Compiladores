/* Define classes constantes */
/* Valores 0-255 são reservados (caracteres ASCII) */
#define FIMDEARQUIVO 256
#define DIGITO 257
#define PARENTESE 258
#define OPERADOR 259

typedef struct {
	int classe;
	char representacao;
} TipoToken;

extern TipoToken Token;
void pegaProximoToken();
