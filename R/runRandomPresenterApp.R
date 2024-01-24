##' Selecting a random student to present a tutorial.
##'
##' This function runs the `randomPresenterApp` from `shiny-examples` to select
##' a random presenter.
##'
##' @export

runRandomPresenterApp <- function() {
  appDir <-
    system.file("shiny-examples/", "randomPresenter", package = "MicroWithR")
  if (appDir == "") {
    stop("Could not find example directory. Try re-installing `MicroWithR`.",
         call. = FALSE)
  }

  shiny::runApp(appDir, display.mode = "normal")
}

