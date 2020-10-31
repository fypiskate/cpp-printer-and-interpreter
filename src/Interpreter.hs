module Interpreter
       ( startInterp
       ) where

import Control.Monad.Free
import Control.Monad.State
import Control.Exception

import qualified Data.Map as M
 
import Data.Maybe
import Data.String.Utils

import Grammar
import Printer


data InterpSt = InterpSt
    { funcs       :: M.Map String Function
    , globalVars  :: M.Map String Variable
    , localVars   :: M.Map String Variable
    }                                        


type Interpreter = StateT InterpSt IO 

data Err = NotDefinedVar String
         | NotDefinedFun String                                                                                          
         | TypeMismatch TypeName TypeName
         | IncorrectInput
         | NotInitVar String
         | WrongNumArgs String
         | ExpectedRet String
         | MainReturn
    

instance Show Err where                               
  show (NotDefinedVar var) = "Variable " ++ var ++ " is undefined."
  show (NotDefinedFun fun) = "Function " ++ fun ++ " is undefined."
  show (TypeMismatch l r)  = "Type " ++ (showCode l) 
                           ++ " cann't match with type " ++ (showCode r) ++ "."
  show (IncorrectInput)    = "Input is incorrect."
  show (NotInitVar var)    = "Variable " ++ var ++ " isn't initialized."
  show (WrongNumArgs fun)  = "Function " ++ fun 
                           ++ " expects a different number of arguments."
  show (ExpectedRet fun)   = "Function " ++ fun ++ " expects return."
  show (MainReturn)        = "Function main expects return 0."

instance Exception Err 




-- | interprets ast
startInterp :: Code -> IO ()
startInterp (Code code) = do
  _ <- evalStateT (interp code) InterpSt { funcs = M.empty
                                         , globalVars = M.empty
                                         , localVars = M.empty
                                         } 
  return ()




interp :: [Single] -> Interpreter()
interp []                    = do
  state@(InterpSt funs _ _) <- get
  case M.lookup "main" funs of
    Just func -> do
      ret <- interpFun func
      case ret of
        IntValue 0 -> return()
        _          -> liftIO $ throwIO MainReturn
    Nothing   -> liftIO $ throwIO $ NotDefinedFun "main"
interp ((Func f):code)       = do
  initFun f 
  interp code
interp ((GlobalVar a):code)  = do
  initGlobalVar a 
  interp code


initFun :: Function -> Interpreter()
initFun f@Function {} = do
  state@(InterpSt funs _ _) <- get
  put state {funcs = (M.insert (funName f) f funs)}


initGlobalVar :: Variable -> Interpreter()
initGlobalVar v@(Variable {}) = do
  state@(InterpSt _ gV _) <- get 
  put state {globalVars = inserting gV v}


initLocalVar :: Variable -> Interpreter()
initLocalVar v@Variable {} = do
  state@(InterpSt _ _ lV) <- get 
  put state {localVars = inserting lV v}
 

updateVar :: Variable -> Expr -> Interpreter ()
updateVar (v@Variable {}) ex = do
  value <- eval ex
 -- state@(InterpSt gF gV lV) <- get
 -- liftIO $ putStrLn "update0"
 -- liftIO $ putStrLn $ showCode value
 -- liftIO $ putStrLn $ showMapG gV
  --liftIO $ putStrLn $ showMapL lV
  let newV = Variable { varType  = varType v
                      , varName  = varName v
                      , varValue = Just $ ValueAtom value
                      }
  state@(InterpSt _ gV lV) <- get
  case M.lookup (varName v) gV of
    Just _  -> do
      put state {globalVars = inserting gV newV}
   --   state@(InterpSt _ gV1 lV1) <- get
   --   liftIO $ putStrLn "update1"
   --   liftIO $ putStrLn $ showMapG gV1
    --  liftIO $ putStrLn $ showMapL lV1
    Nothing -> case M.lookup (varName v) lV of
                 Just _  -> do
                   put state {localVars = inserting lV newV}
        --           state@(InterpSt _ gV2 lV2) <- get
         --          liftIO $ putStrLn "update2"
          --         liftIO $ putStrLn $ showMapG gV2
           --        liftIO $ putStrLn $ showMapL lV2
                 Nothing -> liftIO $ throwIO $ NotDefinedVar $ varName v




