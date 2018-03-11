port module Ports exposing (..)

import Types exposing (Entity)


port clear : String -> Cmd message


port updateEntity : ( String, Int, Int, Int, Int, Int, Int ) -> Cmd message
