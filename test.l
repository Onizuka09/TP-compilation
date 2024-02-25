%{

%}
%%
while|if|else {printf ("%s keywords in C \n",yytext);}
%%
int main(){
yylex() ; 
return 0; 
}
int yywrap(){
return 0 ;}
