%{
	#include "counter.h"
	#include <stdio.h>
	int empty_cnt=0, word_cnt=0, comma_cnt=0, semi_cnt=0, eq_cnt=0, line_cnt=0;
	int num_cnt=0;
	int inc_lexicon(const char*, const char*);
	int get_lexicon(const char*, const char*);
	void print_lexicon();
	void print_type(const char*);
	void print_word(const char*, const char*);
%}
/* Space|Horizontal Tab|Line Feed|Carriage Return|Vertical Tab */
EMPTY 	" "|\x09|\x0D|\x0A|\x0B 
CONSTANT [0-9]*
OPERA	","|";"|":="|"+"|"-"|"*"|"/"|"."|"="|"("|")"|"<"|">"
KEYWORD	"procedure"|"function"|"begin"|"end"|"read"|"write"|"if"|"call"|"repeat"|"then"|"until"|"var"
IDENT 	[a-zA-Z]*
OTHER	.

%%
{EMPTY} 		{empty_cnt++;}
{OPERA} 		{inc_lexicon("Operators", yytext);}
{KEYWORD}		{inc_lexicon("Keywords", yytext);}
{IDENT}			{inc_lexicon("Idents", yytext);}
{CONSTANT}		{inc_lexicon("Constants", yytext);}
{OTHER}			{inc_lexicon("Others", yytext);/* rintf("%d\n", yytext[0]-'\0'); */}
%%

int main() {
	yylex();
	printf("EMPTY: %d\n", empty_cnt);
	print_lexicon();
	return 0;
}