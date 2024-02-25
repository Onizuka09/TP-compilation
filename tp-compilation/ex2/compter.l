%{
#include <stdio.h>
int nb_mots = 0;
int nb_lignes = 0;
int nb_caracteres = 0;
%}

%%
\n              { nb_lignes++;}
\t              { nb_caracteres++; } // Compte la tabulation comme un seul caractère
[ ]+            { nb_caracteres += yyleng; } // Compte les espaces
[a-zA-Z0-9]+    { nb_mots++; nb_caracteres += yyleng; }
%%

int yywrap() {
    return 1;
}

int main(int argc, char *argv[]) {
    if (argc != 2) {
        fprintf(stderr, "Usage: %s <input_file>\n", argv[0]);
        return 1;
    }

    FILE *input_file = fopen(argv[1], "r");
    if (!input_file) {
        perror("Error opening file");
        return 1;
    }

    yyin = input_file;

    yylex();

    FILE *output_file = fopen("resultat.txt", "w");
    if (!output_file) {
        perror("Error creating output file");
        return 1;
    }

    fprintf(output_file, "Nombre de mots: %d\n", nb_mots);
    fprintf(output_file, "Nombre de lignes: %d\n", nb_lignes);
    fprintf(output_file, "Nombre de caractères: %d\n", nb_caracteres);

    fclose(input_file);
    fclose(output_file);

    return 0;
}

