module Cell where

import Effects
import Html


-- MODEL

type alias Model =
  { isCovered : Bool
  , isFlagged : Bool
  , hasMine : Bool
  }


init : (Model, Effects.Effects Action)
init =
  ( Model True False False
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
