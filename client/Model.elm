module Model exposing (getInitialModel, Model)

import Types exposing (Flags, Entities, Entity, EntityType, EntityType(..), GameState, GameMode(..))
import Array
import Entities.Link exposing (link)
import Entities.Octorock exposing (getOctorock)


entities : Entities
entities =
    [ link
    , getOctorock ( 200, 200 )
    , getOctorock ( 300, 300 )
    , getOctorock ( 350, 300 )
    , getOctorock ( 100, 120 )
    ]


type alias Model =
    { entities : Entities
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
