module TestParser where

import Test.Hspec

import Parsing.Lexer
import Parsing.Parser
import Grammar
import Printer

program :: String
program = "int main(){ cout << \"Hello world!\" ; return 0;}"

ast :: Code
ast = Code [(Func (Function{ funType = IntType
                           , funName = "main"
                           , args = []
                           , block = [ (Cout' [(ValueAtom $ StringValue "Hello world!")] )
                                     , (Return' (ValueAtom $ IntValue 0) ) ]}))]

spec :: Spec
spec = do
  describe "Parser tests" $ do
    it "helloworld test" $ do
      showCode (parser $ alexScanTokens program) `shouldBe` showCode ast
    

