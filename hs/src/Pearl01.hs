-- The Smallest Free Number
module Pearl01
    ( 
    -- * Some functions
    minfree1
    , minfree2
    , minfree3
    , (\\)
    ) where

import Data.Array
import Data.Array.ST
import Data.List as L hiding ((\\))

-- Array-based Solution

minfree1 :: [Int] -> Int
minfree1 xs = head([0..] Pearl01.\\ xs)

(\\) :: Eq a => [a] -> [a] -> [a]
us \\ vs = filter (notElem' vs) us

notElem' :: Eq a => [a] -> a -> Bool
notElem' a n = notElem n a

-- Second Attempt

minfree2 = search . checklist

checklist :: [Int] -> Array Int Bool
checklist xs = runSTArray (do
        {a <- newArray (0, n) False;
        sequence [writeArray a x True | x <- xs, x <= n];
        return a}
    )
    where n = length xs

search :: Array Int Bool -> Int 
search = length . takeWhile id . elems

-- Divide and Conquer

minfree3 :: [Int] -> Int
minfree3 xs = minfrom 0 (length xs, xs)

minfrom :: Int -> (Int, [Int]) -> Int
minfrom a (n, xs)   | n == 0        = a
                    | m == b - a    = minfrom b (n - m, vs)
                    | otherwise     = minfrom a (m, us)
                      where (us, vs)    = partition (< b) xs
                            b           = a + 1 + n `div` 2
                            m           = length us