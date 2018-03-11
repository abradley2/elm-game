module Update.GameState exposing (updateGameState)

import Message exposing (Msg, Msg(..), Cmds)
import Types exposing (GameState, GameMode(..), GameMode)


updateKeys on keycode controls =
    case keycode of
        37 ->
            { controls | left = on }

        39 ->
            { controls | right = on }

        40 ->
            { controls | down = on }

        38 ->
            { controls | up = on }

        _ ->
            controls


updateGameState : ( Msg, GameState, Cmds ) -> ( GameState, Cmds )
updateGameState ( message, gameState, commands ) =
    case message of
        Animate time ->
            ( { gameState
                | lastFrame = (time / 17)
              }
            , commands
            )

        KeyChange on keycode ->
            ( { gameState
                | controls = updateKeys on keycode gameState.controls
              }
            , commands
            )

        _ ->
            ( gameState, commands )
