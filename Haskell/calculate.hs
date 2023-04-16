import System.Environment (getArgs)
import Data.Foldable (for_)

isPrime :: Int -> Bool
isPrime n = null [x | x <- [2..n], n `mod` x == 0]

calculate :: Int -> [Int]
calculate n = 
    if even n then 
        if isPrime n then [1, n `div` 2]
        else [x | x <- [1..n `div` 2], n `mod` x == 0 && even (n `div` x)]
    else []

main :: IO ()
main = do
    args <- getArgs
    let count = read $ head args :: Int

    for_ [x | x <- [1..count], even x] (\i -> do
            putStrLn $ show i ++ ": " ++ show (calculate i)
        )
