module Message exposing (Msg, Msg(..), Cmds)

import Time
import Keyboard


type alias Cmds =
    List (Cmd Msg)


type Msg
    = NoOp
    | Tick Time.Time
    | Animate Time.Time
    | KeyChange Bool Keyboard.KeyCode
