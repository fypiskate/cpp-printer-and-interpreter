{-# LANGUAGE TypeSynonymInstances #-}
{-# LANGUAGE FlexibleContexts #-}
 
module Printer
       ( ShowCode (..)
       , showCodeIO
       ) where

import Grammar
import qualified Data.Map as M

-- | converts values to a valid string for IO
showCodeIO :: EvalValue -> String
showCodeIO (IntValue v)    = show v
showCodeIO (DoubleValue v) = show v
showCodeIO (BoolValue v)   = showBool v
showCodeIO (StringValue v) = v

showBool :: Bool -> String
showBool True  = "true"
showBool False = "false" 

-- | ShowCode class transforms ast to pretty-printed string
class ShowCode a where
  showCode :: a -> String

instance ShowCode Code where
  showCode (Code list) = case list of
    []   -> ""
    x:xs -> (showCode x) ++ "\n" ++ showCode (Code xs)

instance ShowCode Single where
  showCode (Func f)      = showCode f
  showCode (GlobalVar v) = showCode v ++ ";"

instance ShowCode Assig where
  showCode (Var v)   = showCode v
  showCode (Assig a) = showCode a
  showCode Empty     = ""

instance ShowCode Variable where
  showCode v@Variable{} = case (varValue v) of
    Just value -> (showCode $ varType v) 
               ++ " " 
               ++ (varName v)
               ++ " = "
               ++ (showCode value)
    Nothing    -> (showCode $ varType v) 
               ++ " " 
               ++ (varName v)

instance ShowCode SimpleAssig where
  showCode a@SimpleAssig{} =  (name a)
                       ++ " = "
                       ++ (showCode $ value a)
  
instance ShowCode TypeName where
  showCode IntType    = "int"
  showCode DoubleType = "double"
  showCode BoolType   = "bool"
  showCode StringType = "string"

instance ShowCode Function where
  showCode f@Function{} =  (showCode $ funType f)
                    ++ " "
                    ++ (funName f)
                    ++ " ("
                    ++ (showFunArgs $ args f)
                    ++ ") "
                    ++ (showBlock "" (block f))

instance ShowCode Expr where
  showCode bin@BinaryExpr{}     =  (showCode $ leftEx bin) 
                            ++ " " 
                            ++ (showCode $ binOp bin) 
                            ++ " " 
                            ++ (showCode $ rightEx bin)
  showCode un@UnaryExpr{}       =  (showCode $ unOp un) 
                            ++ (showCode $ unEx un)
  showCode (VarAtom v)          =  v
  showCode (ValueAtom v)        =  showCode v
  showCode (CallFun name param) =  (name)
                            ++ "("
                            ++ showFunArgs param
                            ++ ")"
  showCode (Brackets ex)        =  "("
                            ++ (showCode ex)
                            ++ ")" 

instance ShowCode BinaryOp where
  showCode Less  = "<"
  showCode Mul   = "*"
  showCode Div   = "/"
  showCode Add   = "+"
  showCode Sub   = "-"
  showCode Equal = "=="
  showCode Great = ">"

instance ShowCode UnaryOp where
  showCode Neg = "-"
  showCode Not = "!"

instance ShowCode EvalValue where
  showCode (IntValue v)    = show v
  showCode (DoubleValue v) = show v
  showCode (BoolValue v)   = showBool v
  showCode (StringValue v) = show v


showFunArgs :: ShowCode a => [a] -> String
showFunArgs []     =  ""
showFunArgs [v]    =  (showCode v)
showFunArgs (v:vs) =  (showCode v)
                   ++ ", "
                   ++ (showFunArgs vs)


showBlock :: String -> [CodeLine] -> String
showBlock s []    = "{\n\n" 
                  ++ s 
                  ++ "}"
showBlock s block =  "{\n"
                  ++ (showBody ("\t" ++ s) block)  
                  ++ s 
                  ++ "}"


showBody :: String -> [CodeLine] -> String 
showBody s []        = ""
showBody s (line:ls) = s 
                     ++ (showCodeLine s line) 
                     ++ "\n" 
                     ++ (showBody s ls)


showCodeLine :: String -> CodeLine -> String
showCodeLine s (For' c1 c2 c3 block) =  "for (" 
                                     ++ (showCode c1) 
                                     ++ "; " 
                                     ++ (showCode c2) 
                                     ++ "; " 
                                     ++ (showCode c3) 
                                     ++ ")" 
                                     ++ (showBlock s block)
showCodeLine s (While' c block) = "while (" 
                                ++ (showCode c) 
                                ++ ") " 
                                ++ (showBlock s block)
showCodeLine s (If' c block) =  "if (" 
                             ++ (showCode c) 
                             ++ ") " 
                             ++ (showBlock s block)
showCodeLine s (IfElse' c b1 b2) =  "if (" 
                                 ++ (showCode c) 
                                 ++ ") " 
                                 ++ (showBlock s b1) 
                                 ++ " else " 
                                 ++ (showBlock s b2)
showCodeLine s (Init' var)   = showCode var ++ ";"
showCodeLine s (Update' var) = showCode var ++ ";"
showCodeLine s (Part' b)     = showBlock s b 
showCodeLine s (Return' v)   = "return " ++ (showCode v) ++ ";"
showCodeLine s (Cin' vars)   = "cin" ++ (showCinVars vars) ++ ";"
showCodeLine s (Cout' vars)  = "cout" ++ (showCoutVars vars) ++ ";"
                   
             
showCinVars :: [String] -> String
showCinVars []     = ""
showCinVars (v:vs) = " << " ++ v ++ (showCinVars vs)


showCoutVars :: [Expr] -> String
showCoutVars []     = ""
showCoutVars (v:vs) = " >> " ++ (showCode v) ++ (showCoutVars vs)

