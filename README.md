
# Colorback

## Because the Glasgow Haskell Compiler interactive environment is cooler with outputs properly formatted and in color

Tired of seeing variations of packages to make GHCi output good enough for me , I have decided to consolidate one that works. Feel free to copy, modify, whatever. This one combines hscolour with pretty-show, which is a combination I have not been able to find (otherwise... don't code).

### To get it installed

1. Clone and ```cabal install --lib```

1. Add the following lines to your @ghci.conf@ file:

``` haskell
-- Pretty printing in colour
import Colorback
:set -interactive-print=Colorback.myPrint
:def col (\_ -> return ":set -interactive-print=Colorback.myPrint")
:def bw (\_ -> return ":set -interactive-print=print")
```

1. Use ```:col``` switch to colour and ```:nocol``` to switch to mono
