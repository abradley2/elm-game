module Model exposing (getInitialModel)

import Data exposing (Flags, Entity, EntityType, EntityType(..), GameState, GameState(..))
import Update.Controls
import Array


getBaseEntity spriteStr typeArgs =
    { sprite = spriteStr
    , x = 0
    , y = 0
    , width = 40
    , height = 40
    , entityType = typeArgs
    , active = False
    }


entities : Array.Array Entity
entities =
    Array.fromList
        [ (getBaseEntity "somesprite.png" (Player { name = "Tony" }))
        , (getBaseEntity "somesprite.png" Bomb)
        , (getBaseEntity "somesprite.png" Bomb)
        ]


type alias Model =
    { controls : Update.Controls.ControlsModel
    , entities : Array.Array Entity
    , gameState : GameState
    }


getInitialModel : Flags -> Model
getInitialModel flags =
    { controls = Update.Controls.initialState
    , entities = entities
    , gameState = Playing
    }
