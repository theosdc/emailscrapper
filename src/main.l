%{
#include <stdio.h>
#include <string.h>

    void imprime_sem_ponto(char* string) { 

	int tamanho;
	tamanho = strlen(string);

	int i =0;

	while (i < (tamanho-1)) {
	    printf("%c", string[i]);
	    i++;
	}

	printf("\n");
    }
%}

/* Definicoes */
/* Temos ANUM - caractere do tipo AlfaNUMerico */
/*       ANUME - caractere do tipo AlfaNUMerico + Especiais */

ANUM [A-Za-z0-9]
ANUME  [A-Za-z0-9\.\_\-]
ESP   [\.\-\_]
%%


{ANUM}+\@{ANUM}+ { printf("%s\n", yytext); }

{ANUM}{ANUME}*{ANUM}\@{ANUM}{ANUME}*{ANUM} {printf("%s\n", yytext); }
{ANUM}{ANUME}*{ANUM}\@{ANUM}{ANUME}*{ANUM}\. {imprime_sem_ponto(yytext); }



[[:space:]]+ ;
[[:^space:]]+ ;
[.\n]+ ;


%%

int main() {
  yylex();
  return 0;
}
