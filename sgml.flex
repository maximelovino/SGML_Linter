%%

%class SGML
%unicode
%line
%column
%standalone

/* add everything and not just numbers */

openTag=<
tagName=[A-Z]
endTag=>
orphanClosed=\/{endTag}
closedTag=<\/
flags=\s[a-z]\=\"[0-9]+\,?[0-9]*\"
openIf=<#if\sid\=\=\"[0-9]*\">
closingIf=<#if\/>
setter=<#set\sid\=\"[0-9]*\"\/>

%%

{openTag}	{System.out.println("We've got a opentag");}
{tagName}	{System.out.println("We've got a tagName "+yytext());}
{endTag}	{System.out.println("We've got a endTag");}
{orphanClosed}	{System.out.println("We've got a orphanclosed");}
{closedTag}	{System.out.println("We've got a closed");}
{flags}	{System.out.println("We've got a flags "+yytext());}
{openIf} {System.out.println("Open if: "+ yytext());}
{closingIf} {System.out.println("closing if:");}
{setter} {System.out.println("setter "+yytext());}
\n {;}
. {;}
