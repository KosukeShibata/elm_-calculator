module Calculator exposing (calc)

import Browser
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)

calc : Program () Model Msg
calc = Browser.sandbox
    { init = init
    , view = view
    , update = update
    }

-- MODEL
type alias Model =
    { firstNum : Int
    , secondNum : Int
    , resultNum : Int
    , selectOpe : OpeDivision
    }

type OpeDivision
    = Init
    | Sum
    | Diff
    | Product
    | Quotient

init : Model
init =
    { firstNum = 0
    , secondNum = 0
    , resultNum = 0
    , selectOpe = Init
    }
