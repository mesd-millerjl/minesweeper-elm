module Minesweeper where

import Board
import Cell
import Effects
import Html
import Html.Events
import Row


-- MODEL

type alias Model =
  { board : Board.Model
  , isInitial : Bool
  }


init : ( Model, Effects.Effects Action )
init =
  ( Model (fst <| Board.init 8 8) True
  , Effects.none
  )


-- UPDATE

type Action
    = Nothing
    | Uncover


update : Action -> Model -> ( Model, Effects.Effects Action )
update action model =
  case action of
    Nothing ->
      ( model
      , Effects.none
      )
    Uncover ->
      case model.isInitial of
        True ->
          ( { model | isInitial = False }
          , Effects.none
          )
        False ->
          ( model
          , Effects.none
          )


-- VIEW

displayCell : Signal.Address Action -> Cell.Model -> Html.Html
displayCell address cell =
  case cell.isCovered of
    True ->
      Html.button [ Html.Events.onClick address Uncover ] [ Html.text "?" ]
    False ->
      Html.button [] [ Html.text "X" ]


displayRow : Signal.Address Action -> Row.Model -> Html.Html
displayRow address row =
  Html.div [] <| List.map (displayCell address) row.cells


displayBoard : Signal.Address Action -> Board.Model -> Html.Html
displayBoard address board =
  Html.div [] <| List.map (displayRow address) board.rows


view : Signal.Address Action -> Model -> Html.Html
view address model =
  Html.span []
    [ case model.isInitial of
      True ->
        Html.text "Initial move"
      False ->
        Html.text "Not initial move"
    , displayBoard address model.board
    ]
