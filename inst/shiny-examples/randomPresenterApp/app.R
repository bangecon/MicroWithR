library(shiny)
library(tidyr)
library(stringr)
library(googlesheets4)
ui <- fluidPage(
  titlePanel("Random Presenter"),
  sidebarPanel(
    numericInput(
      inputId = "seed",
      label = "Enter today's date.",
      value = as.integer(gsub("-", "", Sys.Date()))
    ),
    textInput(
      inputId = "sheet",
      label = "Enter the sheet ID of the roster",
      value = '1i_hJiSk-TOfqtNOtm7ZUUcJe1gEZSPwowEd5VZlHFNo'
    )
  ),
  mainPanel(textOutput("winner"), style = "font-size:40px; ")
)

server <- function(input, output) {
  roster <- reactive({
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
