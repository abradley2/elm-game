module Update exposing (update)

import Message exposing (Cmds, Msg, Msg(..))
import Ports exposing (updateEntity, clear)
import Update.Controls exposing (updateControls)


createReducer message getter setter reducer ( model, commands ) =
    let
        state =
            getter model

        ( newState, newCommands ) =
            reducer ( message, state, commands )
    in
        ( setter model newState, newCommands )


update message model =
    let
        ( resultModel, resultCommands ) =
            ( model, [] )
                |> createReducer
                    message
                    (\model -> model.controls)
                    (\model controls -> { model | controls = controls })
                    updateControls
    in
        case message of
            Animate _ ->
                ( resultModel, Cmd.batch resultCommands )

            _ ->
                ( resultModel, Cmd.batch resultCommands )
