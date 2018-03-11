module Model exposing (getInitialModel, Model)

import Types exposing (Flags, Entity, EntityType, EntityType(..), GameState, GameMode(..))
import Array
import Entities.Link exposing (link)


entities : Array.Array Entity
entities =
    Array.fromList
        [ link
        ]


type alias Model =
    { entities : Array.Array Entity
    , gameState : GameState
    }


getInitialModel : Flags -> Model
getInitialModel flags =
    { entities = entities
    , gameState =
        { mode = Playing
        , lastFrame = 0
        , controls =
            { up = False
            , right = False
            , down = False
            , left = False
            }
        }
    }
