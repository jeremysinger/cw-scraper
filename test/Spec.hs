module Main where

import Test.Tasty
import Test.Tasty.HUnit

import WikiScrapeLib (mostfrequentwordonpage)

main :: IO ()
main = do
  defaultMain (testGroup "scraper library tests"
    [ badUrlScraperTest,
      randomCountryScraperTest,
      randomWordScraperTest,
      getScrapedWordFromWikiPage "USA" "American"
    ])

getScrapedWordFromWikiPage :: String -> String -> TestTree
getScrapedWordFromWikiPage article expected =
  testCase ("testing " ++ article ++ " page")
    (assertEqual ("most frequent word should be " ++ expected)
      (Just expected)
      (mostfrequentwordonpage $ "https://en.wikipedia.org/wiki/"++article))



badUrlScraperTest :: TestTree
badUrlScraperTest = testCase "testing bad url"
  (assertEqual "should evaluate to Nothing" Nothing
   (mostfrequentwordonpage "https://nosuchpage.wiki/foo"))

randomCountryScraperTest :: TestTree
randomCountryScraperTest = testCase "testing Ruritania page"
  (assertEqual "most frequent word is zenda" (Just "zenda")
   (mostfrequentwordonpage "https://en.wikipedia.org/wiki/Ruritania"))

randomWordScraperTest :: TestTree
randomWordScraperTest = testCase "testing Banana page"
  (assertEqual "most frequent word is musa" (Just "musa")
   (mostfrequentwordonpage "https://en.wikipedia.org/wiki/Banana"))

