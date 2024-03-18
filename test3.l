%{
#include <stdio.h>
#include <ctype.h>

int nbLe = 0;
int nbI = 0;
%}

/* -- lex options -- */
%option noyywrap

/* -- definitions regulieres -- */

e      e|E
l      l|L
le     {l}{e}
i      i|I|y|Y|Ï|ÿ|Ÿ

%%

  /* --- regles lexicales --- */
{le}  { nbLe++ ; printf("LE"); }
{i}   { nbI++; printf("I"); }
.     { printf("%c", toupper(yytext[0])); }

%%

int main (int argc, char* argv[]){
    if (argc > 1){
        yyin = fopen(argv[1], "r");
    } else {
        yyin = stdin;
    }
    yylex();
    printf("\nnb le : %d, nb i : %d\n", nbLe, nbI);
}

