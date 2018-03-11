module Data exposing (..)

import Array


type alias Flags =
    { width : Int
    , height : Int
    }


type GameState
    = Menu
    | Playing


type alias PlayerAttrs =
    { name : String
    }


type EntityType
    = Player PlayerAttrs
    | Bomb


type alias Entity =
    { sprite : String
    , x : Int
    , y : Int
    , width : Int
    , height : Int
    , entityType : EntityType
    , active : Bool
    }
