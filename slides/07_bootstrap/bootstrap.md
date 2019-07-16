The bootstrap
========================================================
author: An introduction to resampling methods
autosize: false
font-family: 'Gill Sans'
transition: none

<style>
.small-code pre code {
  font-size: 1em;
}
</style>



Reference: _Data Science_ Chapter 5



Quantifying uncertainty
========

From the New England Journal of Medicine in 2006:

> We randomly assigned patients with resectable adenocarcinoma of the stomach, esophagogastric junction, or lower esophagus to either perioperative chemotherapy and surgery (250 patients) or surgery alone (253 patients)....  With a median follow-up of four years, 149 patients in the perioperative-chemotherapy group and 170 in the surgery group had died. As compared with the surgery group, the perioperative-chemotherapy group had a higher likelihood of overall survival (five-year survival rate, 36 percent vs. 23 percent).


Quantifying uncertainty
========

Conclusion: 
- Chemotherapy patients are __13%__ more likely to survive past 5 years.    


Quantifying uncertainty
========

Conclusion: 
- Chemotherapy patients are __13%__ more likely to survive past 5 years.    

Not so fast!  In statistics, we ask "what if?" a lot:  
- What if the randomization of patients just happened, by chance, to assign more of the healthier patients to the chemo group?  
- Or what if the physicians running the trial had enrolled a different sample of patients from the same clinical population?    



Quantifying uncertainty
========

Conclusion: 
- Chemotherapy patients are __13%__ more likely to survive past 5 years.    

Always remember two basic facts about samples:    
- _All numbers are wrong_: any quantity derived from a sample is just a _guess_ of the corresponding population-level quantity.    
- _A guess is useless without an error bar_: an estimate of how wrong we expect the guess to be.  


Quantifying uncertainty
========

Conclusion: 
- Chemotherapy patients are __13% $\pm$ ?__ more likely to survive past 5 years, with __??%__ confidence.  

By "quantifying uncertainty," we mean filling in the blanks.  



Quantifying uncertainty
========

In stats, we equate trustworthiness with _stability_:
- If our data had been different merely due to chance, would our answer have been different, too?
- Or would the answer have been stable, even with different data?  

$$
\begin{array}{r}
\mbox{Confidence in} \\
\mbox{your estimates} \\
\end{array}
\iff
\begin{array}{l}
\mbox{Stability of those estimates} \\
\mbox{under the influence of chance} \\
\end{array}
$$



Quantifying uncertainty
========

For example: 
- If doctors had taken a different sample of 503 cancer patients and gotten a drastically different estimate of the new treatment's effect, then the original estimate isn't very trustworthy.
- If, on the other hand, pretty much any sample of 503 patients would have led to the same estimates, then their answer for _this particular_ subset of 503 is probably accurate.  


Let's work through a thought experiment... 

Kolmorogov goes fishing...
========

<img src="fig/man_fishing.jpeg" title="plot of chunk unnamed-chunk-1" alt="plot of chunk unnamed-chunk-1" width="800px" style="display: block; margin: auto;" />


Kolmorogov goes fishing...
========

Imagine Andrey Kolmorogov on four-day fishing trip.
- The lake is home to a very large population of fish of varying size and weight.  
- On each day, Kolmorogov takes a random sample of size $N=15$ from this population---that is, he catches (and releases) 15 fish.  
- He records the weight and approximate volume of each fish.  
- He uses each day's catch to compute a different estimate of the volume--weight relationship for __all__ fish in the lake.  


Kolmorogov goes fishing...
========

<img src="fig/fishingtrips.png" title="plot of chunk unnamed-chunk-2" alt="plot of chunk unnamed-chunk-2" width="850px" style="display: block; margin: auto;" />


Kolmorogov goes fishing...
========

<img src="fig/fishingtrips2.png" title="plot of chunk unnamed-chunk-3" alt="plot of chunk unnamed-chunk-3" width="850px" style="display: block; margin: auto;" />



Kolmorogov goes fishing...
========

At right we see the _sampling distribution_ for both $\beta_0$ and $\beta_1$.  
- Each is centered on the true population value.  
- The spread of each histogram tells us how _variable_ our estimates are from one sample to the next.  

***

<img src="fig/fishingtrips3.png" title="plot of chunk unnamed-chunk-4" alt="plot of chunk unnamed-chunk-4" width="325px" style="display: block; margin: auto;" />


Some notation
========

Suppose we are trying to estimate some population-level quantity $\theta$: the _parameter_ of interest.  

