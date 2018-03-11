module Update.Player exposing (updatePlayer)

import Array
import Message exposing (Cmds, Msg, Msg(..))
import Types exposing (Entities, GameState, Entity)


updatePlayerEntity gameState entity =
    let
        controls =
            gameState.controls
    in
        if controls.down then
            ({ entity | yPos = entity.yPos + 2 })
        else if controls.up then
            ({ entity | yPos = entity.yPos - 2 })
        else if controls.right then
            ({ entity | xPos = entity.xPos + 2 })
        else if controls.left then
            ({ entity | xPos = entity.xPos - 2 })
        else
            entity


updatePlayer : ( Msg, ( GameState, Entities ), Cmds ) -> ( Entities, Cmds )
updatePlayer ( message, ( gameState, entities ), commands ) =
    case message of
        Tick milliseconds ->
            let
                updatedEntities =
                    Array.foldr
                        (\entity entities ->
                            Array.push
                                (updatePlayerEntity gameState entity)
                                entities
                        )
                        Array.empty
                        entities
            in
                ( updatedEntities, commands )

        _ ->
            ( entities, commands )
