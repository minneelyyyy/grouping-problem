import System.Environment (getArgs)
import Control.Monad (forM_)

calculate :: Int -> [Int]
calculate n = 
    if even n then [x | x <- [1..n `div` 2], n `mod` x == 0 && even (n `div` x)]
    else []

main :: IO ()
main = do
    args <- getArgs
    let count = read $ head args :: Int

    forM_ [x | x <- [1..count], even x] (\i -> do
            putStrLn $ show i ++ ": " ++ show (calculate i)
        )
