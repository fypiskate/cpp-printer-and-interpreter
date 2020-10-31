{
module Parsing.Parser where

import Grammar
import Parsing.Lexer
}

%name      parser
%tokentype { Token }
%error     { parseError }

%token IDEN    { Identifier $$ }
%token MINUS   { MinusT }
%token PLUS    { PlusT }
%token LEFTP   { LeftP }
%token MUL     { MulT }
%token RIGHTP  { RightP }
%token DIV     { DivT }
%token NOT     { NotT }
%token EQ      { EqT }
%token FOR     { ForT }
%token IF      { IfT }
%token WHILE   { WhileT }
%token ELSE    { ElseT }
%token RETURN  { ReturnT }
%token CIN     { CinT }
%token COUT    { CoutT }
%token INT     { IntT }
%token DOUBLE  { DoubleT }
%token BOOL    { BoolT }
%token STR     { StrT }
%token LLINE   { LLineT }
%token RLINE   { RLineT }
%token SEMI    { SemiT }
%token COMMA   { CommaT }
%token AS      { AsT }
%token LESS    { LessT }
%token GREAT   { GreatT }
%token LPAR    { LParT }
%token RPAR    { RParT }
%token INTVAL  { IntVal $$ }
%token BOOLVAL { BoolVal $$ }
%token DOUBLEVAL {DoubleVal $$ }
%token STRVAL { StrVal $$ }

%%

Programm
  : Code           { Code $1 }

Code
  : {- empty -}    { [] }
  | Single Code    { $1 : $2 }

Single
  : Function      { Func $1 }
  | Variable SEMI { GlobalVar $1 }

Assig
  : Variable      { Var $1 }
  | SimpleAssig   { Assig $1 }
  | {- empty -}   { Empty }

Variable
  : TypeName IDEN AS Expr       { Variable $1 $2 (Just $4) }
  | TypeName IDEN               { Variable $1 $2 Nothing }

SimpleAssig
  : IDEN AS Expr { SimpleAssig $1 $3 }

TypeName
  : INT     { IntType }
  | DOUBLE  { DoubleType }
  | BOOL    { BoolType }
  | STR     { StringType }

Function
  : TypeName IDEN LEFTP Args RIGHTP LPAR Block RPAR { Function $1 $2 $4 $7 }

Args
  : {- empty -}          { [] }
  | Variable             { [ $1 ] }
  | Variable COMMA Args  { $1 : $3 } 

Block
  : {- empty -}     { [] }
  | CodeLine Block  { $1 : $2 }

CodeLine
  : FOR LEFTP Assig SEMI Expr SEMI SimpleAssig RIGHTP 
    LPAR Block RPAR                            { For' $3 $5 $7 $10 }
  | WHILE LEFTP Expr RIGHTP LPAR Block RPAR    { While' $3 $6 }
  | IF LEFTP Expr RIGHTP LPAR Block RPAR       { If' $3 $6 } 
  | IF LEFTP Expr RIGHTP LPAR Block RPAR ELSE 
    LPAR Block RPAR                            { IfElse' $3 $6 $10 }
  | Variable SEMI                              { Init' $1 }
  | SimpleAssig SEMI                           { Update' $1 }
  | LPAR Block RPAR                            { Part' $2 }
  | RETURN Expr SEMI                           { Return' $2 }
  | CIN CinArgs SEMI                           { Cin' $2 }
  | COUT CoutArgs SEMI                         { Cout' $2 }


CinArgs
  : {- empty -}         { [] }
  | RLINE IDEN CinArgs  { $2 : $3 }

CoutArgs
  : {- empty -}             { [] }
  | LLINE Expr CoutArgs     { $2 : $3 }


Expr 
  : CompExpr { $1 }

CompExpr
  : AddExpr EQ CompExpr     { BinaryExpr Equal $1 $3 }
  | AddExpr GREAT CompExpr  { BinaryExpr Great $1 $3 }
  | AddExpr LESS CompExpr   { BinaryExpr Less $1 $3 }
  | AddExpr                 { $1 }

AddExpr
  : MultExpr PLUS AddExpr { BinaryExpr Add $1 $3 }
  | MultExpr MINUS AddExpr { BinaryExpr Sub $1 $3 }
  | MultExpr {  $1 }

MultExpr 
  : UnExpr MUL MultExpr { BinaryExpr Mul $1 $3 }
  | UnExpr DIV MultExpr { BinaryExpr Div $1 $3 }
  | UnExpr { $1 }

UnExpr 
  : MINUS UnExpr   { UnaryExpr Neg $2 }
  | NOT UnExpr     { UnaryExpr Not $2 }
  | BaseExpr       { $1 }

BaseExpr 
  : LEFTP Expr RIGHTP  { Brackets $2 }
  | FunCall            { $1 }
  | Value              { ValueAtom $1 }
  | IDEN               { VarAtom $1 }

Value 
  : INTVAL      { IntValue $1 }
  | DOUBLEVAL   { DoubleValue $1 }
  | STRVAL      { StringValue $1 }
  | BOOLVAL     { BoolValue $1 }

FunCall 
  : IDEN LEFTP FunParams RIGHTP { CallFun $1 $3 }

FunParams 
  : {- empty -}            { [] }
  | Expr                   { [ $1 ] }
  | Expr COMMA FunParams   { $1 : $3 }




{
parseError :: [Token] -> a
parseError arg = error $ "Parse error" <> show arg
}
