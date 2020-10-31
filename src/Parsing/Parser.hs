{-# OPTIONS_GHC -w #-}
module Parsing.Parser where

import Grammar
import Parsing.Lexer
import qualified Data.Array as Happy_Data_Array
import qualified Data.Bits as Bits
import Control.Applicative(Applicative(..))
import Control.Monad (ap)

-- parser produced by Happy Version 1.19.12

data HappyAbsSyn t4 t5 t6 t7 t8 t9 t10 t11 t12 t13 t14 t15 t16 t17 t18 t19 t20 t21 t22 t23 t24 t25
	= HappyTerminal (Token)
	| HappyErrorToken Int
	| HappyAbsSyn4 t4
	| HappyAbsSyn5 t5
	| HappyAbsSyn6 t6
	| HappyAbsSyn7 t7
	| HappyAbsSyn8 t8
	| HappyAbsSyn9 t9
	| HappyAbsSyn10 t10
	| HappyAbsSyn11 t11
	| HappyAbsSyn12 t12
	| HappyAbsSyn13 t13
	| HappyAbsSyn14 t14
	| HappyAbsSyn15 t15
	| HappyAbsSyn16 t16
	| HappyAbsSyn17 t17
	| HappyAbsSyn18 t18
	| HappyAbsSyn19 t19
	| HappyAbsSyn20 t20
	| HappyAbsSyn21 t21
	| HappyAbsSyn22 t22
	| HappyAbsSyn23 t23
	| HappyAbsSyn24 t24
	| HappyAbsSyn25 t25

happyExpList :: Happy_Data_Array.Array Int Int
happyExpList = Happy_Data_Array.listArray (0,309) ([0,0,7680,0,0,0,240,0,0,0,0,0,0,15360,0,0,0,2048,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,32,0,0,0,0,0,0,0,0,0,49152,3,0,5632,1,960,0,0,0,0,0,0,0,0,0,4,24,0,192,0,0,0,80,0,0,0,0,0,0,0,0,0,0,0,0,0,32768,0,0,0,17792,0,240,0,556,32768,7,24576,17,15360,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2048,0,32768,0,0,0,32768,0,0,0,0,0,1,0,0,256,0,0,30720,0,0,0,0,0,0,64,0,0,0,0,0,0,17792,0,240,0,556,32768,7,24576,17,15360,0,35584,0,480,0,1112,0,15,49152,34,30720,0,5632,1,960,0,2224,0,30,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,8,0,4096,0,0,0,0,0,0,0,0,0,0,256,4078,8,0,0,512,0,0,0,16,0,0,0,32,0,57360,33022,0,0,0,128,0,8192,0,0,0,256,0,0,0,8,0,0,22528,4,3840,0,0,2048,0,0,0,32,0,4096,65248,128,0,0,0,0,0,556,32768,7,0,0,0,0,0,0,16,0,0,512,0,49152,34,30720,0,0,32768,0,0,16,0,0,0,0,32,0,11264,2,1920,0,4448,0,60,0,1,15,0,22528,4,3840,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,8,0,0,0,0,0,0,0,0,0,8,0,0,16384,0,0,0,0,0,0,0,0,16,0,0,0,0,0,0,512,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,128,0,0,0,4,0,556,32768,7,0,0,8,0,256,4078,8,0,28680,16511,0,0,0,1024,0,0,0,32,0,16,0,0,0,16,0,0,0,64,0,0,0,0,0,0,0,2048,0,0,0,64,0,32832,1019,2,0,56322,4127,0,0,0,256,0,0,0,8,0,0,0,0,0,0,0,0
	])

{-# NOINLINE happyExpListPerState #-}
happyExpListPerState st =
    token_strs_expected
  where token_strs = ["error","%dummy","%start_parser","Programm","Code","Single","Assig","Variable","SimpleAssig","TypeName","Function","Args","Block","CodeLine","CinArgs","CoutArgs","Expr","CompExpr","AddExpr","MultExpr","UnExpr","BaseExpr","Value","FunCall","FunParams","IDEN","MINUS","PLUS","LEFTP","MUL","RIGHTP","DIV","NOT","EQ","FOR","IF","WHILE","ELSE","RETURN","CIN","COUT","INT","DOUBLE","BOOL","STR","LLINE","RLINE","SEMI","COMMA","AS","LESS","GREAT","LPAR","RPAR","INTVAL","BOOLVAL","DOUBLEVAL","STRVAL","%eof"]
        bit_start = st * 59
        bit_end = (st + 1) * 59
        read_bit = readArrayBit happyExpList
        bits = map read_bit [bit_start..bit_end - 1]
        bits_indexed = zip bits [0..58]
        token_strs_expected = concatMap f bits_indexed
        f (False, _) = []
        f (True, nr) = [token_strs !! nr]

action_0 (42) = happyShift action_7
action_0 (43) = happyShift action_8
action_0 (44) = happyShift action_9
action_0 (45) = happyShift action_10
action_0 (4) = happyGoto action_11
action_0 (5) = happyGoto action_2
action_0 (6) = happyGoto action_3
action_0 (8) = happyGoto action_4
action_0 (10) = happyGoto action_5
action_0 (11) = happyGoto action_6
action_0 _ = happyReduce_2

action_1 (42) = happyShift action_7
action_1 (43) = happyShift action_8
action_1 (44) = happyShift action_9
action_1 (45) = happyShift action_10
action_1 (5) = happyGoto action_2
action_1 (6) = happyGoto action_3
action_1 (8) = happyGoto action_4
action_1 (10) = happyGoto action_5
action_1 (11) = happyGoto action_6
action_1 _ = happyFail (happyExpListPerState 1)

action_2 _ = happyReduce_1

action_3 (42) = happyShift action_7
action_3 (43) = happyShift action_8
action_3 (44) = happyShift action_9
action_3 (45) = happyShift action_10
action_3 (5) = happyGoto action_14
action_3 (6) = happyGoto action_3
action_3 (8) = happyGoto action_4
action_3 (10) = happyGoto action_5
action_3 (11) = happyGoto action_6
action_3 _ = happyReduce_2

action_4 (48) = happyShift action_13
action_4 _ = happyFail (happyExpListPerState 4)

action_5 (26) = happyShift action_12
action_5 _ = happyFail (happyExpListPerState 5)

action_6 _ = happyReduce_4

action_7 _ = happyReduce_12

action_8 _ = happyReduce_13

action_9 _ = happyReduce_14

action_10 _ = happyReduce_15

action_11 (59) = happyAccept
action_11 _ = happyFail (happyExpListPerState 11)

action_12 (29) = happyShift action_15
action_12 (50) = happyShift action_16
action_12 _ = happyReduce_10

action_13 _ = happyReduce_5

action_14 _ = happyReduce_3

action_15 (42) = happyShift action_7
action_15 (43) = happyShift action_8
action_15 (44) = happyShift action_9
action_15 (45) = happyShift action_10
action_15 (8) = happyGoto action_33
action_15 (10) = happyGoto action_34
action_15 (12) = happyGoto action_35
action_15 _ = happyReduce_17

action_16 (26) = happyShift action_25
action_16 (27) = happyShift action_26
action_16 (29) = happyShift action_27
action_16 (33) = happyShift action_28
action_16 (55) = happyShift action_29
action_16 (56) = happyShift action_30
action_16 (57) = happyShift action_31
action_16 (58) = happyShift action_32
action_16 (17) = happyGoto action_17
action_16 (18) = happyGoto action_18
action_16 (19) = happyGoto action_19
action_16 (20) = happyGoto action_20
action_16 (21) = happyGoto action_21
action_16 (22) = happyGoto action_22
action_16 (23) = happyGoto action_23
action_16 (24) = happyGoto action_24
action_16 _ = happyFail (happyExpListPerState 16)

action_17 _ = happyReduce_9

action_18 _ = happyReduce_36

action_19 (34) = happyShift action_47
action_19 (51) = happyShift action_48
action_19 (52) = happyShift action_49
action_19 _ = happyReduce_40

action_20 (27) = happyShift action_45
action_20 (28) = happyShift action_46
action_20 _ = happyReduce_43

action_21 (30) = happyShift action_43
action_21 (32) = happyShift action_44
action_21 _ = happyReduce_46

action_22 _ = happyReduce_49

action_23 _ = happyReduce_52

action_24 _ = happyReduce_51

action_25 (29) = happyShift action_42
action_25 _ = happyReduce_53

action_26 (26) = happyShift action_25
action_26 (27) = happyShift action_26
action_26 (29) = happyShift action_27
action_26 (33) = happyShift action_28
action_26 (55) = happyShift action_29
action_26 (56) = happyShift action_30
action_26 (57) = happyShift action_31
action_26 (58) = happyShift action_32
action_26 (21) = happyGoto action_41
action_26 (22) = happyGoto action_22
action_26 (23) = happyGoto action_23
action_26 (24) = happyGoto action_24
action_26 _ = happyFail (happyExpListPerState 26)

action_27 (26) = happyShift action_25
action_27 (27) = happyShift action_26
action_27 (29) = happyShift action_27
action_27 (33) = happyShift action_28
action_27 (55) = happyShift action_29
action_27 (56) = happyShift action_30
action_27 (57) = happyShift action_31
action_27 (58) = happyShift action_32
action_27 (17) = happyGoto action_40
action_27 (18) = happyGoto action_18
action_27 (19) = happyGoto action_19
action_27 (20) = happyGoto action_20
action_27 (21) = happyGoto action_21
action_27 (22) = happyGoto action_22
action_27 (23) = happyGoto action_23
action_27 (24) = happyGoto action_24
action_27 _ = happyFail (happyExpListPerState 27)

action_28 (26) = happyShift action_25
action_28 (27) = happyShift action_26
action_28 (29) = happyShift action_27
action_28 (33) = happyShift action_28
action_28 (55) = happyShift action_29
action_28 (56) = happyShift action_30
action_28 (57) = happyShift action_31
action_28 (58) = happyShift action_32
action_28 (21) = happyGoto action_39
action_28 (22) = happyGoto action_22
action_28 (23) = happyGoto action_23
action_28 (24) = happyGoto action_24
action_28 _ = happyFail (happyExpListPerState 28)

action_29 _ = happyReduce_54

action_30 _ = happyReduce_57

action_31 _ = happyReduce_55

action_32 _ = happyReduce_56

action_33 (49) = happyShift action_38
action_33 _ = happyReduce_18

action_34 (26) = happyShift action_37
action_34 _ = happyFail (happyExpListPerState 34)

action_35 (31) = happyShift action_36
action_35 _ = happyFail (happyExpListPerState 35)

action_36 (53) = happyShift action_61
action_36 _ = happyFail (happyExpListPerState 36)

action_37 (50) = happyShift action_16
action_37 _ = happyReduce_10

action_38 (42) = happyShift action_7
action_38 (43) = happyShift action_8
action_38 (44) = happyShift action_9
action_38 (45) = happyShift action_10
action_38 (8) = happyGoto action_33
action_38 (10) = happyGoto action_34
action_38 (12) = happyGoto action_60
action_38 _ = happyReduce_17

action_39 _ = happyReduce_48

action_40 (31) = happyShift action_59
action_40 _ = happyFail (happyExpListPerState 40)

action_41 _ = happyReduce_47

action_42 (26) = happyShift action_25
action_42 (27) = happyShift action_26
action_42 (29) = happyShift action_27
action_42 (33) = happyShift action_28
action_42 (55) = happyShift action_29
action_42 (56) = happyShift action_30
action_42 (57) = happyShift action_31
action_42 (58) = happyShift action_32
action_42 (17) = happyGoto action_57
action_42 (18) = happyGoto action_18
action_42 (19) = happyGoto action_19
action_42 (20) = happyGoto action_20
action_42 (21) = happyGoto action_21
action_42 (22) = happyGoto action_22
action_42 (23) = happyGoto action_23
action_42 (24) = happyGoto action_24
action_42 (25) = happyGoto action_58
action_42 _ = happyReduce_59

action_43 (26) = happyShift action_25
action_43 (27) = happyShift action_26
action_43 (29) = happyShift action_27
action_43 (33) = happyShift action_28
action_43 (55) = happyShift action_29
action_43 (56) = happyShift action_30
action_43 (57) = happyShift action_31
action_43 (58) = happyShift action_32
action_43 (20) = happyGoto action_56
action_43 (21) = happyGoto action_21
action_43 (22) = happyGoto action_22
action_43 (23) = happyGoto action_23
action_43 (24) = happyGoto action_24
action_43 _ = happyFail (happyExpListPerState 43)

action_44 (26) = happyShift action_25
action_44 (27) = happyShift action_26
action_44 (29) = happyShift action_27
action_44 (33) = happyShift action_28
action_44 (55) = happyShift action_29
action_44 (56) = happyShift action_30
action_44 (57) = happyShift action_31
action_44 (58) = happyShift action_32
action_44 (20) = happyGoto action_55
action_44 (21) = happyGoto action_21
action_44 (22) = happyGoto action_22
action_44 (23) = happyGoto action_23
action_44 (24) = happyGoto action_24
action_44 _ = happyFail (happyExpListPerState 44)

action_45 (26) = happyShift action_25
action_45 (27) = happyShift action_26
action_45 (29) = happyShift action_27
action_45 (33) = happyShift action_28
action_45 (55) = happyShift action_29
action_45 (56) = happyShift action_30
action_45 (57) = happyShift action_31
action_45 (58) = happyShift action_32
action_45 (19) = happyGoto action_54
action_45 (20) = happyGoto action_20
action_45 (21) = happyGoto action_21
action_45 (22) = happyGoto action_22
action_45 (23) = happyGoto action_23
action_45 (24) = happyGoto action_24
action_45 _ = happyFail (happyExpListPerState 45)

action_46 (26) = happyShift action_25
action_46 (27) = happyShift action_26
action_46 (29) = happyShift action_27
action_46 (33) = happyShift action_28
action_46 (55) = happyShift action_29
action_46 (56) = happyShift action_30
action_46 (57) = happyShift action_31
action_46 (58) = happyShift action_32
action_46 (19) = happyGoto action_53
action_46 (20) = happyGoto action_20
action_46 (21) = happyGoto action_21
action_46 (22) = happyGoto action_22
action_46 (23) = happyGoto action_23
action_46 (24) = happyGoto action_24
action_46 _ = happyFail (happyExpListPerState 46)

action_47 (26) = happyShift action_25
action_47 (27) = happyShift action_26
action_47 (29) = happyShift action_27
action_47 (33) = happyShift action_28
action_47 (55) = happyShift action_29
action_47 (56) = happyShift action_30
action_47 (57) = happyShift action_31
action_47 (58) = happyShift action_32
action_47 (18) = happyGoto action_52
action_47 (19) = happyGoto action_19
action_47 (20) = happyGoto action_20
action_47 (21) = happyGoto action_21
action_47 (22) = happyGoto action_22
action_47 (23) = happyGoto action_23
action_47 (24) = happyGoto action_24
action_47 _ = happyFail (happyExpListPerState 47)

action_48 (26) = happyShift action_25
action_48 (27) = happyShift action_26
action_48 (29) = happyShift action_27
action_48 (33) = happyShift action_28
action_48 (55) = happyShift action_29
action_48 (56) = happyShift action_30
action_48 (57) = happyShift action_31
action_48 (58) = happyShift action_32
action_48 (18) = happyGoto action_51
action_48 (19) = happyGoto action_19
action_48 (20) = happyGoto action_20
action_48 (21) = happyGoto action_21
action_48 (22) = happyGoto action_22
action_48 (23) = happyGoto action_23
action_48 (24) = happyGoto action_24
action_48 _ = happyFail (happyExpListPerState 48)

action_49 (26) = happyShift action_25
action_49 (27) = happyShift action_26
action_49 (29) = happyShift action_27
action_49 (33) = happyShift action_28
action_49 (55) = happyShift action_29
action_49 (56) = happyShift action_30
action_49 (57) = happyShift action_31
action_49 (58) = happyShift action_32
action_49 (18) = happyGoto action_50
action_49 (19) = happyGoto action_19
action_49 (20) = happyGoto action_20
action_49 (21) = happyGoto action_21
action_49 (22) = happyGoto action_22
action_49 (23) = happyGoto action_23
action_49 (24) = happyGoto action_24
action_49 _ = happyFail (happyExpListPerState 49)

action_50 _ = happyReduce_38

action_51 _ = happyReduce_39

action_52 _ = happyReduce_37

action_53 _ = happyReduce_41

action_54 _ = happyReduce_42

action_55 _ = happyReduce_45

action_56 _ = happyReduce_44

action_57 (49) = happyShift action_75
action_57 _ = happyReduce_60

action_58 (31) = happyShift action_74
action_58 _ = happyFail (happyExpListPerState 58)

action_59 _ = happyReduce_50

action_60 _ = happyReduce_19

action_61 (26) = happyShift action_66
action_61 (35) = happyShift action_67
action_61 (36) = happyShift action_68
action_61 (37) = happyShift action_69
action_61 (39) = happyShift action_70
action_61 (40) = happyShift action_71
action_61 (41) = happyShift action_72
action_61 (42) = happyShift action_7
action_61 (43) = happyShift action_8
action_61 (44) = happyShift action_9
action_61 (45) = happyShift action_10
action_61 (53) = happyShift action_73
action_61 (8) = happyGoto action_62
action_61 (9) = happyGoto action_63
action_61 (10) = happyGoto action_34
action_61 (13) = happyGoto action_64
action_61 (14) = happyGoto action_65
action_61 _ = happyReduce_20

action_62 (48) = happyShift action_90
action_62 _ = happyFail (happyExpListPerState 62)

action_63 (48) = happyShift action_89
action_63 _ = happyFail (happyExpListPerState 63)

action_64 (54) = happyShift action_88
action_64 _ = happyFail (happyExpListPerState 64)

action_65 (26) = happyShift action_66
action_65 (35) = happyShift action_67
action_65 (36) = happyShift action_68
action_65 (37) = happyShift action_69
action_65 (39) = happyShift action_70
action_65 (40) = happyShift action_71
action_65 (41) = happyShift action_72
action_65 (42) = happyShift action_7
action_65 (43) = happyShift action_8
action_65 (44) = happyShift action_9
action_65 (45) = happyShift action_10
action_65 (53) = happyShift action_73
action_65 (8) = happyGoto action_62
action_65 (9) = happyGoto action_63
action_65 (10) = happyGoto action_34
action_65 (13) = happyGoto action_87
action_65 (14) = happyGoto action_65
action_65 _ = happyReduce_20

action_66 (50) = happyShift action_86
action_66 _ = happyFail (happyExpListPerState 66)

action_67 (29) = happyShift action_85
action_67 _ = happyFail (happyExpListPerState 67)

action_68 (29) = happyShift action_84
action_68 _ = happyFail (happyExpListPerState 68)

action_69 (29) = happyShift action_83
action_69 _ = happyFail (happyExpListPerState 69)

action_70 (26) = happyShift action_25
action_70 (27) = happyShift action_26
action_70 (29) = happyShift action_27
action_70 (33) = happyShift action_28
action_70 (55) = happyShift action_29
action_70 (56) = happyShift action_30
action_70 (57) = happyShift action_31
action_70 (58) = happyShift action_32
action_70 (17) = happyGoto action_82
action_70 (18) = happyGoto action_18
action_70 (19) = happyGoto action_19
action_70 (20) = happyGoto action_20
action_70 (21) = happyGoto action_21
action_70 (22) = happyGoto action_22
action_70 (23) = happyGoto action_23
action_70 (24) = happyGoto action_24
action_70 _ = happyFail (happyExpListPerState 70)

action_71 (47) = happyShift action_81
action_71 (15) = happyGoto action_80
action_71 _ = happyReduce_32

action_72 (46) = happyShift action_79
action_72 (16) = happyGoto action_78
action_72 _ = happyReduce_34

action_73 (26) = happyShift action_66
action_73 (35) = happyShift action_67
action_73 (36) = happyShift action_68
action_73 (37) = happyShift action_69
action_73 (39) = happyShift action_70
action_73 (40) = happyShift action_71
action_73 (41) = happyShift action_72
action_73 (42) = happyShift action_7
action_73 (43) = happyShift action_8
action_73 (44) = happyShift action_9
action_73 (45) = happyShift action_10
action_73 (53) = happyShift action_73
action_73 (8) = happyGoto action_62
action_73 (9) = happyGoto action_63
action_73 (10) = happyGoto action_34
action_73 (13) = happyGoto action_77
action_73 (14) = happyGoto action_65
action_73 _ = happyReduce_20

action_74 _ = happyReduce_58

action_75 (26) = happyShift action_25
action_75 (27) = happyShift action_26
action_75 (29) = happyShift action_27
action_75 (33) = happyShift action_28
action_75 (55) = happyShift action_29
action_75 (56) = happyShift action_30
action_75 (57) = happyShift action_31
action_75 (58) = happyShift action_32
action_75 (17) = happyGoto action_57
action_75 (18) = happyGoto action_18
action_75 (19) = happyGoto action_19
action_75 (20) = happyGoto action_20
action_75 (21) = happyGoto action_21
action_75 (22) = happyGoto action_22
action_75 (23) = happyGoto action_23
action_75 (24) = happyGoto action_24
action_75 (25) = happyGoto action_76
action_75 _ = happyReduce_59

action_76 _ = happyReduce_61

action_77 (54) = happyShift action_102
action_77 _ = happyFail (happyExpListPerState 77)

action_78 (48) = happyShift action_101
action_78 _ = happyFail (happyExpListPerState 78)

action_79 (26) = happyShift action_25
action_79 (27) = happyShift action_26
action_79 (29) = happyShift action_27
action_79 (33) = happyShift action_28
action_79 (55) = happyShift action_29
action_79 (56) = happyShift action_30
action_79 (57) = happyShift action_31
action_79 (58) = happyShift action_32
action_79 (17) = happyGoto action_100
action_79 (18) = happyGoto action_18
action_79 (19) = happyGoto action_19
action_79 (20) = happyGoto action_20
action_79 (21) = happyGoto action_21
action_79 (22) = happyGoto action_22
action_79 (23) = happyGoto action_23
action_79 (24) = happyGoto action_24
action_79 _ = happyFail (happyExpListPerState 79)

action_80 (48) = happyShift action_99
action_80 _ = happyFail (happyExpListPerState 80)

action_81 (26) = happyShift action_98
action_81 _ = happyFail (happyExpListPerState 81)

action_82 (48) = happyShift action_97
action_82 _ = happyFail (happyExpListPerState 82)

action_83 (26) = happyShift action_25
action_83 (27) = happyShift action_26
action_83 (29) = happyShift action_27
action_83 (33) = happyShift action_28
action_83 (55) = happyShift action_29
action_83 (56) = happyShift action_30
action_83 (57) = happyShift action_31
action_83 (58) = happyShift action_32
action_83 (17) = happyGoto action_96
action_83 (18) = happyGoto action_18
action_83 (19) = happyGoto action_19
action_83 (20) = happyGoto action_20
action_83 (21) = happyGoto action_21
action_83 (22) = happyGoto action_22
action_83 (23) = happyGoto action_23
action_83 (24) = happyGoto action_24
action_83 _ = happyFail (happyExpListPerState 83)

action_84 (26) = happyShift action_25
action_84 (27) = happyShift action_26
action_84 (29) = happyShift action_27
action_84 (33) = happyShift action_28
action_84 (55) = happyShift action_29
action_84 (56) = happyShift action_30
action_84 (57) = happyShift action_31
action_84 (58) = happyShift action_32
action_84 (17) = happyGoto action_95
action_84 (18) = happyGoto action_18
action_84 (19) = happyGoto action_19
action_84 (20) = happyGoto action_20
action_84 (21) = happyGoto action_21
action_84 (22) = happyGoto action_22
action_84 (23) = happyGoto action_23
action_84 (24) = happyGoto action_24
action_84 _ = happyFail (happyExpListPerState 84)

action_85 (26) = happyShift action_66
action_85 (42) = happyShift action_7
action_85 (43) = happyShift action_8
action_85 (44) = happyShift action_9
action_85 (45) = happyShift action_10
action_85 (7) = happyGoto action_92
action_85 (8) = happyGoto action_93
action_85 (9) = happyGoto action_94
action_85 (10) = happyGoto action_34
action_85 _ = happyReduce_8

action_86 (26) = happyShift action_25
action_86 (27) = happyShift action_26
action_86 (29) = happyShift action_27
action_86 (33) = happyShift action_28
action_86 (55) = happyShift action_29
action_86 (56) = happyShift action_30
action_86 (57) = happyShift action_31
action_86 (58) = happyShift action_32
action_86 (17) = happyGoto action_91
action_86 (18) = happyGoto action_18
action_86 (19) = happyGoto action_19
action_86 (20) = happyGoto action_20
action_86 (21) = happyGoto action_21
action_86 (22) = happyGoto action_22
action_86 (23) = happyGoto action_23
action_86 (24) = happyGoto action_24
action_86 _ = happyFail (happyExpListPerState 86)

action_87 _ = happyReduce_21

action_88 _ = happyReduce_16

action_89 _ = happyReduce_27

action_90 _ = happyReduce_26

action_91 _ = happyReduce_11

action_92 (48) = happyShift action_107
action_92 _ = happyFail (happyExpListPerState 92)

action_93 _ = happyReduce_6

action_94 _ = happyReduce_7

action_95 (31) = happyShift action_106
action_95 _ = happyFail (happyExpListPerState 95)

action_96 (31) = happyShift action_105
action_96 _ = happyFail (happyExpListPerState 96)

action_97 _ = happyReduce_29

action_98 (47) = happyShift action_81
action_98 (15) = happyGoto action_104
action_98 _ = happyReduce_32

action_99 _ = happyReduce_30

action_100 (46) = happyShift action_79
action_100 (16) = happyGoto action_103
action_100 _ = happyReduce_34

action_101 _ = happyReduce_31

action_102 _ = happyReduce_28

action_103 _ = happyReduce_35

action_104 _ = happyReduce_33

action_105 (53) = happyShift action_110
action_105 _ = happyFail (happyExpListPerState 105)

action_106 (53) = happyShift action_109
action_106 _ = happyFail (happyExpListPerState 106)

action_107 (26) = happyShift action_25
action_107 (27) = happyShift action_26
action_107 (29) = happyShift action_27
action_107 (33) = happyShift action_28
action_107 (55) = happyShift action_29
action_107 (56) = happyShift action_30
action_107 (57) = happyShift action_31
action_107 (58) = happyShift action_32
action_107 (17) = happyGoto action_108
action_107 (18) = happyGoto action_18
action_107 (19) = happyGoto action_19
action_107 (20) = happyGoto action_20
action_107 (21) = happyGoto action_21
action_107 (22) = happyGoto action_22
action_107 (23) = happyGoto action_23
action_107 (24) = happyGoto action_24
action_107 _ = happyFail (happyExpListPerState 107)

action_108 (48) = happyShift action_113
action_108 _ = happyFail (happyExpListPerState 108)

action_109 (26) = happyShift action_66
action_109 (35) = happyShift action_67
action_109 (36) = happyShift action_68
action_109 (37) = happyShift action_69
action_109 (39) = happyShift action_70
action_109 (40) = happyShift action_71
action_109 (41) = happyShift action_72
action_109 (42) = happyShift action_7
action_109 (43) = happyShift action_8
action_109 (44) = happyShift action_9
action_109 (45) = happyShift action_10
action_109 (53) = happyShift action_73
action_109 (8) = happyGoto action_62
action_109 (9) = happyGoto action_63
action_109 (10) = happyGoto action_34
action_109 (13) = happyGoto action_112
action_109 (14) = happyGoto action_65
action_109 _ = happyReduce_20

action_110 (26) = happyShift action_66
action_110 (35) = happyShift action_67
action_110 (36) = happyShift action_68
action_110 (37) = happyShift action_69
action_110 (39) = happyShift action_70
action_110 (40) = happyShift action_71
action_110 (41) = happyShift action_72
action_110 (42) = happyShift action_7
action_110 (43) = happyShift action_8
action_110 (44) = happyShift action_9
action_110 (45) = happyShift action_10
action_110 (53) = happyShift action_73
action_110 (8) = happyGoto action_62
action_110 (9) = happyGoto action_63
action_110 (10) = happyGoto action_34
action_110 (13) = happyGoto action_111
action_110 (14) = happyGoto action_65
action_110 _ = happyReduce_20

action_111 (54) = happyShift action_116
action_111 _ = happyFail (happyExpListPerState 111)

action_112 (54) = happyShift action_115
action_112 _ = happyFail (happyExpListPerState 112)

action_113 (26) = happyShift action_66
action_113 (9) = happyGoto action_114
action_113 _ = happyFail (happyExpListPerState 113)

action_114 (31) = happyShift action_118
action_114 _ = happyFail (happyExpListPerState 114)

action_115 (38) = happyShift action_117
action_115 _ = happyReduce_24

action_116 _ = happyReduce_23

action_117 (53) = happyShift action_120
action_117 _ = happyFail (happyExpListPerState 117)

action_118 (53) = happyShift action_119
action_118 _ = happyFail (happyExpListPerState 118)

action_119 (26) = happyShift action_66
action_119 (35) = happyShift action_67
action_119 (36) = happyShift action_68
action_119 (37) = happyShift action_69
action_119 (39) = happyShift action_70
action_119 (40) = happyShift action_71
action_119 (41) = happyShift action_72
action_119 (42) = happyShift action_7
action_119 (43) = happyShift action_8
action_119 (44) = happyShift action_9
action_119 (45) = happyShift action_10
action_119 (53) = happyShift action_73
action_119 (8) = happyGoto action_62
action_119 (9) = happyGoto action_63
action_119 (10) = happyGoto action_34
action_119 (13) = happyGoto action_122
action_119 (14) = happyGoto action_65
action_119 _ = happyReduce_20

action_120 (26) = happyShift action_66
action_120 (35) = happyShift action_67
action_120 (36) = happyShift action_68
action_120 (37) = happyShift action_69
action_120 (39) = happyShift action_70
action_120 (40) = happyShift action_71
action_120 (41) = happyShift action_72
action_120 (42) = happyShift action_7
action_120 (43) = happyShift action_8
action_120 (44) = happyShift action_9
action_120 (45) = happyShift action_10
action_120 (53) = happyShift action_73
action_120 (8) = happyGoto action_62
action_120 (9) = happyGoto action_63
action_120 (10) = happyGoto action_34
action_120 (13) = happyGoto action_121
action_120 (14) = happyGoto action_65
action_120 _ = happyReduce_20

action_121 (54) = happyShift action_124
action_121 _ = happyFail (happyExpListPerState 121)

action_122 (54) = happyShift action_123
action_122 _ = happyFail (happyExpListPerState 122)

action_123 _ = happyReduce_22

action_124 _ = happyReduce_25

happyReduce_1 = happySpecReduce_1  4 happyReduction_1
happyReduction_1 (HappyAbsSyn5  happy_var_1)
	 =  HappyAbsSyn4
		 (Code happy_var_1
	)
happyReduction_1 _  = notHappyAtAll 

happyReduce_2 = happySpecReduce_0  5 happyReduction_2
happyReduction_2  =  HappyAbsSyn5
		 ([]
	)

happyReduce_3 = happySpecReduce_2  5 happyReduction_3
happyReduction_3 (HappyAbsSyn5  happy_var_2)
	(HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn5
		 (happy_var_1 : happy_var_2
	)
happyReduction_3 _ _  = notHappyAtAll 

happyReduce_4 = happySpecReduce_1  6 happyReduction_4
happyReduction_4 (HappyAbsSyn11  happy_var_1)
	 =  HappyAbsSyn6
		 (Func happy_var_1
	)
happyReduction_4 _  = notHappyAtAll 

happyReduce_5 = happySpecReduce_2  6 happyReduction_5
happyReduction_5 _
	(HappyAbsSyn8  happy_var_1)
	 =  HappyAbsSyn6
		 (GlobalVar happy_var_1
	)
happyReduction_5 _ _  = notHappyAtAll 

happyReduce_6 = happySpecReduce_1  7 happyReduction_6
happyReduction_6 (HappyAbsSyn8  happy_var_1)
	 =  HappyAbsSyn7
		 (Var happy_var_1
	)
happyReduction_6 _  = notHappyAtAll 

happyReduce_7 = happySpecReduce_1  7 happyReduction_7
happyReduction_7 (HappyAbsSyn9  happy_var_1)
	 =  HappyAbsSyn7
		 (Assig happy_var_1
	)
happyReduction_7 _  = notHappyAtAll 

happyReduce_8 = happySpecReduce_0  7 happyReduction_8
happyReduction_8  =  HappyAbsSyn7
		 (Empty
	)

happyReduce_9 = happyReduce 4 8 happyReduction_9
happyReduction_9 ((HappyAbsSyn17  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (Identifier happy_var_2)) `HappyStk`
	(HappyAbsSyn10  happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn8
		 (Variable happy_var_1 happy_var_2 (Just happy_var_4)
	) `HappyStk` happyRest

happyReduce_10 = happySpecReduce_2  8 happyReduction_10
happyReduction_10 (HappyTerminal (Identifier happy_var_2))
	(HappyAbsSyn10  happy_var_1)
	 =  HappyAbsSyn8
		 (Variable happy_var_1 happy_var_2 Nothing
	)
happyReduction_10 _ _  = notHappyAtAll 

happyReduce_11 = happySpecReduce_3  9 happyReduction_11
happyReduction_11 (HappyAbsSyn17  happy_var_3)
	_
	(HappyTerminal (Identifier happy_var_1))
	 =  HappyAbsSyn9
		 (SimpleAssig happy_var_1 happy_var_3
	)
happyReduction_11 _ _ _  = notHappyAtAll 

happyReduce_12 = happySpecReduce_1  10 happyReduction_12
happyReduction_12 _
	 =  HappyAbsSyn10
		 (IntType
	)

happyReduce_13 = happySpecReduce_1  10 happyReduction_13
happyReduction_13 _
	 =  HappyAbsSyn10
		 (DoubleType
	)

happyReduce_14 = happySpecReduce_1  10 happyReduction_14
happyReduction_14 _
	 =  HappyAbsSyn10
		 (BoolType
	)

happyReduce_15 = happySpecReduce_1  10 happyReduction_15
happyReduction_15 _
	 =  HappyAbsSyn10
		 (StringType
	)

happyReduce_16 = happyReduce 8 11 happyReduction_16
happyReduction_16 (_ `HappyStk`
	(HappyAbsSyn13  happy_var_7) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn12  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (Identifier happy_var_2)) `HappyStk`
	(HappyAbsSyn10  happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn11
		 (Function happy_var_1 happy_var_2 happy_var_4 happy_var_7
	) `HappyStk` happyRest

happyReduce_17 = happySpecReduce_0  12 happyReduction_17
happyReduction_17  =  HappyAbsSyn12
		 ([]
	)

happyReduce_18 = happySpecReduce_1  12 happyReduction_18
happyReduction_18 (HappyAbsSyn8  happy_var_1)
	 =  HappyAbsSyn12
		 ([ happy_var_1 ]
	)
happyReduction_18 _  = notHappyAtAll 

happyReduce_19 = happySpecReduce_3  12 happyReduction_19
happyReduction_19 (HappyAbsSyn12  happy_var_3)
	_
	(HappyAbsSyn8  happy_var_1)
	 =  HappyAbsSyn12
		 (happy_var_1 : happy_var_3
	)
happyReduction_19 _ _ _  = notHappyAtAll 

happyReduce_20 = happySpecReduce_0  13 happyReduction_20
happyReduction_20  =  HappyAbsSyn13
		 ([]
	)

happyReduce_21 = happySpecReduce_2  13 happyReduction_21
happyReduction_21 (HappyAbsSyn13  happy_var_2)
	(HappyAbsSyn14  happy_var_1)
	 =  HappyAbsSyn13
		 (happy_var_1 : happy_var_2
	)
happyReduction_21 _ _  = notHappyAtAll 

happyReduce_22 = happyReduce 11 14 happyReduction_22
happyReduction_22 (_ `HappyStk`
	(HappyAbsSyn13  happy_var_10) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn9  happy_var_7) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn17  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn7  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn14
		 (For' happy_var_3 happy_var_5 happy_var_7 happy_var_10
	) `HappyStk` happyRest

happyReduce_23 = happyReduce 7 14 happyReduction_23
happyReduction_23 (_ `HappyStk`
	(HappyAbsSyn13  happy_var_6) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn17  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn14
		 (While' happy_var_3 happy_var_6
	) `HappyStk` happyRest

happyReduce_24 = happyReduce 7 14 happyReduction_24
happyReduction_24 (_ `HappyStk`
	(HappyAbsSyn13  happy_var_6) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn17  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn14
		 (If' happy_var_3 happy_var_6
	) `HappyStk` happyRest

happyReduce_25 = happyReduce 11 14 happyReduction_25
happyReduction_25 (_ `HappyStk`
	(HappyAbsSyn13  happy_var_10) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn13  happy_var_6) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn17  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn14
		 (IfElse' happy_var_3 happy_var_6 happy_var_10
	) `HappyStk` happyRest

happyReduce_26 = happySpecReduce_2  14 happyReduction_26
happyReduction_26 _
	(HappyAbsSyn8  happy_var_1)
	 =  HappyAbsSyn14
		 (Init' happy_var_1
	)
happyReduction_26 _ _  = notHappyAtAll 

happyReduce_27 = happySpecReduce_2  14 happyReduction_27
happyReduction_27 _
	(HappyAbsSyn9  happy_var_1)
	 =  HappyAbsSyn14
		 (Update' happy_var_1
	)
happyReduction_27 _ _  = notHappyAtAll 

happyReduce_28 = happySpecReduce_3  14 happyReduction_28
happyReduction_28 _
	(HappyAbsSyn13  happy_var_2)
	_
	 =  HappyAbsSyn14
		 (Part' happy_var_2
	)
happyReduction_28 _ _ _  = notHappyAtAll 

happyReduce_29 = happySpecReduce_3  14 happyReduction_29
happyReduction_29 _
	(HappyAbsSyn17  happy_var_2)
	_
	 =  HappyAbsSyn14
		 (Return' happy_var_2
	)
happyReduction_29 _ _ _  = notHappyAtAll 

happyReduce_30 = happySpecReduce_3  14 happyReduction_30
happyReduction_30 _
	(HappyAbsSyn15  happy_var_2)
	_
	 =  HappyAbsSyn14
		 (Cin' happy_var_2
	)
happyReduction_30 _ _ _  = notHappyAtAll 

happyReduce_31 = happySpecReduce_3  14 happyReduction_31
happyReduction_31 _
	(HappyAbsSyn16  happy_var_2)
	_
	 =  HappyAbsSyn14
		 (Cout' happy_var_2
	)
happyReduction_31 _ _ _  = notHappyAtAll 

happyReduce_32 = happySpecReduce_0  15 happyReduction_32
happyReduction_32  =  HappyAbsSyn15
		 ([]
	)

happyReduce_33 = happySpecReduce_3  15 happyReduction_33
happyReduction_33 (HappyAbsSyn15  happy_var_3)
	(HappyTerminal (Identifier happy_var_2))
	_
	 =  HappyAbsSyn15
		 (happy_var_2 : happy_var_3
	)
happyReduction_33 _ _ _  = notHappyAtAll 

happyReduce_34 = happySpecReduce_0  16 happyReduction_34
happyReduction_34  =  HappyAbsSyn16
		 ([]
	)

happyReduce_35 = happySpecReduce_3  16 happyReduction_35
happyReduction_35 (HappyAbsSyn16  happy_var_3)
	(HappyAbsSyn17  happy_var_2)
	_
	 =  HappyAbsSyn16
		 (happy_var_2 : happy_var_3
	)
happyReduction_35 _ _ _  = notHappyAtAll 

happyReduce_36 = happySpecReduce_1  17 happyReduction_36
happyReduction_36 (HappyAbsSyn18  happy_var_1)
	 =  HappyAbsSyn17
		 (happy_var_1
	)
happyReduction_36 _  = notHappyAtAll 

happyReduce_37 = happySpecReduce_3  18 happyReduction_37
happyReduction_37 (HappyAbsSyn18  happy_var_3)
	_
	(HappyAbsSyn19  happy_var_1)
	 =  HappyAbsSyn18
		 (BinaryExpr Equal happy_var_1 happy_var_3
	)
happyReduction_37 _ _ _  = notHappyAtAll 

happyReduce_38 = happySpecReduce_3  18 happyReduction_38
happyReduction_38 (HappyAbsSyn18  happy_var_3)
	_
	(HappyAbsSyn19  happy_var_1)
	 =  HappyAbsSyn18
		 (BinaryExpr Great happy_var_1 happy_var_3
	)
happyReduction_38 _ _ _  = notHappyAtAll 

happyReduce_39 = happySpecReduce_3  18 happyReduction_39
happyReduction_39 (HappyAbsSyn18  happy_var_3)
	_
	(HappyAbsSyn19  happy_var_1)
	 =  HappyAbsSyn18
		 (BinaryExpr Less happy_var_1 happy_var_3
	)
happyReduction_39 _ _ _  = notHappyAtAll 

happyReduce_40 = happySpecReduce_1  18 happyReduction_40
happyReduction_40 (HappyAbsSyn19  happy_var_1)
	 =  HappyAbsSyn18
		 (happy_var_1
	)
happyReduction_40 _  = notHappyAtAll 

happyReduce_41 = happySpecReduce_3  19 happyReduction_41
happyReduction_41 (HappyAbsSyn19  happy_var_3)
	_
	(HappyAbsSyn20  happy_var_1)
	 =  HappyAbsSyn19
		 (BinaryExpr Add happy_var_1 happy_var_3
	)
happyReduction_41 _ _ _  = notHappyAtAll 

happyReduce_42 = happySpecReduce_3  19 happyReduction_42
happyReduction_42 (HappyAbsSyn19  happy_var_3)
	_
	(HappyAbsSyn20  happy_var_1)
	 =  HappyAbsSyn19
		 (BinaryExpr Sub happy_var_1 happy_var_3
	)
happyReduction_42 _ _ _  = notHappyAtAll 

happyReduce_43 = happySpecReduce_1  19 happyReduction_43
happyReduction_43 (HappyAbsSyn20  happy_var_1)
	 =  HappyAbsSyn19
		 (happy_var_1
	)
happyReduction_43 _  = notHappyAtAll 

happyReduce_44 = happySpecReduce_3  20 happyReduction_44
happyReduction_44 (HappyAbsSyn20  happy_var_3)
	_
	(HappyAbsSyn21  happy_var_1)
	 =  HappyAbsSyn20
		 (BinaryExpr Mul happy_var_1 happy_var_3
	)
happyReduction_44 _ _ _  = notHappyAtAll 

happyReduce_45 = happySpecReduce_3  20 happyReduction_45
happyReduction_45 (HappyAbsSyn20  happy_var_3)
	_
	(HappyAbsSyn21  happy_var_1)
	 =  HappyAbsSyn20
		 (BinaryExpr Div happy_var_1 happy_var_3
	)
happyReduction_45 _ _ _  = notHappyAtAll 

happyReduce_46 = happySpecReduce_1  20 happyReduction_46
happyReduction_46 (HappyAbsSyn21  happy_var_1)
	 =  HappyAbsSyn20
		 (happy_var_1
	)
happyReduction_46 _  = notHappyAtAll 

happyReduce_47 = happySpecReduce_2  21 happyReduction_47
happyReduction_47 (HappyAbsSyn21  happy_var_2)
	_
	 =  HappyAbsSyn21
		 (UnaryExpr Neg happy_var_2
	)
happyReduction_47 _ _  = notHappyAtAll 

happyReduce_48 = happySpecReduce_2  21 happyReduction_48
happyReduction_48 (HappyAbsSyn21  happy_var_2)
	_
	 =  HappyAbsSyn21
		 (UnaryExpr Not happy_var_2
	)
happyReduction_48 _ _  = notHappyAtAll 

happyReduce_49 = happySpecReduce_1  21 happyReduction_49
happyReduction_49 (HappyAbsSyn22  happy_var_1)
	 =  HappyAbsSyn21
		 (happy_var_1
	)
happyReduction_49 _  = notHappyAtAll 

happyReduce_50 = happySpecReduce_3  22 happyReduction_50
happyReduction_50 _
	(HappyAbsSyn17  happy_var_2)
	_
	 =  HappyAbsSyn22
		 (Brackets happy_var_2
	)
happyReduction_50 _ _ _  = notHappyAtAll 

happyReduce_51 = happySpecReduce_1  22 happyReduction_51
happyReduction_51 (HappyAbsSyn24  happy_var_1)
	 =  HappyAbsSyn22
		 (happy_var_1
	)
happyReduction_51 _  = notHappyAtAll 

happyReduce_52 = happySpecReduce_1  22 happyReduction_52
happyReduction_52 (HappyAbsSyn23  happy_var_1)
	 =  HappyAbsSyn22
		 (ValueAtom happy_var_1
	)
happyReduction_52 _  = notHappyAtAll 

happyReduce_53 = happySpecReduce_1  22 happyReduction_53
happyReduction_53 (HappyTerminal (Identifier happy_var_1))
	 =  HappyAbsSyn22
		 (VarAtom happy_var_1
	)
happyReduction_53 _  = notHappyAtAll 

happyReduce_54 = happySpecReduce_1  23 happyReduction_54
happyReduction_54 (HappyTerminal (IntVal happy_var_1))
	 =  HappyAbsSyn23
		 (IntValue happy_var_1
	)
happyReduction_54 _  = notHappyAtAll 

happyReduce_55 = happySpecReduce_1  23 happyReduction_55
happyReduction_55 (HappyTerminal (DoubleVal happy_var_1))
	 =  HappyAbsSyn23
		 (DoubleValue happy_var_1
	)
happyReduction_55 _  = notHappyAtAll 

happyReduce_56 = happySpecReduce_1  23 happyReduction_56
happyReduction_56 (HappyTerminal (StrVal happy_var_1))
	 =  HappyAbsSyn23
		 (StringValue happy_var_1
	)
happyReduction_56 _  = notHappyAtAll 

happyReduce_57 = happySpecReduce_1  23 happyReduction_57
happyReduction_57 (HappyTerminal (BoolVal happy_var_1))
	 =  HappyAbsSyn23
		 (BoolValue happy_var_1
	)
happyReduction_57 _  = notHappyAtAll 

happyReduce_58 = happyReduce 4 24 happyReduction_58
happyReduction_58 (_ `HappyStk`
	(HappyAbsSyn25  happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (Identifier happy_var_1)) `HappyStk`
	happyRest)
	 = HappyAbsSyn24
		 (CallFun happy_var_1 happy_var_3
	) `HappyStk` happyRest

happyReduce_59 = happySpecReduce_0  25 happyReduction_59
happyReduction_59  =  HappyAbsSyn25
		 ([]
	)

happyReduce_60 = happySpecReduce_1  25 happyReduction_60
happyReduction_60 (HappyAbsSyn17  happy_var_1)
	 =  HappyAbsSyn25
		 ([ happy_var_1 ]
	)
happyReduction_60 _  = notHappyAtAll 

happyReduce_61 = happySpecReduce_3  25 happyReduction_61
happyReduction_61 (HappyAbsSyn25  happy_var_3)
	_
	(HappyAbsSyn17  happy_var_1)
	 =  HappyAbsSyn25
		 (happy_var_1 : happy_var_3
	)
happyReduction_61 _ _ _  = notHappyAtAll 

happyNewToken action sts stk [] =
	action 59 59 notHappyAtAll (HappyState action) sts stk []

happyNewToken action sts stk (tk:tks) =
	let cont i = action i i tk (HappyState action) sts stk tks in
	case tk of {
	Identifier happy_dollar_dollar -> cont 26;
	MinusT -> cont 27;
	PlusT -> cont 28;
	LeftP -> cont 29;
	MulT -> cont 30;
	RightP -> cont 31;
	DivT -> cont 32;
	NotT -> cont 33;
	EqT -> cont 34;
	ForT -> cont 35;
	IfT -> cont 36;
	WhileT -> cont 37;
	ElseT -> cont 38;
	ReturnT -> cont 39;
	CinT -> cont 40;
	CoutT -> cont 41;
	IntT -> cont 42;
	DoubleT -> cont 43;
	BoolT -> cont 44;
	StrT -> cont 45;
	LLineT -> cont 46;
	RLineT -> cont 47;
	SemiT -> cont 48;
	CommaT -> cont 49;
	AsT -> cont 50;
	LessT -> cont 51;
	GreatT -> cont 52;
	LParT -> cont 53;
	RParT -> cont 54;
	IntVal happy_dollar_dollar -> cont 55;
	BoolVal happy_dollar_dollar -> cont 56;
	DoubleVal happy_dollar_dollar -> cont 57;
	StrVal happy_dollar_dollar -> cont 58;
	_ -> happyError' ((tk:tks), [])
	}

happyError_ explist 59 tk tks = happyError' (tks, explist)
happyError_ explist _ tk tks = happyError' ((tk:tks), explist)

newtype HappyIdentity a = HappyIdentity a
happyIdentity = HappyIdentity
happyRunIdentity (HappyIdentity a) = a

instance Functor HappyIdentity where
    fmap f (HappyIdentity a) = HappyIdentity (f a)

instance Applicative HappyIdentity where
    pure  = HappyIdentity
    (<*>) = ap
instance Monad HappyIdentity where
    return = pure
    (HappyIdentity p) >>= q = q p

happyThen :: () => HappyIdentity a -> (a -> HappyIdentity b) -> HappyIdentity b
happyThen = (>>=)
happyReturn :: () => a -> HappyIdentity a
happyReturn = (return)
happyThen1 m k tks = (>>=) m (\a -> k a tks)
happyReturn1 :: () => a -> b -> HappyIdentity a
happyReturn1 = \a tks -> (return) a
happyError' :: () => ([(Token)], [String]) -> HappyIdentity a
happyError' = HappyIdentity . (\(tokens, _) -> parseError tokens)
parser tks = happyRunIdentity happySomeParser where
 happySomeParser = happyThen (happyParse action_0 tks) (\x -> case x of {HappyAbsSyn4 z -> happyReturn z; _other -> notHappyAtAll })

happySeq = happyDontSeq


parseError :: [Token] -> a
parseError arg = error $ "Parse error" <> show arg
{-# LINE 1 "templates/GenericTemplate.hs" #-}
-- $Id: GenericTemplate.hs,v 1.26 2005/01/14 14:47:22 simonmar Exp $










































data Happy_IntList = HappyCons Int Happy_IntList








































infixr 9 `HappyStk`
data HappyStk a = HappyStk a (HappyStk a)

-----------------------------------------------------------------------------
-- starting the parse

happyParse start_state = happyNewToken start_state notHappyAtAll notHappyAtAll

-----------------------------------------------------------------------------
-- Accepting the parse

-- If the current token is ERROR_TOK, it means we've just accepted a partial
-- parse (a %partial parser).  We must ignore the saved token on the top of
-- the stack in this case.
happyAccept (1) tk st sts (_ `HappyStk` ans `HappyStk` _) =
        happyReturn1 ans
happyAccept j tk st sts (HappyStk ans _) = 
         (happyReturn1 ans)

-----------------------------------------------------------------------------
-- Arrays only: do the next action









































indexShortOffAddr arr off = arr Happy_Data_Array.! off


{-# INLINE happyLt #-}
happyLt x y = (x < y)






readArrayBit arr bit =
    Bits.testBit (indexShortOffAddr arr (bit `div` 16)) (bit `mod` 16)






-----------------------------------------------------------------------------
-- HappyState data type (not arrays)



newtype HappyState b c = HappyState
        (Int ->                    -- token number
         Int ->                    -- token number (yes, again)
         b ->                           -- token semantic value
         HappyState b c ->              -- current state
         [HappyState b c] ->            -- state stack
         c)



-----------------------------------------------------------------------------
-- Shifting a token

happyShift new_state (1) tk st sts stk@(x `HappyStk` _) =
     let i = (case x of { HappyErrorToken (i) -> i }) in
--     trace "shifting the error token" $
     new_state i i tk (HappyState (new_state)) ((st):(sts)) (stk)

happyShift new_state i tk st sts stk =
     happyNewToken new_state ((st):(sts)) ((HappyTerminal (tk))`HappyStk`stk)

-- happyReduce is specialised for the common cases.

happySpecReduce_0 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_0 nt fn j tk st@((HappyState (action))) sts stk
     = action nt j tk st ((st):(sts)) (fn `HappyStk` stk)

happySpecReduce_1 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_1 nt fn j tk _ sts@(((st@(HappyState (action))):(_))) (v1`HappyStk`stk')
     = let r = fn v1 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happySpecReduce_2 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_2 nt fn j tk _ ((_):(sts@(((st@(HappyState (action))):(_))))) (v1`HappyStk`v2`HappyStk`stk')
     = let r = fn v1 v2 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happySpecReduce_3 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_3 nt fn j tk _ ((_):(((_):(sts@(((st@(HappyState (action))):(_))))))) (v1`HappyStk`v2`HappyStk`v3`HappyStk`stk')
     = let r = fn v1 v2 v3 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happyReduce k i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happyReduce k nt fn j tk st sts stk
     = case happyDrop (k - ((1) :: Int)) sts of
         sts1@(((st1@(HappyState (action))):(_))) ->
                let r = fn stk in  -- it doesn't hurt to always seq here...
                happyDoSeq r (action nt j tk st1 sts1 r)

happyMonadReduce k nt fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happyMonadReduce k nt fn j tk st sts stk =
      case happyDrop k ((st):(sts)) of
        sts1@(((st1@(HappyState (action))):(_))) ->
          let drop_stk = happyDropStk k stk in
          happyThen1 (fn stk tk) (\r -> action nt j tk st1 sts1 (r `HappyStk` drop_stk))

happyMonad2Reduce k nt fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happyMonad2Reduce k nt fn j tk st sts stk =
      case happyDrop k ((st):(sts)) of
        sts1@(((st1@(HappyState (action))):(_))) ->
         let drop_stk = happyDropStk k stk





             _ = nt :: Int
             new_state = action

          in
          happyThen1 (fn stk tk) (\r -> happyNewToken new_state sts1 (r `HappyStk` drop_stk))

happyDrop (0) l = l
happyDrop n ((_):(t)) = happyDrop (n - ((1) :: Int)) t

happyDropStk (0) l = l
happyDropStk n (x `HappyStk` xs) = happyDropStk (n - ((1)::Int)) xs

-----------------------------------------------------------------------------
-- Moving to a new state after a reduction









happyGoto action j tk st = action j j tk (HappyState action)


-----------------------------------------------------------------------------
-- Error recovery (ERROR_TOK is the error token)

-- parse error if we are in recovery and we fail again
happyFail explist (1) tk old_st _ stk@(x `HappyStk` _) =
     let i = (case x of { HappyErrorToken (i) -> i }) in
--      trace "failing" $ 
        happyError_ explist i tk

{-  We don't need state discarding for our restricted implementation of
    "error".  In fact, it can cause some bogus parses, so I've disabled it
    for now --SDM

-- discard a state
happyFail  ERROR_TOK tk old_st CONS(HAPPYSTATE(action),sts) 
                                                (saved_tok `HappyStk` _ `HappyStk` stk) =
--      trace ("discarding state, depth " ++ show (length stk))  $
        DO_ACTION(action,ERROR_TOK,tk,sts,(saved_tok`HappyStk`stk))
-}

-- Enter error recovery: generate an error token,
--                       save the old token and carry on.
happyFail explist i tk (HappyState (action)) sts stk =
--      trace "entering error recovery" $
        action (1) (1) tk (HappyState (action)) sts ((HappyErrorToken (i)) `HappyStk` stk)

-- Internal happy errors:

notHappyAtAll :: a
notHappyAtAll = error "Internal Happy error\n"

-----------------------------------------------------------------------------
-- Hack to get the typechecker to accept our action functions







-----------------------------------------------------------------------------
-- Seq-ing.  If the --strict flag is given, then Happy emits 
--      happySeq = happyDoSeq
-- otherwise it emits
--      happySeq = happyDontSeq

happyDoSeq, happyDontSeq :: a -> b -> b
happyDoSeq   a b = a `seq` b
happyDontSeq a b = b

-----------------------------------------------------------------------------
-- Don't inline any functions from the template.  GHC has a nasty habit
-- of deciding to inline happyGoto everywhere, which increases the size of
-- the generated parser quite a bit.









{-# NOINLINE happyShift #-}
{-# NOINLINE happySpecReduce_0 #-}
{-# NOINLINE happySpecReduce_1 #-}
{-# NOINLINE happySpecReduce_2 #-}
{-# NOINLINE happySpecReduce_3 #-}
{-# NOINLINE happyReduce #-}
{-# NOINLINE happyMonadReduce #-}
{-# NOINLINE happyGoto #-}
{-# NOINLINE happyFail #-}

-- end of Happy Template.
