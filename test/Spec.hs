module Main where

import Test.Tasty
import Test.Tasty.HUnit

import WikiScrapeLib (mostfrequentwordonpage)

main :: IO ()
main = do
  defaultMain (testGroup "scraper library tests" [badUrlScraperTest])

badUrlScraperTest :: TestTree
badUrlScraperTest = testCase "testing bad url"
  (assertEqual "should evaluate to Nothing" Nothing
   (mostfrequentwordonpage "https://nosuchpage.wiki/foo"))

