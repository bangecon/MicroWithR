library(shiny)
library(tidyr)
library(stringr)
library(googlesheets4)
ui <- fluidPage(
  titlePanel("Random Presenter"),
  sidebarPanel(
    numericInput(
      inputId = "seed",
      label = "Enter the current time (HHMMSS).",
      value = as.integer(gsub("-", "", Sys.Date()))
    ),
    textInput(
      inputId = "sheet",
      label = "Enter the sheet ID of the roster",
      value = NULL
    ),
    actionButton("go", "Go!"),
    hr(),
    a("Created by Jim Bang", href='https://github.com/bangecon'),
    a("St. Ambrose University", href='https://www.sau.edu/')
  ),
  mainPanel(textOutput("winner"), style = "font-size:40px; ")
)

server <- function(input, output) {
  roster <- eventReactive(input$go {
    sheet <- input$sheet
    g <- as.data.frame(read_sheet(sheet))
    g[,1]
  })
  output$winner <- renderText( {
    set.seed(input$seed)
    winner <- sample(roster(), 1)
    winner
  })
}

shinyApp(ui = ui, server = server)
