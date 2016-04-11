module Board where

import Row
import Effects
import Html


-- MODEL

type alias Model =
  { rows : List Row.Model
  }


init : Int -> Int -> (Model, Effects.Effects Action)
init width height =
  ( Model <| List.repeat height <| fst <| Row.init width
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
