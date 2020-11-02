-- Module: IPPrintColored2020
-- License: Public Domain
-- Author: Gabriel Mesquida Masana <gabriel.mesquida@me.com>
-- Maintainer: Gabriel Mesquida Masana <gabriel.mesquida@me.com>

module IPPrintColored2020
  ( myPrint,
  )
where

import Language.Haskell.HsColour as HsColour
import Language.Haskell.HsColour.Colourise as HsColour
import Language.Haskell.HsColour.Output as HsColour
import Text.Show.Pretty (ppShow)

myColourPrefs :: ColourPrefs
myColourPrefs =
  HsColour.defaultColourPrefs
    { HsColour.conid = [HsColour.Foreground HsColour.Yellow, HsColour.Bold],
      HsColour.conop = [HsColour.Foreground HsColour.Yellow],
      HsColour.varid = [HsColour.Foreground HsColour.Cyan, HsColour.Bold],
      HsColour.varop = [HsColour.Foreground HsColour.Cyan],
      HsColour.string = [HsColour.Foreground HsColour.Red, HsColour.Bold],
      HsColour.char = [HsColour.Foreground HsColour.Magenta, HsColour.Bold],
      HsColour.number = [HsColour.Foreground HsColour.Green, HsColour.Bold],
      HsColour.layout = [HsColour.Foreground HsColour.Blue],
      HsColour.keyglyph = [HsColour.Foreground HsColour.Magenta],
      HsColour.comment = [HsColour.Foreground HsColour.Blue, HsColour.Bold],
      HsColour.cpp = [HsColour.Foreground HsColour.Green],
      HsColour.definition = [HsColour.Foreground HsColour.Blue, HsColour.Bold]
    }

myPrint :: (Show a) => a -> IO ()
myPrint = putStrLn . HsColour.hscolour (HsColour.TTYg HsColour.XTerm256Compatible) myColourPrefs False False "" False . Text.Show.Pretty.ppShow
