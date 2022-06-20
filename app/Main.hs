module Main where

import Data.Char
import Data.Maybe
import Data.Typeable
import Data.Map (Map)
import System.IO
import qualified Data.Map as M

morse :: Map Char String
morse =
  M.fromList
  [('a', ".- ")
  ,('b', "-... ")
  ,('c', "-.-. ")
  ,('d', "-.. ")
  ,('e', ". ")
  ,('f', "..-. ")
  ,('g', "--. ")
  ,('h', ".... ")
  ,('i', ".. ")
  ,('j', ".--- ")
  ,('k', "-.- ")
  ,('l', ".-.. ")
  ,('m', "-- ")
  ,('n', "-. ")
  ,('o', "--- ")
  ,('p', ".--. ")
  ,('q', "--.- ")
  ,('r', ".-. ")
  ,('s', "... ")
  ,('t', "- ")
  ,('u', "..- ")
  ,('v', "...- ")
  ,('w', ".-- ")
  ,('x', "-..- ")
  ,('y', "-.-- ")
  ,('z', "--.. ")
  ,('=', "-...- ")
  ,('?', "..--.. ")
  ,('/', "-..-. ")
  ,(',', "--..-- ")
  ,('.', ".-.-.- ")
  ,(':', "---... ")
  ,('\'', ".----. ")
  ,('-', "-....- ")
  ,('(', "-.--. ")
  ,(')', "-.--.- ")
  ,('0', "----- ")
  ,('1', ".---- ")
  ,('2', "..--- ")
  ,('3', "...-- ")
  ,('4', "....- ")
  ,('5', "..... ")
  ,('6', "-.... ")
  ,('7', "--... ")
  ,('8', "---.. ")
  ,('9', "----. ")
  ,('@', ".--.-. ")
  ,(' ', "/ ")
  ]

prompt :: String -> IO String
prompt text = do
  putStr text
  hFlush stdout
  getLine

toMorse :: String -> String
toMorse = do
  concatMap (\c -> fromMaybe "" (M.lookup c morse))

main :: IO ()
main = do
  putStr "Enter a string to convert to morse code: "
  c <- prompt "Enter a string to convert to morse code: "
  let mrow = toMorse (map toLower $ c)
  print mrow
