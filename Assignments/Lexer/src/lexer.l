%e  1019
%p  2807
%n  371
%k  284
%a  1213
%o  1117

O   [0-7]
D   [0-9]
NZ  [1-9]
L   [a-zA-Z_]
A   [a-zA-Z_0-9]
H   [a-fA-F0-9]
HP  (0[xX])
E   ([Ee][+-]?{D}+)
P   ([Pp][+-]?{D}+)
FS  (f|F|l|L)
IS  (((u|U)(l|L|ll|LL)?)|((l|L|ll|LL)(u|U)?))
CP  (u|U|L)
SP  (u8|u|U|L)
ES  (\\(['"\?\\abfnrtv]|[0-7]{1,3}|x[a-fA-F0-9]+))
WS  [ \t\v\n\f]
WSS [ \t\v\f]

%{
#include <stdio.h>

#define sym_type(identifier) IDENTIFIER /* with no symbol table, fake it */

static void comment(void);
static int check_type(void);

/* Define token values */
#define AUTO 1
#define BREAK 2
#define CASE 3
#define CHAR 4
#define CONST 5
#define CONTINUE 6
#define DEFAULT 7
#define DO 8
#define DOUBLE 9
#define ELSE 10
#define ENUM 11
#define EXTERN 12
#define FLOAT 13
#define FOR 14
#define GOTO 15
#define IF 16
#define INLINE 17
#define INT 18
#define LONG 19
#define REGISTER 20
#define RESTRICT 21
#define RETURN 22
#define SHORT 23
#define SIGNED 24
#define SIZEOF 25
#define STATIC 26
#define STRUCT 27
#define SWITCH 28
#define TYPEDEF 29
#define UNION 30
#define UNSIGNED 31
#define VOID 32
#define VOLATILE 33
#define WHILE 34

#define ALIGNAS 35
#define ALIGNOF 36
#define ATOMIC 37
#define BOOL 38
#define COMPLEX 39
#define GENERIC 40
#define IMAGINARY 41
#define NORETURN 42
#define STATIC_ASSERT 43
#define THREAD_LOCAL 44
#define FUNC_NAME 45

#define I_CONSTANT 46
#define F_CONSTANT 47
#define STRING_LITERAL 48
#define IDENTIFIER 49

#define RIGHT_ASSIGN 50
#define LEFT_ASSIGN 51
#define ADD_ASSIGN 52
#define SUB_ASSIGN 53
#define MUL_ASSIGN 54
#define DIV_ASSIGN 55
#define MOD_ASSIGN 56
#define AND_ASSIGN 57
#define XOR_ASSIGN 58
#define OR_ASSIGN 59
#define RIGHT_OP 60
#define LEFT_OP 61
#define INC_OP 62
#define DEC_OP 63
#define PTR_OP 64
#define AND_OP 65
#define OR_OP 66
#define LE_OP 67
#define GE_OP 68
#define EQ_OP 69
#define NE_OP 70
#define ELLIPSIS 71

#define TYPEDEF_NAME 72
#define ENUMERATION_CONSTANT 73

void yyerror(const char *msg) ;
int counter = 0;
void print_token(const char* token_name, const char* lexeme);
#define MAX_ERRORS 1000
char *error_list[MAX_ERRORS];
int error_count = 0;
int error_lines[MAX_ERRORS];
int line_number = 1;

void store_error(const char *lexeme);

void print_errors() ;

%}


%%

\n                {line_number++;}
"/*"                                    { comment(); }
"//".*                                    { /* consume //-comment */ }

"auto"					{ print_token("AUTO", yytext); return(AUTO); }
"break"					{ print_token("BREAK", yytext); return(BREAK); }
"case"					{ print_token("CASE", yytext); return(CASE); }
"char"					{ print_token("CHAR", yytext); return(CHAR); }
"const"					{ print_token("CONST", yytext); return(CONST); }
"continue"				{ print_token("CONTINUE", yytext); return(CONTINUE); }
"default"				{ print_token("DEFAULT", yytext); return(DEFAULT); }
"do"					{ print_token("DO", yytext); return(DO); }
"double"				{ print_token("DOUBLE", yytext); return(DOUBLE); }
"else"					{ print_token("ELSE", yytext); return(ELSE); }
"enum"					{ print_token("ENUM", yytext); return(ENUM); }
"extern"				{ print_token("EXTERN", yytext); return(EXTERN); }
"float"					{ print_token("FLOAT", yytext); return(FLOAT); }
"for"					{ print_token("FOR", yytext); return(FOR); }
"goto"					{ print_token("GOT", yytext); return(GOTO); }
"if"					{ print_token("IF", yytext); return(IF); }
"inline"				{ print_token("INLINE", yytext); return(INLINE); }
"int"					{ print_token("INT", yytext); return(INT); }
"long"					{ print_token("LONG", yytext); return(LONG); }
"register"				{ print_token("REGISTER", yytext); return(REGISTER); }
"restrict"				{ print_token("RESTRICT", yytext); return(RESTRICT); }
"return"				{ print_token("RETURN", yytext); return(RETURN); }
"short"					{ print_token("SHORT", yytext); return(SHORT); }
"signed"				{ print_token("SIGNED", yytext); return(SIGNED); }
"sizeof"				{ print_token("SIZEOF", yytext); return(SIZEOF); }
"static"				{ print_token("STATIC", yytext); return(STATIC); }
"struct"				{ print_token("STRUCT", yytext); return(STRUCT); }
"switch"				{ print_token("SWITCH", yytext); return(SWITCH); }
"typedef"				{ print_token("TYPEDEF", yytext); return(TYPEDEF); }
"union"					{ print_token("UNION", yytext); return(UNION); }
"unsigned"				{ print_token("UNSIGNED", yytext); return(UNSIGNED); }
"void"					{ print_token("VOID", yytext); return(VOID); }
"volatile"				{ print_token("VOLATILE", yytext); return(VOLATILE); }
"while"					{ print_token("WHILE", yytext); return(WHILE); }
"_Alignas"                              { print_token("ALIGNAS", yytext); return ALIGNAS; }
"_Alignof"                              { print_token("ALIGNOF", yytext); return ALIGNOF; }
"_Atomic"                               { print_token("ATOMIC", yytext); return ATOMIC; }
"_Bool"                                 { print_token("BOOL", yytext); return BOOL; }
"_Complex"                              { print_token("COMPLEX", yytext); return COMPLEX; }
"_Generic"                              { print_token("GENERIC", yytext); return GENERIC; }
"_Imaginary"                            { print_token("IMAGINARY", yytext); return IMAGINARY; }
"_Noreturn"                             { print_token("NORETURN", yytext); return NORETURN; }
"_Static_assert"                        { print_token("STATIC_ASSERT", yytext); return STATIC_ASSERT; }
"_Thread_local"                         { print_token("THREAD_LOCAL", yytext); return THREAD_LOCAL; }
"__func__"                              { print_token("FUNC_NAME", yytext); return FUNC_NAME; }

{L}{A}*					{ return check_type(); }

{HP}{H}+{IS}?				{ print_token("I_CONSTANT", yytext); return I_CONSTANT; }
{NZ}{D}*{IS}?				{ print_token("I_CONSTANT", yytext); return I_CONSTANT; }
"0"{O}*{IS}?				{ print_token("I_CONSTANT", yytext); return I_CONSTANT; }
{CP}?"'"([^'\\\n]|{ES})+"'"		{ print_token("CHAR_CONSTANT", yytext); return I_CONSTANT; }

{D}+{E}{FS}?				{ print_token("F_CONSTANT", yytext); return F_CONSTANT; }
{D}*"."{D}+{E}?{FS}?			{ print_token("F_CONSTANT", yytext); return F_CONSTANT; }
{D}+"."{E}?{FS}?			{ print_token("F_CONSTANT", yytext); return F_CONSTANT; }
{HP}{H}+{P}{FS}?			{ print_token("F_CONSTANT", yytext); return F_CONSTANT; }
{HP}{H}*"."{H}+{P}{FS}?			{ print_token("F_CONSTANT", yytext); return F_CONSTANT; }
{HP}{H}+"."{P}{FS}?			{ print_token("F_CONSTANT", yytext); return F_CONSTANT; }

({SP}?\"([^"\\\n]|{ES})*\"{WS}*)+	{ print_token("STRING_LITERAL", yytext);return STRING_LITERAL; }

"..."					{ print_token("ELLIPSIS", yytext); return ELLIPSIS; }
">>="					{ print_token("RIGHT_ASSIGN", yytext); return RIGHT_ASSIGN; }
"<<="					{ print_token("LEFT_ASSIGN", yytext); return LEFT_ASSIGN; }
"+="					{ print_token("ADD_ASSIGN", yytext); return ADD_ASSIGN; }
"-="					{ print_token("SUB_ASSIGN", yytext); return SUB_ASSIGN; }
"*="					{ print_token("MUL_ASSIGN", yytext); return MUL_ASSIGN; }
"/="					{ print_token("DIV_ASSIGN", yytext); return DIV_ASSIGN; }
"%="					{ print_token("MOD_ASSIGN", yytext); return MOD_ASSIGN; }
"&="					{ print_token("AND_ASSIGN", yytext); return AND_ASSIGN; }
"^="					{ print_token("XOR_ASSIGN", yytext); return XOR_ASSIGN; }
"|="					{ print_token("OR_ASSIGN", yytext); return OR_ASSIGN; }
">>"					{ print_token("RIGHT_OP", yytext); return RIGHT_OP; }
"<<"					{ print_token("LEFT_OP", yytext); return LEFT_OP; }
"++"					{ print_token("INC_OP", yytext); return INC_OP; }
"--"					{ print_token("DEC_OP", yytext); return DEC_OP; }
"->"					{ print_token("PTR_OP", yytext); return PTR_OP; }
"&&"					{ print_token("AND_OP", yytext); return AND_OP; }
"||"					{ print_token("OR_OP", yytext); return OR_OP; }
"<="					{ print_token("LE_OP", yytext); return LE_OP; }
">="					{ print_token("GE_OP", yytext); return GE_OP; }
"=="					{ print_token("EQ_OP", yytext); return EQ_OP; }
"!="					{ print_token("NE_OP", yytext); return NE_OP; }
";"					{ print_token("T_;", yytext); return ';'; }
("{"|"<%")				{ print_token("T_{", yytext); return '{'; }
("}"|"%>")				{ print_token("T_}", yytext); return '}'; }
","					{ print_token("T_,", yytext); return ','; }
":"					{ print_token("T_;", yytext); return ':'; }
"="					{ print_token("T_=", yytext); return '='; }
"("					{ print_token("T_(", yytext); return '('; }
")"					{ print_token("T_)", yytext); return ')'; }
("["|"<:")				{ print_token("T_[", yytext); return '['; }
("]"|":>")				{ print_token("T_]", yytext); return ']'; }
"."					{ print_token("T_.", yytext); return '.'; }
"&"					{ print_token("T_&", yytext); return '&'; }
"!"					{ print_token("T_!", yytext); return '!'; }
"~"					{ print_token("T_~", yytext); return '~'; }
"-"					{ print_token("T_-", yytext); return '-'; }
"+"					{ print_token("T_+", yytext); return '+'; }
"*"					{ print_token("T_*", yytext); return '*'; }
"/"					{ print_token("T_/", yytext); return '/'; }
"%"					{ print_token("T_%", yytext); return '%'; }
"<"					{ print_token("T_<", yytext); return '<'; }
">"					{ print_token("T_>", yytext); return '>'; }
"^"					{ print_token("T_^", yytext); return '^'; }
"|"					{ print_token("T_|", yytext); return '|'; }
"?"					{ print_token("T_?", yytext); return '?'; }

{WSS}+					{ /* whitespace separates tokens */ }
.					{ store_error(yytext); /* discard bad characters */ }

%%

int yywrap(void)        /* called at end of input */
{   
    if (counter > 0) {
        printf("|------------|--------------------------------|--------------------------------|\n");
    }
    if (error_count > 0) print_errors();
    return 1;           /* terminate now */
}

static void comment(void)
{
    int c;

    while ((c = input()) != 0)
        if (c == '*')
        {
            while ((c = input()) == '*')
                ;

            if (c == '/')
                return;

            if (c == 0)
                break;
        }
    yyerror("unterminated comment");
}

static int check_type(void)
{
    switch (sym_type(yytext))
    {
    case TYPEDEF_NAME:                /* previously defined */
        print_token("TYPEDEF_NAME", yytext);
        return TYPEDEF_NAME;
    case ENUMERATION_CONSTANT:        /* previously defined */
        print_token("ENUMERATION_CONSTANT", yytext);
        return ENUMERATION_CONSTANT;
    default:                          /* includes undefined */
        print_token("IDENTIFIER", yytext);
        return IDENTIFIER;
    }
}

void print_token(const char* token_name, const char* lexeme) {
    if (counter == 0) {
        printf("|------------|--------------------------------|--------------------------------|\n");
        printf("| %-10s | %-30s | %-30s |\n", "SR NO", "TOKEN NAME", "LEXEME");
        printf("|------------|--------------------------------|--------------------------------|\n");
    }
    printf("| %-10d | %-30s | %-30s |\n", ++counter, token_name, lexeme); 
}

void store_error(const char *lexeme) {
    if (error_count < MAX_ERRORS) {
        error_list[error_count] = strdup(lexeme);
        error_lines[error_count] = line_number;
        error_count++;
    }
}

void print_errors() {
    if (error_count > 0) {
        printf("\nLexical Errors:\n");
        printf("---------------------------\n");
        for (int i = 0; i < error_count; i++) {
            printf("Error: Unrecognized token '%s' at line %d\n", error_list[i], error_lines[i]);
            free(error_list[i]);
        }
        printf("---------------------------\n");
    }
}
void yyerror(const char *msg) {
    printf("\nLexical Errors:\n");
    printf("---------------------------\n");
    fprintf(stderr, "Error: %s at line %d\n", msg, line_number);
    printf("---------------------------\n");
    counter=0;
}