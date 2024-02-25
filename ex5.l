%{
#include<stdio.h>
#include<math.h>
%}
%%
while|if|else { printf ("%s keywords in C \n",yytext); }
["][[:blank:]]*([a-zA-Z0-9]+[[:blank:]])*["] { printf("[%s] this is a text \n", yytext);}
[#][[:blank:]]*([a-zA-Z0-9]+[[:blank:]]*)*[#] { printf ("[%s] this is a comment \n", yytext); }
[a-zA-Z]+[0-9]*_*[a-zA-Z0-9]* { printf("[%s] this is an Identifier\n",yytext);} 
[0-9]+ { printf("[%s] INT \n",yytext);} 
("<"|"<="|">"|">="|"=="|"!=") { printf ("[%s] OP_REL\n",yytext);}
("=") { printf ("[%s] AFFECt \n", yytext);} 
("+"|"-"|"*"|"/") { printf("[%s] OP-ARITHM \n",yytext);} 
("+"|"-")?[0-9]*[\.][0-9]+ { printf("[%s] %.5f\n", yytext, atof(yytext)); }
("+"|"-")?[0-9]*[\.][0-9]+("e"|"E")[0-9]+ {
    double value = atof(yytext);
    printf("[%s]  -- val: %lf \n", yytext, value );}
. { printf ("[%s] Eroor: \n",yytext);}
%%
int main(){
yylex() ; 
return 0; 
}
int yywrap(){
return 0 ;}
