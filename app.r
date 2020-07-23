library(shiny)
library(shinyjs)
library(shinyalert)
library(shinythemes)
library(tidyverse)
library(DBI)
library(RMariaDB)
library(DT)
source("download_tweet.r")
#source("quizbot_functions.R")
ui <- fluidPage(
  HTML('<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/dt/dt-1.10.21/datatables.min.css"/>'),
  tags$head(tags$style(".modal-dialog{ width:1000px;}")),
  useShinyalert(),HTML('<style>.sweet-alert{width: 878px;
                       margin-left:-440px;}</style>'),
  titlePanel(title=div(h1("Twitter Analytics",style={'background-color: #115EA4; 
                                              color: white;
                                              border-radius: 6px;
                                              padding: 0px;
                                              font-family: "Lucida Console", Courier, monospace;
                                              font-weight: bold; font-size: 75px'})
  ),
  ),
  useShinyjs(),
  sidebarLayout(
    sidebarPanel(
      HTML('<style>
      body {
                background-image:url("https://i.pinimg.com/736x/b0/de/0c/b0de0c7b2f6df8114a616f7e9b1dfc67.jpg");
                background-size: cover;
                background-repeat: no-repeat;
                
                
                background-position: center;
                  }
            #go{
            width: 100%;
            }
            #button{
            float: right;
            margin-right: 15px;
            }
           </style>'),
      textInput("hashtag","Hashtag",placeholder = "type the hashtag you want to analyze"),
      actionButton(
        "go",
        "Analyze tweets",
        class = "btn-primary"
      )
    ),
    mainPanel(
      DT::dataTableOutput('input_file_table')
    )
  ),theme = shinytheme("cerulean")
)

server <- function(input, output){
  observeEvent(input$go,{
    output$input_file_table <- DT::renderDataTable({
      input$hashtag %>% analyze_tweet_fun()
    })
  
})
}
shinyApp(ui, server)