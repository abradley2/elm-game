port module Ports exposing (..)


port clear : (String -> message) -> Sub message


port updateEntity : (( String, Int, Int ) -> message) -> Sub message
