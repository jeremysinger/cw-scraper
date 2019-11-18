module Main where

import Text.HTML.Scalpel
import WikiScrapeLib


countries :: [String]
countries = [
          "Scotland",
          "England",
          "United_Kingdom",
          "USA",
          "Brazil",
          "France",
          "Germany",
          "Italy",
          "Japan",
          "China",
          "Russia"
         ]

wikify :: String -> URL
wikify x = "https://en.wikipedia.org/wiki/" ++ x

main :: IO ()
main = do
     words <- mapM mostfrequentwordonpage (wikify <$> countries)
     let results = zip countries words
     mapM_ (\x -> putStrLn $ (fst x) ++ ": " ++ ((show.snd) x)) results

