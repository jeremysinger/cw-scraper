{-# LANGUAGE OverloadedStrings #-}

module WikiScrapeLib
    (  mostfrequentwordonpage
    ) where

import Text.HTML.Scalpel

mostfrequentwordonpage :: URL -> Maybe String
mostfrequentwordonpage _ = Nothing

