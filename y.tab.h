/* A Bison parser, made by GNU Bison 2.3.  */

/* Skeleton interface for Bison's Yacc-like parsers in C

   Copyright (C) 1984, 1989, 1990, 2000, 2001, 2002, 2003, 2004, 2005, 2006
   Free Software Foundation, Inc.

   This program is free software; you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation; either version 2, or (at your option)
   any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program; if not, write to the Free Software
   Foundation, Inc., 51 Franklin Street, Fifth Floor,
   Boston, MA 02110-1301, USA.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

/* Tokens.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
   /* Put the tokens into the symbol table, so that GDB and other debuggers
      know about them.  */
   enum yytokentype {
     IF = 258,
     ELSE = 259,
     WHILE = 260,
     INT = 261,
     FLOAT = 262,
     VOID = 263,
     RETURN = 264,
     PLUS = 265,
     MINUS = 266,
     TIMES = 267,
     DIVIDE = 268,
     EQUALS = 269,
     EQUALITY = 270,
     INEQUALITY = 271,
     LESSTHAN = 272,
     GREATERTHAN = 273,
     LESSTHANEQUAL = 274,
     GREATERTHANEQUAL = 275,
     LPAREN = 276,
     RPAREN = 277,
     LBRACE = 278,
     RBRACE = 279,
     LBRACKET = 280,
     RBRACKET = 281,
     COMMA = 282,
     SEMICOLON = 283,
     IDENTIFIER = 284,
     INTEGER = 285,
     FLOATINGPOINT = 286,
     UMINUS = 287
   };
#endif
/* Tokens.  */
#define IF 258
#define ELSE 259
#define WHILE 260
#define INT 261
#define FLOAT 262
#define VOID 263
#define RETURN 264
#define PLUS 265
#define MINUS 266
#define TIMES 267
#define DIVIDE 268
#define EQUALS 269
#define EQUALITY 270
#define INEQUALITY 271
#define LESSTHAN 272
#define GREATERTHAN 273
#define LESSTHANEQUAL 274
#define GREATERTHANEQUAL 275
#define LPAREN 276
#define RPAREN 277
#define LBRACE 278
#define RBRACE 279
#define LBRACKET 280
#define RBRACKET 281
#define COMMA 282
#define SEMICOLON 283
#define IDENTIFIER 284
#define INTEGER 285
#define FLOATINGPOINT 286
#define UMINUS 287




#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef int YYSTYPE;
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
# define YYSTYPE_IS_TRIVIAL 1
#endif

extern YYSTYPE yylval;

