module Minesweeper where

import Board
import Cell
import Effects
import Html
import Row


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

displayCell : Cell.Model -> Html.Html
displayCell cell =
  case cell.isCovered of
    True ->
      Html.button [] [ Html.text "?" ]
    False ->
      Html.button [] [ Html.text "X" ]


displayRow : Row.Model -> Html.Html
displayRow row =
  Html.div [] <| List.map displayCell row.cells


displayBoard : Board.Model -> Html.Html
displayBoard board =
  Html.div [] <| List.map displayRow board.rows


view : Signal.Address Action -> Model -> Html.Html
view address model =
  Html.span [] [ displayBoard model.board ]
