-- Module: colorback
-- License: Public Domain
-- Author: Gabriel Mesquida Masana <gabriel.mesquida@me.com>
-- Maintainer: Gabriel Mesquida Masana <gabriel.mesquida@me.com>

module Colorback
    ( myPrint
    )
where

import           Language.Haskell.HsColour
                                     as HsColour
                                      ( hscolour
                                      , ColourPrefs
                                          ( conid
                                          , conop
                                          , varid
                                          , varop
                                          , string
                                          , char
                                          , number
                                          , layout
                                          , keyglyph
                                          , comment
                                          , cpp
                                          , definition
                                          , keyword
                                          , selection
                                          , variantselection
                                          )
                                      , Output(TTYg)
                                      )
import           Language.Haskell.HsColour.Colourise
                                     as HsColour
                                      ( defaultColourPrefs
                                      , Colour
                                          ( Yellow
                                          , Cyan
                                          , Magenta
                                          , Rgb
                                          , Red
                                          , Green
                                          , Blue
                                          )
                                      , Highlight(Foreground, Bold)
                                      )
import           Language.Haskell.HsColour.Output
                                     as HsColour
                                      ( TerminalType(XTerm256Compatible) )
import           Text.Show.Pretty     ( ppShow )

myColourPrefs :: ColourPrefs
myColourPrefs = HsColour.defaultColourPrefs
    { HsColour.conid = [HsColour.Foreground HsColour.Blue, HsColour.Bold]
    , HsColour.conop = [HsColour.Foreground HsColour.Yellow]
    , HsColour.varid = [HsColour.Foreground HsColour.Cyan, HsColour.Bold]
    , HsColour.varop = [HsColour.Foreground HsColour.Cyan]
    , HsColour.string = [ HsColour.Foreground (HsColour.Rgb 245 114 66)
                        , HsColour.Bold
                        ]
    , HsColour.char = [HsColour.Foreground HsColour.Magenta, HsColour.Bold]
    , HsColour.number = [HsColour.Foreground HsColour.Green, HsColour.Bold]
    , HsColour.layout = [ HsColour.Foreground (HsColour.Rgb 245 218 66)
                        , HsColour.Bold
                        ]
    , HsColour.keyglyph = [ HsColour.Foreground (HsColour.Rgb 245 151 66)
                          , HsColour.Bold
                          ]
    , HsColour.comment = [HsColour.Foreground HsColour.Red, HsColour.Bold]
    , HsColour.cpp = [HsColour.Foreground HsColour.Green]
    , HsColour.definition = [ HsColour.Foreground HsColour.Blue
                            , HsColour.Bold
                            ]
    , HsColour.keyword = [ HsColour.Foreground HsColour.Yellow
                         , HsColour.Bold
                         ]
    , HsColour.selection = [HsColour.Foreground HsColour.Yellow]
    , HsColour.variantselection = [HsColour.Foreground HsColour.Yellow]
    }

myPrint :: (Show a) => a -> IO ()
myPrint =
    putStrLn
        . HsColour.hscolour (HsColour.TTYg HsColour.XTerm256Compatible)
                            myColourPrefs
                            False
                            False
                            ""
                            False
        . Text.Show.Pretty.ppShow
