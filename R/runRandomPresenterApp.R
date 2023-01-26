#' @export
runRandomPresenterApp<- function() {
  appDir <- system.file("shiny-examples", "randomPresenterApp", package = "MicroWithR")
  if (appDir == "") {
    stop("Could not find example directory. Try re-installing `econGame`.", call. = FALSE)
  }

  shiny::runApp(appDir, display.mode = "normal")
}
