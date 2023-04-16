import System.Environment (getArgs)
import Text.Printf (printf)
import Data.List (intercalate)

-- FOR SOME REASON forM_ IS NOT AVAILABLE TO ME??? AAAAAAAAAAAAAAAAA??
-- copy and pasted from https://hackage.haskell.org/package/base-4.18.0.0/docs/src/Data.Foldable.html#forM_
forM_ :: (Foldable t, Monad m) => t a -> (a -> m b) -> m ()
{-# INLINE forM_ #-}
forM_ = flip mapM_

calculate :: Int -> [Int]
calculate n = [x | x <- [1..n `div` 2], n `mod` x == 0 && even (n `div` x)]    

main :: IO ()
main = do
    args <- getArgs
    let count = read $ head args :: Int

    forM_ [x | x <- [1..count], even x] (\i -> do
            putStrLn $ show i ++ ": " ++ show (calculate i)
        )
