pairpair (aa|bb)*((ab|ba)(aa|bb)*(ab|ba)(aa|bb)*)*
%%
a*b* printf("|[%s]: des a d'abord et b ensuite\n",yytext);
{pairpair} printf("|[%s]:nombre pair de et est b \n",yytext);
.
%%
int yywrap() {return 1;}
 int main()
 {
 yylex();
 } 
