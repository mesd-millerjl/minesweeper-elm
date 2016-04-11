module Row where

import Cell
import Effects
import Html


-- MODEL

type alias Model =
  { cells : List Cell.Model
  }


init : Int -> (Model, Effects.Effects Action)
init width =
  ( Model <| List.repeat width <| fst Cell.init
  , Effects.none
  )


-- UPDATE

type Action
    = Nothing


update : Action -> Model -> (Model, Effects.Effects Action)
update action model =
  case action of
    Nothing ->
      ( model, Effects.none )


-- VIEW

view : Signal.Address Action -> Model -> Html.Html
view address model =
  Html.span [] []
