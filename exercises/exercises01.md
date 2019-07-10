# Exercises 1


## Problem 1

A used car dealer has 30 cars and 10 of them are lemons (i.e.~ mechanically faulty used cars), and you don't know which is which. If you buy 3 cars, what is the probability that you will get at least one lemon?


## Problem 2

We throw two dice. What is the probability that the sum of the two numbers is odd? What is the probability that the sum of the two numbers is less than 7? What is the probability that the sum of the two numbers is less than 7 given that it is odd? Are these two events independent?

## Problem 3

Visitors to your website are asked to answer a single survey question before they get access to the content on the page. Among all of the users, there are two categories: Random Clicker (RC), and Truthful Clicker (TC). There are two possible answers to the survey: yes and no. Random clickers would click either one with equal probability. You are also giving the information that the expected fraction of random clickers is 0.3.  After a trial period, you get the following survey results: 65% said Yes and 35% said No.   What fraction of people who are truthful clickers answered yes?

Note: this was one of the questions a friend of mine got asked in an interview at Google.  

## Problem 4

Imagine a medical test for a disease with the following  attributes:  
- The sensitivity is about 0.993. That is, if someone has the disease, there is a probability of 0.993 that they will test positive.  
- The specificity is about 0.9999. This means that if someone doesn't have the disease, there is probability of 0.9999 that they will test negative.  
- In the general population, incidence of the disease is reasonably rare: about 0.0025% of all people have it (or 0.000025 as a decimal probability).  

Suppose someone tests positive. What is the probability that they have the disease? 


## Problem 5  

Go read the article ["One match to go!"](http://faculty.chicagobooth.edu/nicholas.polson/teaching/41000/speigelhalter-epl.pdf) by Spiegelhalter and Ng.  They describe how they formulated an approach for predicting the probability of different outcomes for soccer matches based on "attack strength" and "defense weakness."  It is better than the simple approach we took in class, though probably not as good as what actual bookies use.

Now go get data from this previous year's English Premiere League soccer season.  For example, you can certainly [find it here](http://www.soccerstats.com/latest.asp?league=england).  You can get home/away splits by clicking on `Home/Away` under the `Statistics` button.   Explain Spiegelhalter and Ng's approach in your own words, and replicate it using this year's data to predict results for the following two matches?  
- What is your probability distribution of likely results for a match between Liverpool (home) and Tottenham (away)?   What is the single most likely score?  
- What is your probability distribution of likely results for Manchester United (home) versus Manchester City (away)?  What is the single most likely score? 

This is probably easiest to do in Excel, although you can certainly use R or similar if you want.  You don't need the break down the results by all possible scores; just summarize the probability of win/lose/draw, in addition to the most likely result.  Note: Spiegelhalter and Ng did the calculations for the whole League, but you certainly don't need to; these two games will suffice.  Also, it's fine to assume independence between the teams' scores.

