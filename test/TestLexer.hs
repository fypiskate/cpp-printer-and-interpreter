module TestLexer where

import Test.Hspec

import Parsing.Lexer

spec :: Spec
spec = do
  describe "Lexer tests" $ do
    it "parse empty" $ do alexScanTokens "" `shouldBe` []
    it "parse while" $ do alexScanTokens "while" `shouldBe` [WhileT]
    it "parse compare operators" $ do
      alexScanTokens "<   >  ==" `shouldBe` [LessT, GreatT, EqT]
    it "parse brackets" $ do
      alexScanTokens "( )" `shouldBe` [LeftP, RightP]
      alexScanTokens "{ }" `shouldBe` [LParT, RParT] 
    it "parse var decl" $ do
      alexScanTokens "int x = 5;"
        `shouldBe` [IntT, Identifier "x", AsT, IntVal 5, SemiT]
    it "parse integer" $ do
      alexScanTokens "42" `shouldBe` [IntVal 42]
    it "parse signed" $ do
      alexScanTokens "-42" `shouldBe` [MinusT, IntVal 42]
    it "parse double" $ do
      alexScanTokens "42.5" `shouldBe` [DoubleVal 42.5]
       
