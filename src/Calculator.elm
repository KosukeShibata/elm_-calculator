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
    { firstNum : Float
    , secondNum : Float
    , resultNum : Float
    }


init : Model
init =
    { firstNum = 0
    , secondNum = 0
    , resultNum = 0
    }

-- UPDAE
type Msg
    = Submit OpeDivision
    | InputFirstNum String
    | InputSecondNum String


type OpeDivision
    =  Sum
    | Diff
    | Product
    | Quotient

update : Msg -> Model -> Model
update msg model =
    case msg of
        Submit div ->
            case div of
                Sum ->
                    { model | resultNum = model.firstNum + model.secondNum }

                Diff ->
                    { model | resultNum = model.firstNum - model.secondNum }

                Product ->
                    { model | resultNum = model.firstNum * model.secondNum }

                Quotient ->
                    if model.secondNum == 0 then
                        { model | resultNum = 0}
                    else
                        { model | resultNum =  model.firstNum / model.secondNum }

        InputFirstNum input ->
            { model | firstNum = String.toFloat input }

        InputSecondNum input ->
            { model | secondNum = String.toInt input }

--

-- VIEW
view : Model -> Html Msg
view model =
    div []
        [ input [ value ( String.fromFloat model.firstNum ) , onInput InputSecondNum ] []
        , input [ value ( String.fromFloat model.secondNum ), onInput InputSecondNum ] []
        , button [ onClick ( Submit Sum ) ] [ text "+" ]
        , button [ onClick ( Submit Diff ) ] [ text "-"]
        , button [ onClick ( Submit Product ) ] [ text "*" ]
        , button [ onClick ( Submit Quotient ) ] [ text "/"]
        ]


