module Model exposing (getInitialModel, Model)

import Types exposing (Flags, Entity, EntityType, EntityType(..), GameState, GameMode(..))
import Update.Controls
import Array
import Sprites.Link exposing (link)


entities : Array.Array Entity
entities =
    Array.fromList
        [ link
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
    , gameState =
        { mode = Playing
        }
    }
