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
    | Cell Cell.Action


update : Action -> Model -> (Model, Effects.Effects Action)
update action model =
  case action of
    Nothing ->
      ( model, Effects.none )
    Cell action ->
      ( { model | cells = List.map fst
          <| List.map (Cell.update action) model.cells
        }
      , Effects.none
      )


-- VIEW

displayCell : Signal.Address Action -> Cell.Model -> Html.Html
displayCell address cell =
  Cell.view (Signal.forwardTo address Cell) cell


view : Signal.Address Action -> Model -> Html.Html
view address model =
  Html.div [] <| List.map (displayCell address) model.cells
