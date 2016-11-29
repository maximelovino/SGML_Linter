import java.util.Stack;
%%

%class SGML
%unicode
%line
%column
%standalone

/* add everything and not just numbers */

openTags=<([A-Z])(\s[a-z]\=\"[0-9]+,?[0-9]*\")*>
openClosedTags=<([A-Z])(\s[a-z]\=\"[0-9]+,?[0-9]*\")*\/>
closedTags=<\/([A-Z])>

%{eof
	System.out.println();
%eof}

%%
{openTags}	{System.out.print("+"+yytext().charAt(1)+" ");}
{openClosedTags}	{System.out.print(yytext().charAt(1)+" ");}
{closedTags}	{System.out.print("-"+yytext().charAt(2)+" ");}

\n {;}
. {;}
