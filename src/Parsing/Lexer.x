{
module Parsing.Lexer where
}

%wrapper "basic"

$digit = 0-9
$alpha = [a-zA-Z]

tokens :-
    $white+                      ;
    \(                           { \_ -> LeftP }
    \)                           { \_ -> RightP }
    \+                           { \_ -> PlusT }
    \-                           { \_ -> MinusT }
    \*                           { \_ -> MulT }
    \/                           { \_ -> DivT }
    \<                           { \_ -> LessT}
    \>                           { \_ -> GreatT }
    \=\=                         { \_ -> EqT }
    \!                           { \_ -> NotT }
    for                          { \_ -> ForT }
    if                           { \_ -> IfT }
    while                        { \_ -> WhileT }
    return                       { \_ -> ReturnT }
    cin                          { \_ -> CinT }
    cout                         { \_ -> CoutT }
    int                          { \_ -> IntT }
    double                       { \_ -> DoubleT }
    bool                         { \_ -> BoolT }
    string                       { \_ -> StrT }
    true                         { \_ -> BoolVal True }
    false                        { \_ -> BoolVal False }
    \>\>                         { \_ -> RLineT }
    \<\<                         { \_ -> LLineT }
    \;                           { \_ -> SemiT }
    \,                           { \_ -> CommaT }
    \=                           { \_ -> AsT }
    else                         { \_ -> ElseT }
    [$alpha][$alpha$digit]*      { \s -> Identifier s }
    \{                           { \_ -> LParT }
    \}                           { \_ -> RParT }
    $digit+ \. $digit+           { \s -> DoubleVal (read s) }
    0|[1-9][$digit]*             { \s -> IntVal (read s) }
    \"[^\"]*\"                   { \s -> StrVal (tail $ init s) }

    
{

data Token = PlusT
           | MulT
           | DivT
           | NotT
           | EqT
           | MinusT
           | ForT
           | WhileT
           | IfT
           | ElseT
           | ReturnT
           | CinT
           | CoutT
           | LLineT
           | RLineT
           | SemiT
           | CommaT
           | AsT
           | LessT 
           | GreatT
           | IntT
           | DoubleT
           | StrT
           | BoolT
           | LParT
           | RParT
           | LeftP
           | RightP
           | IntVal Int
           | DoubleVal Double
           | BoolVal Bool
           | StrVal String
           | Identifier String
           deriving (Show, Eq)

}
