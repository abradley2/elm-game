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


type alias Entity a =
    { sprite : String
    , x : Int
    , y : Int
    , width : Int
    , height : Int
    , entityType : EntityType a
    , active : Bool
    }


getBaseEntity spriteStr typeArgs =
    { sprite = spriteStr
    , x = 0
    , y = 0
    , width = 40
    , height = 40
    , entityType = typeArgs
    , active = False
    }


entities =
    Array.fromList
        [ (getBaseEntity "somesprite.png" (Player { name = "Tony" }))
        , (getBaseEntity "somesprite.png" Bomb)
        , (getBaseEntity "somesprite.png" Bomb)
        ]
