module Main exposing (..)

import AnimationFrame
import Html exposing (Html, div)
import Keyboard
import Time
import Array
import Model exposing (getInitialModel)
import Types exposing (GameMode(..))
import Model exposing (Model)
import Message exposing (Cmds, Msg, Msg(..))
import Ports exposing (updateEntity, clear)
import Update.Controls exposing (updateControls)


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
                    (\model -> model.controls)
                    (\model controls -> { model | controls = controls })
                    updateControls
    in
        case message of
            Animate _ ->
                ( resultModel
                , Cmd.batch
                    ((clear "clear")
                        :: (resultModel.entities
                                |> Array.filter (\entity -> entity.active)
                                |> Array.foldr
                                    (\entity sprites ->
                                        let
                                            indexedSprite =
                                                if (not entity.active) then
                                                    Nothing
                                                else
                                                    Array.get entity.activeSprite entity.sprites
                                        in
                                            case indexedSprite of
                                                Just sprite ->
                                                    Array.push ( entity.spriteSheet, sprite ) sprites

                                                Nothing ->
                                                    sprites
                                    )
                                    Array.empty
                                |> Array.toList
                                |> List.map
                                    (\( spriteSheet, s ) ->
                                        updateEntity ( spriteSheet, s.xSrc, s.ySrc, s.width, s.height, s.xPos, s.yPos )
                                    )
                           )
                    )
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
                            ]

                    Paused ->
                        Sub.batch
                            [ Keyboard.downs (KeyChange True)
                            , Keyboard.ups (KeyChange False)
                            ]
        }
