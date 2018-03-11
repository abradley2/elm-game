module Update.Controls exposing (updateControls, initialState, ControlsModel)

import Message exposing (Msg, Msg(..), Cmds)


type alias ControlsModel =
    { up : Bool
    , right : Bool
    , down : Bool
    , left : Bool
    }


initialState : ControlsModel
initialState =
    { up = False
    , right = False
    , down = False
    , left = False
    }


updateKeys : Bool -> Int -> ControlsModel -> ControlsModel
updateKeys on keycode controls =
    case keycode of
        37 ->
            { controls | left = on }

        39 ->
            { controls | right = on }

        32 ->
            { controls | up = on }

        _ ->
            controls


updateControls : ( Msg, ControlsModel, Cmds ) -> ( ControlsModel, Cmds )
updateControls params =
    let
        ( message, controls, commands ) =
            params
    in
        case message of
            KeyChange on keycode ->
                ( updateKeys on keycode controls, commands )

            _ ->
                ( controls, commands )
