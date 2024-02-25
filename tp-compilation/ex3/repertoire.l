%{
#include <stdio.h>
%}

%%

[A-Z][a-zA-Z0-9]*          { printf("Nom: %s\n", yytext); }
[a-z]+([[:blank:]]+[a-z]+)* { printf("Prenom: %s\n", yytext); }
[0-9]{2}[[:blank:]][0-9]{2}[[:blank:]][0-9]{2}[[:blank:]][0-9]{2}[[:blank:]][0-9]{2} { printf("Telephone: %s\n", yytext); } // pour compiler la classe prédéfinie on doit écrire gcc lex.yy.c -o prog -lfl

.                         ; // Ignore les autres caractères

%%

int main(int argc, char *argv[]) {
    if (argc != 2) {
        fprintf(stderr, "Usage: %s <input_file>\n", argv[0]);
        return 1;
    }

    FILE *input_file = fopen(argv[1], "r");
    if (!input_file) {
        perror("Error opening input file");
        return 1;
    }

    // Détermination du nom du fichier de sortie
    char output_filename[] = "resultat.txt";
    FILE *output_file = fopen(output_filename, "w");
    if (!output_file) {
        perror("Error creating output file");
        fclose(input_file);
        return 1;
    }

    yyin = input_file;

    yylex();

    fclose(input_file);
    fclose(output_file);

    printf("Résultats stockés dans \"%s\".\n", output_filename);

    return 0;
}

