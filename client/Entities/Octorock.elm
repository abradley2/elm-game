module Entities.Octorock exposing (getOctorock)

import Array
import Types exposing (EntityType(..), SpriteSheet, Entity)


spriteSheet : SpriteSheet
spriteSheet =
    Array.fromList
        [ { xSrc = 8
          , ySrc = 8
          , width = 24
          , height = 24
          }
        ]


getOctorock ( xPos, yPos ) =
    { spriteSheet = "assets/enemies.png"
    , sprites = spriteSheet
    , activeSprite = 0
    , entityType = Octorock { health = 2 }
    , active = True
    , xPos = xPos
    , yPos = yPos
    }
