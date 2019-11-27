{-# LANGUAGE OverloadedStrings #-}

module Main where

import Test.Tasty
import Test.Tasty.HUnit

import WikiScrapeLib (mostfrequentwordonpage)

main :: IO ()
main = do
  defaultMain (testGroup "scraper library tests"
    [ badUrlScraperTest,
      getScrapedWordFromWikiPage "Banana" "musa",
      getOneOfScrapedWordFromWikiPage "Ruritania" ["film", "zenda", "prisoner"],
      getScrapedWordFromWikiPage "USA" "american",
      getScrapedWordFromWikiPage "China" "people",
      getScrapedWordFromWikiPage "Russia" "soviet"
    ])

getOneOfScrapedWordFromWikiPage :: String -> [String] -> TestTree
getOneOfScrapedWordFromWikiPage article possibles =
  testCase ("testing " ++ article ++ " page") $ do
    res <- mostfrequentwordonpage $ "https://en.wikipedia.org/wiki/"++article
    case res of
      Nothing -> assertFailure "no words scraped"
      Just w -> assertEqual ("most frequent word should be one of " ++ (show possibles)) (length $ filter (w==) possibles) 1

getScrapedWordFromWikiPage :: String -> String -> TestTree
getScrapedWordFromWikiPage article expected =
  testCase ("testing " ++ article ++ " page") $ do
    res <- mostfrequentwordonpage $ "https://en.wikipedia.org/wiki/"++article
    assertEqual ("most frequent word should be " ++ expected) 
      (Just expected)
      res

badUrlScraperTest :: TestTree
badUrlScraperTest = testCase "testing bad url" $ do
  res <- mostfrequentwordonpage "https://nosuchpage.wiki/foo"
  Nothing @=? res

