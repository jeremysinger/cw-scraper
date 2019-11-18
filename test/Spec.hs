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
      getScrapedWordFromWikiPage "Ruritania" "zenda",
      getScrapedWordFromWikiPage "USA" "american",
      getScrapedWordFromWikiPage "China" "people",
      getScrapedWordFromWikiPage "Russia" "soviet"
    ])

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

