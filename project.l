%{
    #include<stdio.h>
    #include<string.h>
    #include<stdlib.h>
    char symb[100][100];
    int ptr;
    int search(char s[100]);
    int count=0;
%}
%%
\\\ ;
^#include.* |
^#define.* {printf("<Pre-Processor directive,%s>\n",yytext);}
"abstract"|"break"|"catch"|"const"|"do"|"enum"|"final"|"for" {printf("<Keyword, %s>\n",yytext);}
"implements"|"int"|"module"|"open"|"private"|"public"|"short" {printf("<Keyword, %s>\n",yytext);}
"super"|"this"|"to"|"try"|"volatile"|"assert"|"byte" {printf("<Keyword, %s>\n",yytext);}
"char"|"continue"|"double"|"exports"|"finally"|"goto"|"import"|"interface"|"native" {printf("<Keyword, %s>\n",yytext);}
"opens"|"protected"|"requires"|"static"|"switch"|"throw"|"transient"|"uses"|"while" {printf("<Keyword, %s>\n",yytext);}
"boolean"|"case"|"class"|"default"|"else"|"extends"|"float"|"if"|"instanceof" {printf("<Keyword, %s>\n",yytext);}
"long"|"new"|"package"|"provides"|"return"|"strictfp"|"synchronized"|"throws"|"transitive" {printf("<Keyword, %s>\n",yytext);}
"void"|"with" {printf("<Keyword, %s>\n",yytext);}
[_a-zA-Z][_a-zA-Z0-9]* {ptr=search(yytext);printf("<Identifier,%d>\n",ptr);}
\".*\"|'.*' {printf("<String Constant,%s>\n",yytext);}
[+-]?[0-9]+(.[0-9]+)?([eE][+-]?[0-9]+)? {printf("<Numeric Constant,%s>\n",yytext);}

"=" |
"(" |
")" |
"," |
"*" |
";" |
"[" |
"]" |
"{" |
"}"  {printf("<Special Symbols,%s>\n",yytext);}
"+" |
"-" |
"/" |
"%" |
"++" |
"--" |
"==" |
"!=" |
">" |
"<" |
">=" |
"<=" |
"&&" |
"||" |
"!" |
"&" |
"|" |
"^" |
"~" |
"<<" |
">>" |
">>>" |
"+=" |
"-=" |
"*=" |
"/=" |
"%=" |
"<<=" |
">>=" |
"&=" |
"^=" |
"|=" |
"?:" {printf("<Operators,%s>\n",yytext);}
.|\n {;}
%%
int search(char s[100])
{



int i;

for(i = 0; i < count; i++)
{
    if(strcmp(symb[i], s)==0)
    {
        return i;
    }
    
}
strcpy(symb[i],s);
count++;
return i;



}
int main()
{
    FILE *fp;
    fp= fopen("1b.java","r");
    if(!fp)
    {
        printf("File open Failed\n");
        exit(1);
    }
    yyin=fp;
    printf("Tokens Are :\n");
    yylex();
    return 0;
}

int yywrap ( ){return 0;}
