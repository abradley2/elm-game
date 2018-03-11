module Message exposing (Msg, Msg(..), Cmds)

import Time
import Keyboard


type alias Cmds =
    List (Cmd Msg)


type Msg
    = NoOp
    | Animate Time.Time
    | KeyChange Bool Keyboard.KeyCode
