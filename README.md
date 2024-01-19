This package contains tutorials for managerial economics using computational method in R.

## Installation

To install `managerialEconWithR` you will need to install `R` (>=  4.1.2) and `RStudio` (for rendering markdown tutorials). 

Next you will need the following packages (they are dependencies for `managerialEconWithR` but it helps to install them individually for reasons the author of this package does not fully understand!):  
1. `devtools` (CRAN)
2. `pak` (CRAN)
3. `learnr` (CRAN)
4. `gradethis` (Github: `devtools::install_github('rstudio/gradethis')` or `pak::pkg_install(rstudio/gradethis)`)
5. `ggcheck` (Github: `devtools::install_github('rstudio/ggcheck')` or `pak::pkg_install(rstudio/ggcheck)`)

Finally, to install `managerialEconWithR` you can use either of the following: 
1. `devtools::install_github('bangecon/managerialEconWithR')`
2. `pak::pkg_install(bangecon/managerialEconWithR)`

## Running Tutorials

The package includes a helper function, `managerialEconWithR::runTutorial()` that runs the tutorials with relatively little knowledge required (if you've gotten as far as installing everything you need to get to this point, you should be fine!). The syntax for `runTutorial()` takes the following arguments:  
1. `module`: Module number (0 through 4 *or* B and C for some bonus tutorials on probability and statistics);  
2. `lesson`: Lesson number (1 through 6 *or* A through D for extra applications of consumer behavior);  
3. `practice`: Whether to run the main tutorial (`practice = FALSE`, the default) or practice (`practice = TRUE`).

For example, to run the startup tutorial (0.1), you would first load the package with `library(managerialEconWithR)` and then enter the command `runTutorial(0,1)` (equivalent to `runTutorial(module = 0, lesson = 1, practice = FALSE)`). To run the corresponding practice tutorial, you would enter `runTutorial(0,1,TRUE)`. 