So we take a sample from the population: $X_1, X_2, \ldots, X_N$.  

We use the data to form an estimate $\hat{\theta}_N$ of the parameter.  


Some notation
========

Suppose we are trying to estimate some population-level quantity $\theta$: the _parameter_ of interest.  

So we take a sample from the population: $X_1, X_2, \ldots, X_N$.  

We use the data to form an estimate $\hat{\theta}_N$ of the parameter.

__Now imagine repeating this process thousands of times!__


Some notation
========

<img src="fig/samplingdistribution_schematic.png" title="plot of chunk unnamed-chunk-5" alt="plot of chunk unnamed-chunk-5" width="625px" style="display: block; margin: auto;" />


Key definitions
========

__Estimator__: any method for estimating the value of a parameter (e.g. sample mean, sample proportion, slope of OLS line, etc).    

__Sampling distribution__: the probability distribution of an estimator $\hat{\theta}_N$ under repeated samples of size $N$.  

__Bias__:  Let $\bar{\theta}_N = E(\hat{\theta}_N)$ be the mean of the sampling distribution.  The bias of $\hat{\theta}_N$ is $(\bar{\theta}_N - \theta)$: the difference between the average answer and the truth.  

__Unbiased estimator__: $(\bar{\theta}_N - \theta) = 0$.


Standard error:
========

__Standard error__: the standard deviation of an estimator's sampling distribution

$$
\begin{aligned}
\mbox{se}(\hat{\theta}_N) &= \sqrt{ \mbox{var}(\hat{\theta}_N) } \\
&= \sqrt{ E[ (\hat{\theta}_N - \bar{\theta}_N )^2]  } \\
&= \mbox{Typical deviation of $\hat{\theta}_N$ from its average} 
\end{aligned}
$$

"If I were to take repeated samples from the population and use this estimator for every sample, how much does the answer vary, on average?"  


Standard error
========

If an estimator is unbiased, then

$$
\begin{aligned}
\mbox{se}(\hat{\theta}_N) &= \sqrt{ E[ (\hat{\theta}_N - \bar{\theta}_N )^2]  } \\
&= \sqrt{ E[ (\hat{\theta}_N - \theta )^2]  } \\
&= \mbox{Typical deviation of $\hat{\theta}_N$ from the truth} 
\end{aligned}
$$


"If I were to take repeated samples from the population and use this estimator for every sample, how big of an error do I make, on average?"  



An analogy
========

<img src="fig/gaines.jpeg" title="plot of chunk unnamed-chunk-6" alt="plot of chunk unnamed-chunk-6" width="800px" style="display: block; margin: auto;" />



An analogy
========

<a href="https://www.youtube.com/watch?v=6-4c6UZDjfc" target="_blank">This is why doctors and lawyers are buying "farmhouses."</a>



An analogy
========

<img src="fig/farmhouse_fever.png" title="plot of chunk unnamed-chunk-7" alt="plot of chunk unnamed-chunk-7" width="700px" style="display: block; margin: auto;" />


An analogy
========

