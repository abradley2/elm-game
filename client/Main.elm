module Main exposing (..)

import AnimationFrame
import Html exposing (Html, div)
import Keyboard
import Time
import Model exposing (getInitialModel)
import Types exposing (GameMode(..), EntityType(..))
import Render exposing (draw)
import Model exposing (Model)
import Message exposing (Cmds, Msg, Msg(..))
import Ports exposing (updateEntity, clear)
import Update.GameState exposing (updateGameState)
import Update.Player exposing (updatePlayer)
import Update.Octorock exposing (updateOctorock)


init flags =
    ( getInitialModel flags
    , Cmd.batch []
    )


createReducer message getter setter reducer ( model, commands ) =
    let
        state =
            getter model

        ( newState, newCommands ) =
            reducer ( message, state, commands )
    in
        ( setter model newState, newCommands )


update : Msg -> Model -> ( Model, Cmd Msg )
update message model =
    let
        ( resultModel, resultCommands ) =
            ( model, [] )
                |> createReducer message
                    (\model -> model.gameState)
                    (\model gameState -> { model | gameState = gameState })
                    updateGameState
    in
        case message of
            Tick _ ->
                ( { resultModel
                    | entities =
                        List.map
                            (\entity ->
                                case entity.entityType of
                                    Player _ ->
                                        updatePlayer resultModel.gameState entity

                                    Octorock _ ->
                                        updateOctorock resultModel.gameState entity
                            )
                            resultModel.entities
                  }
                , Cmd.batch resultCommands
                )

            Animate _ ->
                ( resultModel
                , Cmd.batch (draw resultModel.entities)
                )

            _ ->
                ( resultModel, Cmd.batch resultCommands )


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
                case model.gameState.mode of
                    Playing ->
                        Sub.batch
                            [ AnimationFrame.diffs Animate
                            , Keyboard.downs (KeyChange True)
                            , Keyboard.ups (KeyChange False)
                            , Time.every 17 Tick
                            ]

                    Paused ->
                        Sub.batch
                            [ Keyboard.downs (KeyChange True)
                            , Keyboard.ups (KeyChange False)
                            ]
        }
