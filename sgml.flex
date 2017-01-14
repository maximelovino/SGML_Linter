import java_cup.runtime.*;
%%

%class SGML
%unicode
%line
%column
%cup

%{
	String getIdFromTag(String tag){
		String[] arrayOfTag = tag.split("\"");
		return arrayOfTag[1];
	}
%}

openTag=<[A-Z](\s[a-z]\=\"[0-9]*\,[0-9]*\")?>
orphanTag=<[A-Z](\s[a-z]\=\"[0-9]*\,[0-9]*\")?\/>
closingTag=<\/[A-Z]>
openIf=<#if\sid\=\=\"[0-9]*\">
closingIf=<#if\/>
setter=<#set\sid\=\"[0-9]*\"\/>
word=[A-Za-z]+

%%

{openTag}	{return new Symbol(sym.OPENTAG, yytext());}
{closingTag}	{return new Symbol(sym.CLOSINGTAG, yytext());}
{orphanTag}	{return new Symbol(sym.ORPHAN,yytext());}
{openIf} {return new Symbol(sym.OPENIF,getIdFromTag(yytext()));}
{closingIf} {return new Symbol(sym.CLOSEIF);}
{setter} {return new Symbol(sym.SET,getIdFromTag(yytext()));}
{word} {return new Symbol(sym.CONTENT, yytext());}
<<EOF>> {return new Symbol(sym.EOF);}
\n {;}
\s {;}
. {;}
