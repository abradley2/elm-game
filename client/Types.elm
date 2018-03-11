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
    }


type alias PlayerAttrs =
    { name : String
    }


type EntityType
    = Player PlayerAttrs
    | Bomb


type alias Sprite =
    { xSrc : Int
    , ySrc : Int
    , width : Int
    , height : Int
    , xPos : Int
    , yPos : Int
    }


type alias SpriteSheet =
    Array.Array Sprite


type alias Entity =
    { spriteSheet : String
    , sprites : SpriteSheet
    , activeSprite : Int
    , entityType : EntityType
    , active : Bool
    }
