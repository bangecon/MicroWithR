#' @export
recordTutorial <- function(chapter, lesson, practice = FALSE) {
  tutorial <- paste0("tutorials/", chapter, "_", lesson, "_")
  appDir <- system.file(tutorial, package = "MicroWithR")
  if (appDir == "") {
    stop("Could not find example directory. Try re-installing `microWithR`.",
         call. = FALSE)
  }
  file = paste0(appDir, "/", chapter, "_", lesson, ".Rmd")


  learnr::run_tutorial(appDir)
}
