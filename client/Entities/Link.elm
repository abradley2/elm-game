module Entities.Link exposing (link)

import Array
import Types exposing (EntityType(..), SpriteSheet, Entity)


spriteSheet : SpriteSheet
spriteSheet =
    Array.fromList
        [ { xSrc = 0
          , ySrc = 0
          , width = 16
          , height = 16
          }
        ]


link =
    { spriteSheet = "assets/link.png"
    , sprites = spriteSheet
    , activeSprite = 0
    , entityType = Player { name = "link" }
    , active = True
    , xPos = 50
    , yPos = 50
    }
