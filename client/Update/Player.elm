module Update.Player exposing (updatePlayer)

import Array
import Message exposing (Cmds, Msg, Msg(..))
import Types exposing (Entities, GameState, Entity)


updatePlayer gameState entity =
    let
        controls =
            gameState.controls
    in
        if controls.down then
            ({ entity | yPos = entity.yPos + 3 })
        else if controls.up then
            ({ entity | yPos = entity.yPos - 3 })
        else if controls.right then
            ({ entity | xPos = entity.xPos + 3 })
        else if controls.left then
            ({ entity | xPos = entity.xPos - 3 })
        else
            entity
