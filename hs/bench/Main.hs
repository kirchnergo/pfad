module Main (main) where

import Criterion.Main
import Lib
import Pearl01

main :: IO ()
main = defaultMain
    [ 
    bgroup "Pearl 01"
        [ bench "minfree1" $ whnf minfree1 p01x1
        , bench "minfree2" $ whnf minfree2 p01x1
        , bench "minfree3" $ whnf minfree3 p01x1
        , bench "minfree1 [10000,9999..0] \\ [9000]" $ whnf minfree1 p01x4
        , bench "minfree2 [10000,9999..0] \\ [9000]" $ whnf minfree2 p01x4
        , bench "minfree3 [10000,9999..0] \\ [9000]" $ whnf minfree3 p01x4
        , bench "minfree3 [1e5..0] \\ [9e4]" $ whnf minfree3 p01x5
        , bench "minfree3 [1e7..0] \\ [9e6]" $ whnf minfree3 p01x7
        --, bench "minfree 3 [1e8..0] \\ [9e7]" $ whnf minfree3 p01x8
        ]
    ]
    where 
        p01x1 = [08, 23, 09, 00, 12, 11, 01, 10, 13, 07, 41, 04, 14, 21, 05, 17, 03, 19, 02, 06]
        p01x4 = ([10000,9999..0] \\ [9000])
        p01x5 = ([100000,99999..0] \\ [90000])
        p01x7 = ([10000000,9999999..0] \\ [9000000])
        --p01x8 = ([100000000,99999999..0] \\ [90000000])