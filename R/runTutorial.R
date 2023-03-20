##' Running a tutorial for MicroWithR.
##'
##' This function runs a `MicroWithR` tutorial.
##'
##' @param data is the universe of all variables considered, which may include
##' both controls and excluded variables (e.g. variables eliminated by a model
##' selection algorithm).
##' @param module is a numerical value corresponding to the module.
##'     0 = Introduction
##'     1 = Consumer Equilibrium
##'     2 = Producer Equilibrium
##'     3 = Market Equilibrium
##' @param lesson is a numerical value corresponding to the lesson within a module.
##' @param practice is a logical value indicating whether to clear the main tutorial or practice.
##' @export

runTutorial <- function(module, lesson, practice = FALSE, ...) {
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
  learnr::run_tutorial(appDir)
}
