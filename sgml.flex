import java_cup.runtime.*;
%%

%class SGML
%unicode
%line
%column
%cup

%{
	/*To get the id from a tag if or set, we split to the ", so that the second index (index 1) contains the id*/
	String getIdFromTag(String tag){
		String[] arrayOfTag = tag.split("\"");
		return arrayOfTag[1];
	}
%}

/*We detect the tags in their integrality here*/
openTag=<[A-Z](\s[a-z]\=\"[0-9]*\,[0-9]*\")?>
orphanTag=<[A-Z](\s[a-z]\=\"[0-9]*\,[0-9]*\")?\/>
closingTag=<\/[A-Z]>
openIf=<#if\sid\=\=\"[0-9]*\">
closingIf=<#if\/>
setter=<#set\sid\=\"[0-9]*\"\/>
/*word is any text that is not in a tag, because of the order below*/
word=[A-Za-z]+

%%

{openTag}	{return new Symbol(sym.OPENTAG, yytext());}
{closingTag}	{return new Symbol(sym.CLOSINGTAG, yytext());}
{orphanTag}	{return new Symbol(sym.ORPHAN,yytext());}
{openIf} {return new Symbol(sym.OPENIF,getIdFromTag(yytext()));}
{closingIf} {return new Symbol(sym.CLOSEIF);}
{setter} {return new Symbol(sym.SET,getIdFromTag(yytext()));}
{word} {return new Symbol(sym.CONTENT, yytext());}
/*Used to pass the end of file to CUP*/
<<EOF>> {return new Symbol(sym.EOF);}
\n {;}
\s {;}
. {;}
