library(shiny)

shinyUI(pageWithSidebar(
  headerPanel("Determining Correlation Between Cumulative Rainfall and River Water Level"),
  sidebarPanel(
    h5('There are three input variables in this application:'),
    h6('(1) Firstly, select the type of plot you would like to see, (i) Rainfall scatter plot in mm, (ii) River Water Level scatter plot in m and (iii) A Rainfall vs River Water Level Line plot'),
    
    selectInput("var", "Type of Plot", choices = c("Rainfall vs River Water Level" = 4, "Rainfall(mm)" = 2, "River Water Level(m)" = 3)),
    
    h6('(2) Use the slider below to select the number of cumulative days for the Rainfall.  This is only useful for the line plot of Rainfall vs River Water Level'),
    sliderInput("integer", "Cumulative Days:", min=1, max=10, value=2),
    
    h6('(3) The default is for January 2011, you can select for other dates from the date selector (2011 to 2014 only)'),
    dateRangeInput("date", "Select date", start = "2011-01-01", end = "2011-02-07", min = "2011-01-01", max = "2014-12-31", format = "yyyy-mm-dd", startview = "year", weekstart = 0, language = "en", separator = "to", width = NULL),
    
    h6('Note that that other than the plot, there is a correlation (spearman rank) index to determine which cumulative number of days will have the best correlation to river water level (should be 3)')
  ),
  
  mainPanel(
    h3('Plot'),
    plotOutput("myplot"),
    h3('Correlation Index'),
    textOutput("text")
  )
))