inserting :: M.Map String Variable -> Variable -> M.Map String Variable
inserting map v@(Variable {}) = M.insert (varName v) v map

getVar :: String -> Interpreter Variable
getVar name = do
  state@(InterpSt _ gV lV) <- get
  case M.lookup name gV of
    Just value1 -> return value1
    Nothing     -> case M.lookup name lV of
                     Just value2  -> return value2
                     Nothing      -> liftIO $ throwIO $ NotDefinedVar name

getFun :: String -> Interpreter Function
getFun name = do
  state@(InterpSt fs _ _) <- get
  case M.lookup name fs of
    Just func -> return func
    Nothing   -> liftIO $ throwIO $ NotDefinedFun name



interpBlock :: Block -> Interpreter (Maybe Expr)
interpBlock (Free (For from to inc body next)) = do 
  case from of
    Var v -> do
      initLocalVar v
      interpBlock (Free (For Empty to inc body next))
    Assig a -> do
      var <- getVar $ name a
      updateVar var (value a)
      interpBlock (Free (For Empty to inc body next))
    Empty -> do
    --  state@(InterpSt gF gV lV) <- get
    --  liftIO $ putStrLn "first"
    --  liftIO $ putStrLn $ showMapG gV
    --  liftIO $ putStrLn $ showMapL lV
      expr <- eval to
      let exprType = getValueType expr
      case (BoolType == exprType) of
        False -> liftIO $ throwIO $ TypeMismatch BoolType exprType
        True  -> case expr of
                   (BoolValue (True))  -> do
                     interpBlock body
                     var <- getVar $ name inc
                     updateVar var (value inc)
               --      liftIO $ putStrLn "second"
              --       state@(InterpSt _ gV9 lV9) <- get
              --       liftIO $ putStrLn $ showMapG gV9
              --       liftIO $ putStrLn $ showMapL lV9
                     interpBlock (Free (For Empty to inc body next))
                   (BoolValue (False)) -> do
                     interpBlock next
interpBlock while@(Free (While cond body next))    = do 
  expr <- eval cond
  let exprType = getValueType expr
  case (BoolType == exprType) of
    False -> liftIO $ throwIO $ TypeMismatch BoolType exprType
    True  -> case expr of
               (BoolValue (False)) -> interpBlock next
               (BoolValue (True))  -> do
                 interpBlock body
                 --cleanLocal 
                 interpBlock while
interpBlock (Free (If cond body next))             = do
  expr <- eval cond
  let exprType = getValueType expr
  case BoolType == exprType of
    False -> liftIO $ throwIO $ TypeMismatch BoolType exprType 
    True  -> case expr of
               (BoolValue (False)) -> interpBlock next
               (BoolValue (True))  -> do
                 interpBlock body
               --  cleanLocal 
                 interpBlock next
interpBlock (Free (IfElse cond body1 body2 next))  = do
  expr <- eval cond
  let exprType = getValueType expr
  case BoolType == exprType of
    False -> liftIO $ throwIO $ TypeMismatch BoolType exprType 
    True  -> case expr of
               (BoolValue (False)) -> do
                 interpBlock body2 
              --   cleanLocal
                 interpBlock next
               (BoolValue (True))  -> do
                 interpBlock body1 
            --     cleanLocal
                 interpBlock next
interpBlock (Free (Init var next))                 = do 
  initLocalVar var
  interpBlock next
interpBlock (Free (Update assig next))             = do
  var <- getVar $ name assig
  updateVar var (value assig)
  interpBlock next
interpBlock (Free (Part body next))                = do
  interpBlock body
  interpBlock next
interpBlock (Free (Return ret next))               = do
  value <- eval ret
  return $ Just $ ValueAtom value 
