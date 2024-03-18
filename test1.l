%{
#include <stdio.h>
#include <ctype.h>

int nbA = 0;
int nbE = 0;
%}

/* -- lex options -- */
%option noyywrap

/* -- definitions regulieres -- */

a   a|A|à|â|ä|Â|Ä|À
e   e|E|é|è|ê|ë|È|Ê|É

%%

  /* --- regles lexicales --- */
{a}   { nbA++ ; printf("%s(%i)",yytext, nbA); }
{e}   { nbE++; printf("%s(%i)",yytext, nbE); }
.     { printf(yytext); }

%%

int main (int argc, char* argv[]){
    if (argc > 1){
        yyin = fopen(argv[1], "r");
    } else {
        yyin = stdin;
    }
    yylex();
    printf("\nnb A : % d, nb E : %d\n", nbA, nbE);
}

