{-# LANGUAGE OverloadedStrings #-}

module WikiScrapeLib
    (  mostfrequentwordonpage
    ) where

import Text.HTML.Scalpel

mostfrequentwordonpage :: URL -> IO (Maybe String)
mostfrequentwordonpage page = do
  return (Just "fixme")


