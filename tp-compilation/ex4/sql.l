%{
#include <stdio.h>
%}

%option noyywrap
create (C|c)(R|r)(E|e)(A|a)(T|t)(E|e)
table (T|t)(A|a)(B|b)(L|l)(E|e)
parenthese \(|\)
types INT|int|VARCHAR|varchar|DATE|NUMERIC|numeric|BOOLEAN|boolean
motReserve PRIMARY[[:space:]]+KEY
id [a-zA-Z][a-zA-Z]*|_[a-zA-Z][a-zA-Z]*
nb [0-9]+

%%
{create}        { printf("%-30sCREATE\n", yytext); } 
{table}         { printf("%-30sTABLE\n", yytext); } 
{parenthese}    { printf("%-30s %s\n", yytext,yytext); } 
{types}  	{ printf("%-30sDATATYPE\n", yytext); }
{motReserve}    { printf("%-30sPRIMARY_KEY\n", yytext); }
{id}   		{ printf("%-30sIDENTIFIER\n", yytext); }
,             	{ printf("%-30sCOMMA\n", yytext); } 
{nb}     	{ printf("%-30sNUMBER\n", yytext); }
[[:space:]] 	{/*à ignorer*/}
.             	{ printf("%-30s pas reconnu\n",yytext); }
%%

int main(int argc, char *argv[]) {
    if (argc != 2) {
        fprintf(stderr, "Usage: %s <sql_file>\n", argv[0]);
        return 1;
    }

    FILE *sql_file = fopen(argv[1], "r");
    if (!sql_file) {
        perror("Error opening SQL file");
        return 1;
    }

    // Redirection de l'entrée standard vers le fichier
    yyin = sql_file;

    // Analyse de la requête SQL
    yylex();

    fclose(sql_file);

    return 0;
}
