module Main (main) where

import Lib

main :: IO ()
main = do
    putStrLn "Hello from app"
    print $ myAdd 5 6
