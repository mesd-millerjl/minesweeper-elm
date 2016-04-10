module Minesweeper where

import Effects
import Html
import Board


-- MODEL

type alias Model =
  { board : Board.Model
  }


init : ( Model, Effects.Effects Action )
init =
  ( Model <| fst <| Board.init 8 8
  , Effects.none
  )


-- UPDATE

type Action
    = Nothing
    | Board Board.Action


update : Action -> Model -> ( Model, Effects.Effects Action )
update action model =
  case action of
    Nothing ->
      ( model
      , Effects.none
      )
    Board action ->
      ( { model | board = fst <| Board.update action model.board }
      , Effects.none
      )


-- VIEW

view : Signal.Address Action -> Model -> Html.Html
view address model =
  Html.span [] [ Board.view (Signal.forwardTo address Board ) model.board ]
