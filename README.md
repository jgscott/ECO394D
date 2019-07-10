# ECO 394D: Probability and Statistics


## What is this course about?

This class is about gaining knowledge from data and about understanding random phenomena.  We'll cover a mix of practice and principles:  
- You'll learn the mathematical foundations of probability, the language for expressing judgments about uncertain outcomes.  
- You'll gain a solid understanding of some essential statistical ideas: estimation, hypothesis testing, regression, and a few others.  
- You'll learn some concrete data-crunching skills, using the [R language](https://www.rstudio.com/).    

There's also an important intermediate-term goal: prep you for Econometrics this upcoming academic year.  


## Software

Please install [R](http://www.r-project.org) and then [RStudio](http://www.rstudio.org) on your own computer.  Detailed instructions for installing these two programs [can be found here](https://github.com/jgscott/learnR/blob/master/basics/installing_R.md).  Both are free.

R is the underlying data-analysis program we'll use in this course, while RStudio provides a nice front-end interface to R that makes certain repetitive steps (e.g. loading data, saving plots) very simple.   We will use RStudio a little bit in the beginning of the course, and a lot more towards the middle and end.  RStudio depends upon having R available behind the scenes, so make sure you install both, even though you won't need to interact directly with R.  


# Topics outline

## Part 1: Probability  

In this first part of the course, we'll learn the mathematical foundations of probability.  

### Introduction to probability  

Slides: [Introduction to Probability](http://rpubs.com/jgscott/intro_probability)  

R scripts:  
- [predimed_intro.R](R/predimed_intro.R)  

Two short pieces that illustrate the "fallacy of mistaken compounding":  
- [How likely is it that birth control could let you down?](https://www.nytimes.com/interactive/2014/09/14/sunday-review/unplanned-pregnancies.html) from the _New York Times_  
- An excerpt from Chapter 7 of [AIQ: How People and Machines are Smarter Together](https://github.com/jgscott/ECO394D/blob/master/ref/AIQ_excerpt_contraceptive_effectiveness.pdf), by Nick Polson and James Scott.    



### Discrete random variables

Slides: [Discrete random variables](http://rpubs.com/jgscott/discrete_random_variables)  


R scripts:  
- [poisson_binomial.R](./R/poisson_binomial.R)  


### General random variables

Slides: [General random variables](http://rpubs.com/jgscott/general_random_variables)   

R scripts:  
- [textmax_example.R](./r/textmax_example.R)  
- [normal_example.R](./R/normal_example.R)  
- [wellbore.R](./R/wellbore.R)    


### Multivariate distributions

Slides: [Multivariate distributions](http://rpubs.com/jgscott/multivariate_distributions)   



## Part 2: Data analysis

In this middle part of the course, we spend a lot more time hands-on with data sets and with R.  


### Data exploration and visualization

Topics: data visualization and practice with R.  Bar plots; basic plots for numerical data (scatterplots, boxplots, histograms, line graphs); panel plots.  Introduction to ggplot2.  

Examples of [bad graphics](ref/badgraphics.pdf).  

Slides: [Introduction to Data Exploration](http://rpubs.com/jgscott/data_exploration)  

R scripts and data:  
- [mpg.R](R/mpg.R)  
- [titanic.R](R/titanic.R) and [TitanicSurvival.csv](data/TitanicSurvival.csv)  
- [toyimports_linegraph.R](R/toyimports_linegraph.R) and [toyimports.csv](data/toyimports.csv)  


Inspiration:  
- [50 ggplots](http://r-statistics.co/Top50-Ggplot2-Visualizations-MasterList-R-Code.html)  
- [A map of average ages in Swiss municipalities](https://github.com/grssnbchr/thematic-maps-ggplot2)  
- [Low-income students in college](https://www.nytimes.com/interactive/2017/01/18/upshot/some-colleges-have-more-students-from-the-top-1-percent-than-the-bottom-60.html)  
- [The French presidential election](https://www.nytimes.com/interactive/2017/04/23/world/europe/french-election-results-maps.html)  
- [LeBron James's playoff scoring record](https://www.nytimes.com/interactive/2017/05/25/sports/basketball/lebron-career-playoff-points-record.html)   



### Fitting equations to data

Slides: [Fitting equations](http://rpubs.com/jgscott/fitting_equations)  
  
R scripts and data:    
- [afc.R](./r/afc.R) and [afc.csv](data/afc.csv)
- [creatinine.csv](data/creatinine.csv)  



## Part 3: Statistical inference


### Sampling distributions and the bootstrap

### Bounds and limit theorems 
