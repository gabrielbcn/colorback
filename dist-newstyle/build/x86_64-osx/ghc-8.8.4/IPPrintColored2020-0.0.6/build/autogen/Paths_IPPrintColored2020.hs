{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
module Paths_IPPrintColored2020 (
    version,
    getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

#if defined(VERSION_base)

#if MIN_VERSION_base(4,0,0)
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#else
catchIO :: IO a -> (Exception.Exception -> IO a) -> IO a
#endif

#else
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#endif
catchIO = Exception.catch

version :: Version
version = Version [0,0,6] []
bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/Users/gabriel/.cabal/bin"
libdir     = "/Users/gabriel/.cabal/lib/x86_64-osx-ghc-8.8.4/IPPrintColored2020-0.0.6-inplace"
dynlibdir  = "/Users/gabriel/.cabal/lib/x86_64-osx-ghc-8.8.4"
datadir    = "/Users/gabriel/.cabal/share/x86_64-osx-ghc-8.8.4/IPPrintColored2020-0.0.6"
libexecdir = "/Users/gabriel/.cabal/libexec/x86_64-osx-ghc-8.8.4/IPPrintColored2020-0.0.6"
sysconfdir = "/Users/gabriel/.cabal/etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "IPPrintColored2020_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "IPPrintColored2020_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "IPPrintColored2020_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "IPPrintColored2020_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "IPPrintColored2020_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "IPPrintColored2020_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