<!-- [Chip and Joanna lifestyle item #1: the farmhouse sink](https://youtu.be/tdaq3vEJlj0?t=146) -->

<a href="https://youtu.be/tdaq3vEJlj0?t=146" target="_blank">Chip and Joanna lifestyle item #1: the farmhouse sink</a>



The farmhouse idyll...
========

<img src="fig/shaws.png" title="plot of chunk unnamed-chunk-8" alt="plot of chunk unnamed-chunk-8" width="900px" style="display: block; margin: auto;" />


And the fine print
========

<img src="fig/fineprint.png" title="plot of chunk unnamed-chunk-9" alt="plot of chunk unnamed-chunk-9" width="900px" style="display: block; margin: auto;" />


Manufacturing tolerances
========

- On average across many weeks of manufacturing, the fancy sink has width equal to 30".  
- But individual sinks vary from the average by about 0.5", due to manufacturing variability.  
- So I expect that my specific sink will be somewhere in the vicinity of 30" $\pm$ 0.5".  

Don't make any lifestyle choices that require greater precision!  



Standard errors
========

- On average across many samples, my estimator $\hat{\theta}_N$ is equal to the right answer ($\theta$).   
- But individual estimates vary from the average by about $\mbox{se}(\hat{\theta}_N)$, due to sampling variability.    
- So I expect that the right answer is somewhere in the vicinity of $\hat{\theta}_N \pm \mbox{se}(\hat{\theta}_N)$.  

Don't reach any scientific conclusions that require greater precision!  




Standard errors
========

But there's a problem here...
- Knowing the standard error requires knowing what happens across many separate samples.  
- But we've only got our one sample!  
- So how can we ever calculate the standard error?  


Standard errors
========

> Two roads diverged in a yellow wood  
> And sorry I could not travel both  
> And be one traveler, long I stood  
> And looked down one as far as I could  
> To where it bent in the undergrowth...  
>  
> --Robert Frost, _The Road Not Taken_, 1916  


Quantifying our uncertainty would seem to require knowing all the roads not taken---an impossible task.


The bootstrap
========

Problem: we can't take repeated samples of size $N$ from the population, to see how our estimate changes across samples.  

Seemingly hacky solution: take repeated samples of size $N$, with replacement, _from the sample itself_, and see how our estimate changes across samples.   This is something we can easily simulate on a computer.  

Basically, we pretend that our sample is the whole population and we charge ahead!  This is called _bootstrap resampling_, or just _bootstrapping._  



Sampling with replacement is key!
========

Bootstrapped sample 1

<img src="fig/boot1.png" title="plot of chunk unnamed-chunk-10" alt="plot of chunk unnamed-chunk-10" width="550px" style="display: block; margin: auto;" />

Sampling with replacement is key!
========

Bootstrapped sample 2

<img src="fig/boot2.png" title="plot of chunk unnamed-chunk-11" alt="plot of chunk unnamed-chunk-11" width="550px" style="display: block; margin: auto;" />

Sampling with replacement is key!
========

Bootstrapped sample 3

<img src="fig/boot3.png" title="plot of chunk unnamed-chunk-12" alt="plot of chunk unnamed-chunk-12" width="550px" style="display: block; margin: auto;" />


The true sampling distribution
========

<img src="fig/samplingdistribution_schematic.png" title="plot of chunk unnamed-chunk-13" alt="plot of chunk unnamed-chunk-13" width="625px" style="display: block; margin: auto;" />

The bootstrapped sampling distribution
========

<img src="fig/bootstrapping_schematic.png" title="plot of chunk unnamed-chunk-14" alt="plot of chunk unnamed-chunk-14" width="625px" style="display: block; margin: auto;" />


The bootstrapped sampling distribution
========

- Each bootstrapped sample has its own pattern of duplicates and omissions from the original sample.  
- These duplicates and omissions create variability in $\hat{\theta}$ from one bootstrapped sample to the next.  
- This variability mimics the _true_ sampling variability you'd expect to see across real repeated samples from the population.  


Bootstrapping: pseudo-code
========

- Start with your original sample $S = \{X_1, \ldots, X_N\}$ and original estimate $\hat{\theta}_N$.

- For $b=1,...,B$:  
  1. Take a bootstrapped sample $S^{(b)} = \{ X_1^{(b)}, \ldots, X_N^{(b)} \}$  
  2. Use $S^{(b)}$ to re-form the estimate $\hat{\theta}_N^{(b)}$.

- Result: a set of $B$ different estimates $\hat{\theta}_N^{(1)}, \hat{\theta}_N^{(b)}, \ldots, \hat{\theta}_N^{(B)}$ that approximate the sampling distribution of $\hat{\theta}_N$. 



Then what?
========

Calculate the _bootstrapped standard error_ as the standard deviation of the bootstrapped estimates:  

$$
\hat{se}(\hat{\theta}_N) = \mbox{std dev}\left( \hat{\theta}_N^{(1)}, \hat{\theta}_N^{(b)}, \ldots, \hat{\theta}_N^{(B)} \right)
$$

__Or__: form an interval estimate based on the the quantiles (e.g. the 2.5 and 97.5 percentiles) of the bootstrapped estimates.  This is called a _bootstrapped confidence inverval._   


Example
========
type: prompt

Let's dig in to some R code and data: `creatinine_bootstrap.R` and `creatinine.csv`  (both on class website).  

We'll bootstrap two estimators:  
- the sample mean  
- the OLS estimate of a slope  


<!-- The parametric bootstrap -->
<!-- =============   -->

<!-- Example: see `predimed_bootstrap.R` -->

<!-- In class:   -->
<!-- - Look at the data in `brca.csv`   -->
<!-- - Consider the conditional probability P(cancer | risk factors) _before_ screening (i.e. not using the `recall` variable).  Fit this using a logit model on the full data set.   -->
<!-- - Then address the question: are there some patients for whom  P(cancer | risk factors) is much more uncertain than others?   -->