interpBlock (Free (Cin inp next))                  = do 
  case inp of
    []   -> interpBlock next
    v:vs -> do
      var <- getVar v
      let typ = varType var
      str <- liftIO getLine
      newValue <- castType str typ 
      updateVar var newValue
      interpBlock (Free (Cin vs next))
interpBlock (Free (Cout outp next))                = do
  case outp of
    []   -> interpBlock next
    [v]  -> do
      res <- eval v
      liftIO $ putStrLn $ showCodeIO res
      interpBlock next
    v:vs -> do
      res <- eval v
      liftIO $ putStr $ showCodeIO res
      interpBlock (Free (Cout vs next))
interpBlock (Pure _)                               = return Nothing


convertToBool :: String -> Maybe Bool
convertToBool "true" = Just True
convertToBool "1" = Just True
convertToBool "false" = Just False
convertToBool "0" = Just False
convertToBool _ = Nothing 

convertToInt :: String -> Maybe Int
convertToInt = maybeRead
 
convertToDouble :: String -> Maybe Double
convertToDouble = maybeRead

castType :: String -> TypeName -> Interpreter Expr
castType str BoolType  = do
   case convertToBool str of
     Just val -> return $  ValueAtom $ BoolValue val
     Nothing  -> liftIO $ throwIO IncorrectInput 
castType str IntType    = do
  case convertToInt str of
    Just val -> return $ ValueAtom $ IntValue val
    Nothing  -> liftIO $ throwIO IncorrectInput 
castType str DoubleType = do
  case convertToDouble str of
    Just val -> return $ ValueAtom $ DoubleValue val
    Nothing  -> liftIO $ throwIO IncorrectInput 
castType str StringType = return $ ValueAtom $ StringValue str

evalBinOp :: BinaryOp -> EvalValue -> EvalValue -> Interpreter EvalValue
evalBinOp Equal (BoolValue l) (BoolValue r)      = return $ BoolValue (l == r)
evalBinOp Equal (IntValue l) (IntValue r)        = return $ BoolValue (l == r)
evalBinOp Equal (DoubleValue l) (DoubleValue r)  = return $ BoolValue (l == r)
evalBinOp Equal (StringValue l) (StringValue r)  = return $ BoolValue (l == r)

evalBinOp Great (IntValue l) (IntValue r)       = return $ BoolValue (l > r)
evalBinOp Great (DoubleValue l) (DoubleValue r) = return $ BoolValue (l > r)
evalBinOp Great (StringValue l) (StringValue r) = return $ BoolValue (l > r)

evalBinOp Less (IntValue l) (IntValue r)         = return $ BoolValue (l < r)
evalBinOp Less (DoubleValue l) (DoubleValue r)   = return $ BoolValue (l < r)
evalBinOp Less (StringValue l) (StringValue r)   = return $ BoolValue (l < r)

evalBinOp Mul (IntValue l) (IntValue r)          = return $ IntValue (l * r)
evalBinOp Mul (DoubleValue l) (DoubleValue r)    = return $ DoubleValue (l * r)

evalBinOp Div (IntValue l) (IntValue r)          = return $ IntValue (l `div` r)
evalBinOp Div (DoubleValue l) (DoubleValue r)    = return $ DoubleValue (l / r)

evalBinOp Add (IntValue l) (IntValue r)          = return $ IntValue (l + r)
evalBinOp Add (DoubleValue l) (DoubleValue r)    = return $ DoubleValue (l + r)

evalBinOp Sub (IntValue l) (IntValue r)          = return $ IntValue (l - r)
evalBinOp Sub (DoubleValue l) (DoubleValue r)    = return $ DoubleValue (l - r)

evalBinOp _ l r = liftIO $ throwIO $ TypeMismatch (getValueType l) 
                                                  (getValueType r)

getValueType :: EvalValue -> TypeName
getValueType (IntValue v)    = IntType
getValueType (DoubleValue v) = DoubleType
getValueType (BoolValue v)   = BoolType
getValueType (StringValue v) = StringType

