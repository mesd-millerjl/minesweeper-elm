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
    | Row Row.Action


update : Action -> Model -> (Model, Effects.Effects Action)
update action model =
  case action of
    Nothing ->
      ( model, Effects.none )
    Row action ->
      ( { model | rows = List.map fst
          <| List.map (Row.update action) model.rows
        }
      , Effects.none
      )


-- VIEW

displayRow : Signal.Address Action -> Row.Model -> Html.Html
displayRow address row =
  Row.view (Signal.forwardTo address Row) row


view : Signal.Address Action -> Model -> Html.Html
view address model =
  Html.span [] <| List.map (displayRow address) model.rows
