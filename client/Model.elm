module Model exposing (getInitialModel)

import Data exposing (Flags, entities, Entity, GameState(..))
import Update.Controls


getInitialModel flags =
    { controls = Update.Controls.initialState
    , entities = entities
    , gameState = Playing
    }