evalUnOp :: UnaryOp -> EvalValue -> Interpreter EvalValue
evalUnOp Not (BoolValue v)   = return $ BoolValue (not v)
evalUnOp Neg (IntValue v)    = return $ IntValue (-v)
evalUnOp Neg (DoubleValue v) = return $ DoubleValue (-v)
evalUnOp Not v               = liftIO $ throwIO $ TypeMismatch (getValueType v) 
                                                               BoolType
evalUnOp Neg v               = liftIO $ throwIO $ TypeMismatch (getValueType v) 
                                                               IntType


eval :: Expr -> Interpreter EvalValue 
eval bin@BinaryExpr{}  = do
  left <- eval $ leftEx bin
  right <- eval $ rightEx bin
  ans <- evalBinOp (binOp bin) left right
  return ans
eval un@UnaryExpr{}    = do
  ex <- eval $ unEx un
  ans <- evalUnOp (unOp un) ex
  return ans
eval (VarAtom name)      = do
   var <- getVar name
  -- state@(InterpSt gF gV lV) <- get
  -- liftIO $ putStrLn $ showMapG gV
  -- liftIO $ putStrLn $ showMapL lV
   case varValue var of
     Just ex -> eval ex
     Nothing -> liftIO $ throwIO $ NotInitVar $ varName var
eval (ValueAtom v)     = return v
eval (Brackets ex)     = eval ex
eval (CallFun name values) = do
  fun <- getFun name
  newArgs <- assigValue (args fun) values [] (funName fun)
  ret <- interpFun Function{ funType = funType fun
                           , funName = funName fun
                           , args    = newArgs
                           , block   = block fun
                           }
  return ret





assigValue :: [Variable] -> [Expr] -> [Variable] -> String -> Interpreter [Variable]
assigValue [] [] ans _         = return ans
assigValue [] _ ans name       = liftIO $ throwIO $ WrongNumArgs name
assigValue _ [] ans name       = liftIO $ throwIO $ WrongNumArgs name
assigValue (a:as) (e:es) ans n = 
  case varValue a of
    Just _  -> assigValue as (e:es) ans n
    Nothing -> do
      val <- eval e
      assigValue as es (ans ++ [Variable{ varType = varType a
                                        , varName = varName a
                                        , varValue = Just $ ValueAtom val
                                        } ]) n
 



cleanLocal :: Interpreter ()
cleanLocal = do
  state@(InterpSt _ _ lV) <- get
  put state {localVars = M.empty}



interpFun :: Function -> Interpreter EvalValue
interpFun f@(Function {}) = do
  state@(InterpSt gF gV lV) <- get
  put state { globalVars = gV
            , localVars = foldl inserting M.empty (args f)
            }
  expr <- interpBlock $ convertBlock (block f) 
  case expr of
    Nothing -> liftIO $ throwIO $ ExpectedRet $ funName f
    Just r  -> do
      ex <- eval r
      let typeEx = getValueType ex
      case (funType f == typeEx) of
                 False -> liftIO $ throwIO $ TypeMismatch (funType f) typeEx 
                 True  -> do
                            put state { globalVars = gV
                                      , localVars = lV
                                      }
                            ret <- eval r
                            return ret

convertBlock :: [CodeLine] -> Block
convertBlock b = mapM_ convertCode b 

convertCode :: CodeLine -> Block
convertCode (For' c1 c2 c3 b) = liftF $ For c1 c2 c3 (convertBlock b) ()
convertCode (While' e b)      = liftF $ While e (convertBlock b) ()
convertCode (If' e b)         = liftF $ If e (convertBlock b) ()
convertCode (IfElse' e b1 b2) = liftF $ IfElse e (convertBlock b1) 
                                                 (convertBlock b2) ()
convertCode (Init' a)         = liftF $ Init a ()
convertCode (Update' a)       = liftF $ Update a ()
convertCode (Part' b)         = liftF $ Part (convertBlock b) ()
convertCode (Return' ex)      = liftF $ Return ex ()
convertCode (Cin' ex)       = liftF $ Cin ex ()
convertCode (Cout' ex)      = liftF $ Cout ex ()










