module Main (main) where

import Lib
import Test.Hspec
import Pearl01

main :: IO ()
main = hspec spec

spec :: Spec
spec = do
    describe "Pearl01" $ do
        it "minfree1 of [5 4 3 1 0] should be 2" $ do
            minfree1 [5, 4, 3, 1, 0] `shouldBe` 2
        it "minfree1 of the book example [08, 23, .. ] should be 15" $ do
            minfree1 [08, 23, 09, 00, 12, 11, 01, 10, 13, 07, 41, 04, 14, 21, 05, 17, 03, 19, 02, 06] `shouldBe` 15  
        it "minfree1 of [0..10000] \\ [77] should be 77" $ do
            minfree1 ([0..10000] \\ [77]) `shouldBe` 77
        it "minfree2 of [5 4 3 1 0] should be 2" $ do
            minfree2 [5, 4, 3, 1, 0] `shouldBe` 2
        it "minfree2 of the book example [08, 23, .. ] should be 15" $ do
            minfree2 [08, 23, 09, 00, 12, 11, 01, 10, 13, 07, 41, 04, 14, 21, 05, 17, 03, 19, 02, 06] `shouldBe` 15  
        it "minfree2 of [0..10000] \\ [77] should be 77" $ do
            minfree2 ([0..10000] \\ [77]) `shouldBe` 77    
        it "minfree3 of [5 4 3 1 0] should be 2" $ do
            minfree3 [5, 4, 3, 1, 0] `shouldBe` 2
        it "minfree3 of the book example [08, 23, .. ] should be 15" $ do
            minfree3 [08, 23, 09, 00, 12, 11, 01, 10, 13, 07, 41, 04, 14, 21, 05, 17, 03, 19, 02, 06] `shouldBe` 15  
        it "minfree3 of [0..10000] \\ [77] should be 77" $ do
            minfree3 ([0..10000] \\ [77]) `shouldBe` 77    