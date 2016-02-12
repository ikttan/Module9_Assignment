library(shiny)
shinyServer(
  function(input, output) {
    ## Reading data from files, do some cleansing and store required data into a data.frame MyData
    ## Note that commented lines below to read file interactively
    
    # RainData <- read.csv(file.choose(), header = TRUE, sep = ",")
    RainData <- read.csv("rainWind.csv", header = TRUE, sep = ",")
    RainData$Date <- as.Date(paste(RainData$Year, RainData$Month, RainData$Day, sep = "-"))
    RainData <- RainData[, c(5,4)]

    # RiverData <- read.csv(file.choose(), header = TRUE, sep = ",")
    RiverData <- read.csv("riverLevel.csv", header = TRUE, sep = ",")
    RiverData$Date <- as.Date(paste(RiverData$Year, RiverData$Month, RiverData$Day, sep = "-"))
    RiverData <- RiverData[, c(5,4)]
    
    # Merged data for further processing
    MyData <- merge(RainData, RiverData, by = "Date", all =TRUE)
    MyData$Rainfall <- as.character(MyData$Rainfall)
    MyData$Rainfall <- as.numeric(MyData$Rainfall)
    MyData$Rainfall[(MyData$Rainfall < 0 | is.na(MyData$Rainfall))] <- 0
    MyData$cumRain <- MyData$Rainfall
    
    ## Render the plot on the mainPanel of ui.R
    output$myplot <- renderPlot({
      colm <- as.numeric(input$var)
      
      cumDays <- as.numeric(input$integer)
      # I want the following from the FOR loop, can't figure out how to do this with sapply or apply
      #plotData$cumRain[5] <- cumsum(plotData$Rainfall[1:5])[5]
      #plotData$cumRain[6] <- cumsum(plotData$Rainfall[2:6])[5]
      #plotData$cumRain[7] <- cumsum(plotData$Rainfall[3:7])[5]
      
      for(i in cumDays:length(MyData$Rainfall)) {
        MyData$cumRain[i] <- cumsum(MyData$Rainfall[i-cumDays+1:i])[cumDays]
      }
  
      if (colm == 4){
        plot(MyData$Date+cumDays ,MyData$Rainfall, xlab = "Date", ylab = "Rain in (mm), RiverLevel in (m)", xlim = c(as.Date(input$date[1]+cumDays, format="%Y-%m-%d"),as.Date(input$date[2], format="%Y-%m-%d")))
        lines(MyData$Date+cumDays, MyData$cumRain, type="l", col="brown")
#       lines(MyData$Date, MyData$Rainfall, type="l", col="brown")
        lines(MyData$Date+cumDays, MyData$RiverWaterLevel, type="l", col="green")
        legend("topright", c("Rain Fall (mm)", "River Level(m)"), lty=1, col=c("brown", "green"))
      }
      else{
        plot(MyData$Date ,MyData[,colm], xlab = "Date", ylab = names(MyData[colm]), xlim = c(as.Date(input$date[1], format="%Y-%m-%d"),as.Date(input$date[2], format="%Y-%m-%d")))
      }
      axis(1, MyData$Date, format(MyData$Date, "%b %d"), cex.axis = .7) 
    })
    
    ## Run the correlation function below the plot on the mainPanel of ui.R
    ## Note that I have hardcoded the correlation function to use spearman's
    output$text <- renderText({
      #Test <- MyData[as.Date(MyData$Date) >= as.Date(input$date[1]) & as.Date(MyData$Date) <= as.Date(input$date[2]), ,]
      cumDays <- as.numeric(input$integer)
      for(i in cumDays:length(MyData$Rainfall)) {
        MyData$cumRain[i] <- cumsum(MyData$Rainfall[i-cumDays+1:i])[cumDays]
      }
      corr <- cor(MyData$cumRain[], MyData$RiverWaterLevel[], use = "everything", method="spearman")
      #corr <- cor(Test$Rainfall[], Test$RiverWaterLevel[], use = "everything", method="spearman")
      paste("The correlation is ", corr)
    })
  }
)