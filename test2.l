%{
#include <stdio.h>
#include <ctype.h>

int minus = 0,majus = 0,autres =0,blancs =0;
%}

/* -- lex options -- */
%option noyywrap

/* -- definitions regulieres -- */

%%

  /* --- regles lexicales --- */
[a-z]   {minus++;}
[A-Z]   {majus++;}
[\ ]    {blancs++;}
\n|\r   {}
.       {autres++;}

%%

int main (int argc, char* argv[]){
    if (argc > 1){
        yyin = fopen(argv[1], "r");
    } else {
        yyin = stdin;
    }
    yylex();
    printf("\nMinuscules : % d, Majuscules : %d, Blancs : %d, Autres : %d\n", minus, majus, blancs, autres);
}

