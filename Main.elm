import Effects
import Minesweeper
import StartApp
import Task


app =
  StartApp.start
    { init = Minesweeper.init
    , update = Minesweeper.update
    , view = Minesweeper.view
    , inputs = []
    }


main =
  app.html


port tasks : Signal ( Task.Task Effects.Never () )
port tasks =
  app.tasks

