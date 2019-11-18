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

main :: IO ()
main = do
     let words = map mostfrequentwordonpage countries
     let results = zip countries words
     mapM_ (\x -> putStrLn $ (fst x) ++ ": " ++ ((show.snd) x)) results

