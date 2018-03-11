module Main exposing (..)

import AnimationFrame
import Html exposing (Html, div)
import Keyboard
import Time
import Data exposing (entities)
import Model exposing (getInitialModel)
import Update exposing (update)
import Data exposing (GameState(..))
import Message exposing (Msg, Msg(..))


init flags =
    ( getInitialModel flags
    , Cmd.batch []
    )


main =
    Html.programWithFlags
        { view =
            \model -> div [] []
        , init =
            \flags ->
                ( getInitialModel flags
                , Cmd.batch []
                )
        , update = update
        , subscriptions =
            \model ->
                case model.gameState of
                    Playing ->
                        Sub.batch
                            [ AnimationFrame.diffs Animate
                            , Keyboard.downs (KeyChange True)
                            , Keyboard.ups (KeyChange False)
                            ]

                    Menu ->
                        Sub.batch
                            [ Keyboard.downs (KeyChange True)
                            , Keyboard.ups (KeyChange False)
                            ]

                    _ ->
                        Sub.none
        }
