# library(shiny) 

load("data/lasso.Rdata")
#look for cv_out to plot
load("data/pc-regression.Rdata")
#validationplot(pcr_fit, val.type = 'MSEP')
load("data/plsr_regression.Rdata")
#validationplot(pls_fit, val.type="MSEP")...look for pls_fit
load("data/ridge-regression.Rdata")
#look for cv_ridge_models to plot....plot(cv_ridge_models)



#UI for drop down menu

UI <- fluidPage(
  selectInput(inputId = "method",
             label = "Regression Method:",
             choices = c("ridge", "lasso", "pcr", "plsr"),
             selected = "ridge"),
  plotOutput(outputId = "main_plot")
)

## plots for regression methods 
server <- function(input, output) {
   
   output$main_plot <- renderPlot({
     
      if(input$method == "ridge"){
        plot(cv_ridge_models)
      } else if(input$method == "lasso"){
        plot(cv_out)
      } else if(input$method == "pcr"){
        validationplot(pcr_fit, val.type="MSEP")
      } else
        validationplot(pls_fit, val.type="MSEP")


   }
 }

shinyApp(ui = UI, server = server) 