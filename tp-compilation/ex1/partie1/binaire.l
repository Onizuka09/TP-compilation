%%
(0|1)+ printf("nbre bin");
.* printf("not bin"); 
%%
int yywrap(){return 1;}
int main(int argc,char *argv[]){
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
