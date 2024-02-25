%{
#include <stdio.h>
%}

%%
[a-zA-Z][a-zA-Z0-9]*    { printf("id"); }
(0|[1-9][0-9]*)         { printf("nb"); }
.*                       { printf("not id or nb"); }
%%

int yywrap() {
    return 1;
}

int main(int argc, char *argv[]) {
    ++argv;
    --argc;

    if (argc > 0)
        yyin = fopen(argv[0], "r");
    else
        yyin = stdin;

    freopen("resultat.txt", "w", stdout);

    yylex();

    return 0;
}

