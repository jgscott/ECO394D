Hypothesis testing  
===================
date: James Scott (UT-Austin)
autosize: true
font-family: 'Gill Sans'
transition: none


<style>
.small-code pre code {
  font-size: 1em;
}
</style>




Reference: "Data Science" Chapter 7  


Outline
=====

- An introductory example  
- The four steps of every hypothesis test  
- $p$-values  
- permutation tests  


The Patriots
=======

Unless you're from a narrow strip of land from Connecticut to Maine, you probably dislike the New England Patriots.  

<img src="fig/patriots_logo.png" title="plot of chunk unnamed-chunk-1" alt="plot of chunk unnamed-chunk-1" width="400px" style="display: block; margin: auto;" />


The Patriots
=======

First of all, they win too much.  

<img src="fig/patriots_superbowl.jpg" title="plot of chunk unnamed-chunk-2" alt="plot of chunk unnamed-chunk-2" width="750px" style="display: block; margin: auto;" />




The Patriots
=======

Then there's Tom Brady, their star quarterback... 

<img src="fig/tb12.jpeg" title="plot of chunk unnamed-chunk-3" alt="plot of chunk unnamed-chunk-3" width="300px" style="display: block; margin: auto;" />


"The more hydrated I am, the less likely I am to get sunburned."  --TB12  


The Patriots
=======

And Bill Belichick, their coach...

<img src="fig/EmperorBelichick.jpg" title="plot of chunk unnamed-chunk-4" alt="plot of chunk unnamed-chunk-4" width="800px" style="display: block; margin: auto;" />


The Patriots
=======

And of course, the cheating!  

<img src="fig/gameball.jpg" title="plot of chunk unnamed-chunk-5" alt="plot of chunk unnamed-chunk-5" width="500px" style="display: block; margin: auto;" />


The Patriots
=======

But could even the Patriots cheat at the _pre-game coin toss?_  



The Patriots
=======

Many people think so!  

<img src="fig/coin_toss.png" title="plot of chunk unnamed-chunk-6" alt="plot of chunk unnamed-chunk-6" width="650px" style="display: block; margin: auto;" />


The Patriots
=======
incremental: true

For a 25-game stretch during the 2014 and 2015 NFL seasons, the Patriots won the pre-game coin toss 19 out of 25 times, for a suspiciously high winning percentage of 76%.  

Shannon Sharpe: "This proves that either God or the devil is a Patriots fan, and it can't possibly be God."  


The Patriots
=======

"Use the Force..."

<img src="fig/EmperorBelichick.jpg" title="plot of chunk unnamed-chunk-7" alt="plot of chunk unnamed-chunk-7" width="800px" style="display: block; margin: auto;" />



The Patriots
=======

But before we invoke religion or the Force to explain this fact, let's consider the innocent explanation first: blind luck.  
- If you toss a coin over and over again, you'll see some long streaks with more heads, and some with more tails, just by luck.  
- Is it plausible that the Patriots just went on a lucky 25-game streak?  


The Patriots
=======

To the code in `patriots.R`!  Let's simulate some coin flips.  


Summary
=======

This simple example has all the major elements of _hypothesis testing_:  
  1. We have a _null hypothesis_, that the pre-game coin toss in the Patriots' games was truly random.  
  2. We use a _test statistic_, number of Patriots' coin-toss wins, to measure the evidence against the null hypothesis.  
  3. We calculated the probability distribution of the test statistic, assuming that the null hypothesis is true.  Here, we just ran a Monte Carlo simulation of coin flips, assuming an unbiased coin.  
  4. Finally, we used this probability distribution to assess whether the null hypothesis looked believable in light of the data.  


Summary
=======

All hypothesis testing problems have these same four elements.  

  1. A null hypothesis $H_0$.  
  2. A test statistic $T \in \mathcal{T}$ that summarizes the data and measures the evidence against the null hypothesis.  (More extreme values of $T$ mean stronger evidence.)  
  3. $P(T \mid H_0)$:  the sampling distribution of the test statistic, assuming the null hypothesis is true.  
  4. A rejection region $R \subset \mathcal{T}$.  
