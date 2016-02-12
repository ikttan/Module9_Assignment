# Module9_Assignment

There are 4 important files for this Module 9: Developing Data Product assignment submission.

1. server.R: The shiny application server action script.
2. ui.R: The shiny application user interface script.
3. rainWind.csv: Rain fall in millimeters for the area (undisclosed here).
4. riverLevel.csv: River water level in meters for the same area.

You can find the application at

https://ikttan.shinyapps.io/Module9-Assignment/

# Input Variables

You will be presented with 3 options for the input on the left hand side panel of the application.

1. Firstly, select the type of plot you would like to see, (i) Rainfall scatter plot in mm, (ii) River Water Level scatter plot in m and (iii) A Rainfall vs River Water Level Line plot
2. Use the slider below to select the number of cumulative days for the Rainfall. This is only useful for the line plot of Rainfall vs River Water Level.
3. The default is for January 2011, you can select for other dates from the date selector (2011 to 2014 only).

# Output of Application

There will be a graphical plot depending on the selection for the first input variable.  Below that, there will be a Spearman Rank Correlation Index between the cumulative rain fall against the river water level.
