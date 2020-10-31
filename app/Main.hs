module Main where

import Parsing.Lexer(alexScanTokens)
import Parsing.Parser(parser)
import Interpreter(startInterp)
import Printer(showCode)

import System.Environment

usageMsg :: IO ()
usageMsg = do
  appName <- getProgName
  putStrLn $ "Incorrect usage! Usage: " ++ appName ++ " <-p|-i> <pathToFile>"


main :: IO ()
main = do
  args <- getArgs
  case args of
    ["-p", fName ] -> do
      code <- readFile fName
      putStr $ showCode $ parser $ alexScanTokens $ code
    ["-i", fName ] -> do
      code <- readFile fName
      startInterp $ parser $ alexScanTokens $ code
    _ -> usageMsg

