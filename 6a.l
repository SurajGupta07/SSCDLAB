%{
#include<stdio.h>
int flag=0,n=0,cmt=0;
%}
%%
"//".* {cmt++;}
"/*".*"*/" {cmt++;}
"/*".* {flag=1;n++;}
\n {if (flag==1)n++; else ECHO;}
.*"*/" {if(flag==1)cmt+=n; flag=0; n=0;}
.   {if(flag==0) ECHO;}
%%
int yywrap()
{
      return 1;
}
int main()
{
      yyin=fopen("in.txt","r");
      yyout=fopen("out.txt","w");
      yylex();
      fclose(yyin);
      fclose(yyout);
      printf("no of comment line=%d\n",cmt);
return 0;
}

