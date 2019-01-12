{-|
Module     : Lib
Description: An example of a documented library module
Copyright  : Copyright (C) 2019, Göran Kirchner
License    : MIT
Maintainer : goeran.kirchner@gmx.de
Stability  : experimental
Portability: portable

Here is a longer description of this module containing some commentary with
@some markup@.
-}

module Lib
    ( 
    -- * Some functions
    someFunc
    , myAdd
    ) where

-- * This heading appears before @someFunc@

someFunc :: IO ()
someFunc = putStrLn "someFunc"

-- * This heading appears before @myAdd@

-- | Evaluate sum of two @Int@ values
myAdd :: Int -- ^ the first value
      -> Int -- ^ the second value
      -> Int -- ^ the return value
myAdd x y = x + y