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

## Rivel Level dependent on Cumulative Rainfall

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

--- .class #id  

--- &radio
## Feedback

What is 1 + 1?

1. 1
2. _2_
3. 3
4. 4

*** .hint
This is a hint

*** .explanation
This is an explanation
