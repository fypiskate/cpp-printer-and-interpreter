{-# LANGUAGE DeriveFunctor #-}
{-# LANGUAGE FlexibleContexts #-}
 
module Grammar where

import Control.Monad.Free

-- | AST for cpp code
newtype Code   = Code [Single] 

data Single    = Func Function 
               | GlobalVar Variable

data Assig     = Var Variable 
               | Assig SimpleAssig 
               | Empty
               
data Variable  = Variable
               { varType    :: TypeName
               , varName    :: String
               , varValue   :: Maybe Expr
               }
        
data SimpleAssig = SimpleAssig 
                 { name  :: String
                 , value :: Expr
                 }


data TypeName  = IntType
               | DoubleType 
               | BoolType 
               | StringType 
               deriving (Eq)

data Function = Function
               { funType :: TypeName 
               , funName :: String
               , args    :: [Variable] 
               , block   :: [CodeLine]
               } 
              
data CodeLine = For' Assig Expr SimpleAssig [CodeLine]
              | While' Expr [CodeLine]
              | If' Expr [CodeLine]
              | IfElse' Expr [CodeLine] [CodeLine]
              | Init' Variable 
              | Update' SimpleAssig 
              | Part' [CodeLine]
              | Return' Expr 
              | Cin' [String] 
              | Cout' [Expr] 


type Block = Free CodeLineF ()

data CodeLineF next = For Assig Expr SimpleAssig Block next
                    | While Expr Block next
                    | If Expr Block next
                    | IfElse Expr Block Block next
                    | Init Variable next
                    | Update SimpleAssig next
                    | Part Block next
                    | Return Expr next
                    | Cin [String] next
                    | Cout [Expr] next
                    deriving Functor 

data Expr      = BinaryExpr 
               { binOp :: BinaryOp
               , leftEx :: Expr
               , rightEx :: Expr 
               }
               | UnaryExpr 
               { unOp :: UnaryOp
               , unEx :: Expr 
               }
               | VarAtom String 
               | ValueAtom EvalValue
               | CallFun String [Expr]
               | Brackets Expr
              

data BinaryOp  = Equal
               | Great
               | Less 
               | Mul 
               | Div 
               | Add  
               | Sub
            

data UnaryOp   = Not 
               | Neg 
               

data EvalValue = IntValue    Int 
               | DoubleValue Double
               | BoolValue   Bool
               | StringValue String
