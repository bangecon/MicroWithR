#' @export
recordTutorial <- function(chapter, lesson, practice = FALSE) {
  if(practice == TRUE) {
    tutorial <- paste0("tutorials/", module, "_", lesson, "_Practice")
    appDir <- system.file(tutorial, package = "MicroWithR")
    if (appDir == "") {
      stop("Could not find example directory. Try re-installing `MicroWithR`.", call. = FALSE)
    }
    file = paste0(appDir, "/", module, "_", lesson, "_Practice.Rmd")
  } else {
    tutorial <- paste0("tutorials/", module, "_", lesson)
    appDir <- system.file(tutorial, package = "MicroWithR")
    if (appDir == "") {
      stop("Could not find example directory. Try re-installing `MicroWithR`.", call. = FALSE)
    }
    file = paste0(appDir, "/", module, "_", lesson, ".Rmd")
  }
  shinytest::recordTest(appDir)
}
