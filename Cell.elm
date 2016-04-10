module Cell where

import Effects
import Html
import VirtualDom


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

getValue : Model -> VirtualDom.Node
getValue model =
  case model.isCovered of
    True ->
      Html.button [] [ Html.text "?" ]
    False ->
      Html.button [] [ Html.text "X" ]

view : Signal.Address Action -> Model -> Html.Html
view address model =
  Html.span [] [ getValue model ]
