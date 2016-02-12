---
title       : Determining Correlation Between Cumulative Rainfall and River Water Level
subtitle    : Module 9 - Developing Data Products Assignment
author      : Ian K T Tan
job         : Wannabe Data Scientist
framework   : io2012        # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : tomorrow      # 
widgets     : [quiz, bootstrap, shiny, interactive]
mode        : selfcontained # {standalone, draft}
knit        : slidify::knit2slides
---

## Introduction

This Shiny application is to determine the correlation between rain fall volume (measured in millimeters) and river water level (measured in meters).  The river water level will provide an early warning to potential flooding of the area.

The application provides

- A graphical visualization of the relationship between rain fall and river water level.
- A correlation index between rainfall and river water level using the Spearman Rank Index.

The rain fall measured can be from cumulative number of days, ranging from single day up to 10 days.

--- .class #id  

## Finding the Best Correlation between Cumulative Rainfall Days and River Level

1. Correlation is the measure of associative strengths between two variables.
2. Three most common types are
  . Pearson: For linear related variables, as in the two variables are of the same metrics and scale.
  . Spearman: A non-parametric test that measures the degree of association between two variables of different metrics.
  . Kendall: A non-parametric test that measures the dependence between two variables.
3. The index will fall between -1 and +1 in value, where 0 have no correlation, +1 has perfect correlation and -1 has perfect inverse correlation.

In this Shiny application, Spearman (rank) Index is used as the interest is in the degree of association between the two variables that, although are of the same metrics, but are of different scale.

--- .class #id  

## Concluding Remarks

The Shiny application has shown the use of a slider, a date range picker, plotting of a graph and using the R function

```
corr()
```

Using this information, this Shiny application can be extended to predict whether a flood will occur, from the cumulative rain fall volume, as it can be inferred from potentiatl breaches of the danger level of the river level.

<!--
--- .class #id  
-->

--- &radio
## Quiz

How many cumulative days of rain fall measurement has the best correlation index?

1. 2
2. _3_
3. 5
4. 8

*** .hint
Use the slider on the application and observe the correlation index at the bottom of the main panel.

*** .explanation
If you move the slider to 3, the correlation index should be 0.118xxx, which is the highest value.
