module Types exposing (..)

import Array


type alias Flags =
    { width : Int
    , height : Int
    }


type GameMode
    = Paused
    | Playing


type alias GameState =
    { mode : GameMode
    , lastFrame : Float
    , controls :
        { up : Bool
        , right : Bool
        , down : Bool
        , left : Bool
        }
    }


type EntityType
    = Player { name : String }
    | Bomb


type alias Sprite =
    { xSrc : Int
    , ySrc : Int
    , width : Int
    , height : Int
    }


type alias SpriteSheet =
    Array.Array Sprite


type alias Entity =
    { spriteSheet : String
    , sprites : SpriteSheet
    , activeSprite : Int
    , entityType : EntityType
    , active : Bool
    , xPos : Int
    , yPos : Int
    }


type alias Entities =
    Array.Array Entity
