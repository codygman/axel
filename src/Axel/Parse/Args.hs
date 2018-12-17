module Axel.Parse.Args where

import Axel
  ( applyInfix_AXEL_AUTOGENERATED_MACRO_DEFINITION
  , def_AXEL_AUTOGENERATED_MACRO_DEFINITION
  )
import Data.Semigroup ((<>))
import Options.Applicative
  ( Parser
  , argument
  , command
  , info
  , metavar
  , progDesc
  , str
  , subparser
  )

data Command
  = File FilePath
  | Project
  | Version

commandParser =
  (subparser ((<>) projectCommand ((<>) fileCommand versionCommand)))
  where
    fileCommand =
      (command
         "file"
         (info
            ((<$>) File (argument str (metavar "FILE")))
            (progDesc "Build and run a single file")))
      where

    projectCommand =
      (command
         "project"
         (info (pure Project) (progDesc "Build and run the project")))
      where

    versionCommand =
      (command
         "version"
         (info
            (pure Version)
            (progDesc "Display the version of the Axel compiler")))
      where


commandParser :: (Parser Command)
