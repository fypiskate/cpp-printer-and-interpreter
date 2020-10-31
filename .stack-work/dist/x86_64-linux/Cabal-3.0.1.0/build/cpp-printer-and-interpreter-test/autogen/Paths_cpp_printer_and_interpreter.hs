{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
module Paths_cpp_printer_and_interpreter (
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
version = Version [0,1,0,0] []
bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/home/katrin/university/fp/summer-task/cpp-printer-and-interpreter/.stack-work/install/x86_64-linux/40f56322bbd28f77a4f38fbae88b0929e83d995945999e132d2b28caddf3344c/8.8.4/bin"
libdir     = "/home/katrin/university/fp/summer-task/cpp-printer-and-interpreter/.stack-work/install/x86_64-linux/40f56322bbd28f77a4f38fbae88b0929e83d995945999e132d2b28caddf3344c/8.8.4/lib/x86_64-linux-ghc-8.8.4/cpp-printer-and-interpreter-0.1.0.0-IZf6uk4T15x50l6FdrvFqg-cpp-printer-and-interpreter-test"
dynlibdir  = "/home/katrin/university/fp/summer-task/cpp-printer-and-interpreter/.stack-work/install/x86_64-linux/40f56322bbd28f77a4f38fbae88b0929e83d995945999e132d2b28caddf3344c/8.8.4/lib/x86_64-linux-ghc-8.8.4"
datadir    = "/home/katrin/university/fp/summer-task/cpp-printer-and-interpreter/.stack-work/install/x86_64-linux/40f56322bbd28f77a4f38fbae88b0929e83d995945999e132d2b28caddf3344c/8.8.4/share/x86_64-linux-ghc-8.8.4/cpp-printer-and-interpreter-0.1.0.0"
libexecdir = "/home/katrin/university/fp/summer-task/cpp-printer-and-interpreter/.stack-work/install/x86_64-linux/40f56322bbd28f77a4f38fbae88b0929e83d995945999e132d2b28caddf3344c/8.8.4/libexec/x86_64-linux-ghc-8.8.4/cpp-printer-and-interpreter-0.1.0.0"
sysconfdir = "/home/katrin/university/fp/summer-task/cpp-printer-and-interpreter/.stack-work/install/x86_64-linux/40f56322bbd28f77a4f38fbae88b0929e83d995945999e132d2b28caddf3344c/8.8.4/etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "cpp_printer_and_interpreter_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "cpp_printer_and_interpreter_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "cpp_printer_and_interpreter_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "cpp_printer_and_interpreter_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "cpp_printer_and_interpreter_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "cpp_printer_and_interpreter_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
