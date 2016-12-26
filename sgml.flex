import java_cup.runtime.*;
%%

%class SGML
%unicode
%line
%column
%cup

/* add everything and not just numbers */

openTag=<
tagName=[A-Z]
endTag=>
orphanClosed=\/{endTag}
closedTag=<\/
flags=\s[a-z]\=\"[0-9]+\,?[0-9]*\"

%%

{openTag}	{return new Symbol(sym.OPEN);}
{tagName}	{return new Symbol(sym.NAME, yytext());}
{endTag}	{return new Symbol(sym.ENDTAG);}
{orphanClosed}	{return new Symbol(sym.ORPHANCLOSURE);}
{closedTag}	{return new Symbol(sym.CLOSED);}
{flags}	{return new Symbol(sym.FLAGS);}
\n {;}
. {;}
