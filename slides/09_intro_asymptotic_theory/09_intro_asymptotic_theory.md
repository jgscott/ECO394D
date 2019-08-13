Introduction to asymptotic theory
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




Reference: Bertsekas Chapter 7


Outline
=====

- Some important inequalities  
- Convergence in probability  
-	Weak law of large numbers  
- Convergence in distribution  

***

- Central limit theorem and asymptotic normality  
- Normal-theory confidence intervals  
- Normal-theory hypothesis tests  


Some important inequalities
=====

We'll study three important inequalities in probability theory:
- Markov's inequality  
- Chebyshev's inequality  
- Hoeffding's inequality  

These are useful for bounding quantities that might otherwise be hard to compute.  They are also used in the study of _convergence of random variables._  


Markov's inequality
=====

Markov's inequality bounds the upper tail probability for a nonnegative random variable.  

__Theorem__: Let $X$ be a nonnegative random variable and suppose that $E(X) < \infty$.  Then for any $t > 0$,

$$
P(X \geq t) \leq \frac{E(X)}{t}
$$


Markov's inequality: proof
=====

Let's fix any positive number $t$ and consider the random variable $Y_t$ defined as

$$
Y_t = 
\begin{cases}
      0, &  \mbox{if } X < t \\
      t, &  \mbox{if }  X \geq t
    \end{cases}
$$

Since it is always the case that $Y_t \leq X$, then $E(Y_t) \leq E(X)$.  Therefore 

$$
E(X) \geq E(Y_t) = t \cdot P(Y_t = t) = t \cdot P(X_t \geq t)
$$



Chebyshev's inequality
=====

Chebyshev's inequality bounds the probability that a random variable will deviate very far from its mean.  

__Theorem__: Let $X$ be a random variable and suppose that $E(X) = \mu < \infty$ and $\mbox{var}(X) = \sigma^2 < \infty$.  Let $t > 0$.  Then

$$
P(|X - \mu| \geq t) \leq \frac{\sigma^2}{t^2}  
$$

In words: if the variance of a random variable is small, then the probability that it takes a value far from its mean is also small.  In particular, the probability that $X$ is more than $t$ units away from its mean falls at least as fast as $1/t^2$.  


Chebyshev's inequality: proof
=====

Clearly $P(|X-\mu| \geq t) = P(|X-\mu|^2 \geq t^2)$.

Now since $|X-\mu|^2$ is nonnegative random variable, we can use Markov's inequality to conclude that

$$
P(|X-\mu|^2 \geq t^2) \leq \frac{E(|X-\mu|^2)}{t^2} = \frac{\sigma^2}{t^2}  
$$



Corollary
=====

An alternative for Chebyshev's inequality is obtained by setting $t = k \sigma$.  Then

$$
P(|X - \mu| \geq k \sigma) \leq \frac{1}{k^2}  
$$



Chebyshev's inequality: example
=====

Suppose we randomly poll $N$ voters in order to estimate $p$, the true fraction of voters in the population who intend to vote for the incumbent.
- Suppose of our $N$ voters, $X$ support the incumbent.  
- Then $\hat{p} = X/N$ is a natural estimate: intuitively, we should expect that $\hat{p}$ is close to $p$.  
- But how likely is $\hat{p}$ to fall more than $\epsilon$ away from the true $p$?  E.g. if $\epsilon = 0.05$, how likely is a 5% polling error or more?  


Chebyshev's inequality: example
=====

Note that $X$ is a binomial random variable with $E(X) = Np$ and $\mbox{X} = Np(1-p)$. So:  
- $E(\hat{p}) = E(X/N) = Np/N = p$.  
- $\mathrm{var}(\hat{p}) = \mathrm{var}(X/N) = \mathrm{var}(X)/N^2 = p(1-p)/N$

Now using Chebyshev's inequality,

$$
\begin{aligned}
P(|\hat{p} - p| > \epsilon) \leq \frac{\mathrm{var}(\hat{p})}{\epsilon^2} &= \frac{p(1-p)}{N \epsilon^2} \\
&\leq  \frac{1}{4 N \epsilon^2}
\end{aligned}
$$

since $p(1-p) \leq 1/4$ for all $p$.  


Chebyshev's inequality: example
=====

So if we poll $N=1000$ people, then 

$$
P(|\hat{p} - p| > 0.05) \leq \frac{1}{4 \cdot 1000 \cdot 0.05^2} = 0.1
$$

Less than a 10% chance of a polling error of 5% or more.  So if I report the interval $\hat{p} \pm 0.05$, I can be at least 90% confidence that my interval contains the truth.  

_This is a very conservative bound_: the real probability is much smaller.  (Markov and Chebyshev usually give conservative bounds.)  


Hoeffding's inequality
=====

Suppose that $X_1, \ldots, X_N \sim$ Bernoulli(p) be independent random variables.  Define

$$
\bar{X}_N = \frac{1}{N} \cdot \sum_{i=1}^N X_i
$$

Then for any $\epsilon > 0$, 

$$
P(|\bar{X}_N - p| \geq \epsilon) \leq 2e^{-2N\epsilon^2}
$$

Hoeffding's inequality is similar to Markov's inequality, but it is sharper.  (This is actually a special case of a [more general version of the inequality](https://en.wikipedia.org/wiki/Hoeffding%27s_inequality#General_case_of_bounded_random_variables), which we don't really need.)  


Hoeffding's inequality
=====
type: prompt

Exercise: go back to our political poll example and again suppose $N=1000$.

Use Hoeffding's inequality to bound the probability that $P(|\hat{p} - p| \geq \epsilon)$ for $\epsilon = 0.05$ and $\epsilon = 0.01$ (that is, polling errors of 5% and 1%, respectively.)

Compare these to the bounds you get from the Chebyshev inequality.  



Convergence of random variables  
=====

We now turn to a topic called "large sample theory" or "limit theory" or "asymptotic theory."  
- The basic question is: what can we say about the limiting behavior about a sequence of random variables $X_1, X_2, X_3, \ldots$?  
- Since statistics is all about gathering data, we will be interested in what happens when we gather more and more data.  


Convergence of random variables  
=====

In calculus, we say that a sequence $x_N$ converges to a limit $a$ if, for every $\epsilon > 0$, then exists an $n_0$ such that $|x_N - a| \leq \epsilon$ for every $n \geq n_0$.

<img src="fig/1920px-Epsilonschlauch.png" title="plot of chunk unnamed-chunk-1" alt="plot of chunk unnamed-chunk-1" width="650px" style="display: block; margin: auto;" />


But in probability theory, convergence is more subtle.  


Convergence of random variables  
=====

For example, consider the trivial calculus sequence of $x_N = 0$ for all $n$.  Then clearly $x_N$ converges to 0.

But now consider the sequence of random variables $X_1, X_2, \ldots$, where each $X_N \sim N(0,1)$.  
- Since these all have the same distribution, we'd like to say that $X_N$ "converges to" a standard normal distribution $Z$.
- But how can we make sense of this idea, when $P(X_N = Z) = 0$ for all $N$?  


Convergence of random variables  
=====

Or consider the sequence of random variables $X_1, X_2, \ldots$, where each $X_N \sim N(0,1/n^2)$.  

- Intuitively, $X_N$ becomes very spiky and concentrated around 0.
- So we'd like to say that $X_N$ "converges to" 0.  
- Yet for every $n$, $P(X_N = 0) = 0$.  


Convergence of random variables  
=====

__We need to develop some appropriate tools for describing the convergence of random variables.__
- Convergence in probability: typically used to describe when a sequence of random variables "settles down" to a specific number.  Key result: law of large numbers.  
- Convergence in distribution: typically used to describe when a sequence of random variables never settles down to a specific number, but begins to look more and more like some specific _distribution._  Key result: central limit theorem.  




Convergence in probability  
=====

__Definition.__ Let $X_1, X_2, \ldots$ be a sequence of random variables.  We say that the sequence $X_N$ converges in probability to some random variable $X$ if, for every $\epsilon> 0$,

$$
P(|X_N - X| \geq \epsilon) \to 0
$$

as $n \to \infty$.  We write this as $X_N \overset{p}{\to} X$.  

Key point: we have turned a claim about random variables into a claim about real numbers (i.e. probabilities) so that we can describe those real numbers using ordinary calculus tools.  


Convergence in probability: example
=====

Consider the sequence $X_N \sim N(0, 1/n^2)$.  Show that $X_N \overset{P}{\to} 0$ (i.e. the trivial random variable that always takes the value 0).  

Proof: We need to show that $P(|X_N| \geq \epsilon) \to 0$ for all $\epsilon$.  From Chebyshev's inequality, we know that, since $E(X_N) = 0$ and $\mbox{var}(X_N) = 1/n^2$, 

$$
P(|X_N| \geq \epsilon) \leq \frac{\mbox{var}(X_N)}{\epsilon^2} = \frac{1}{n^2 \epsilon^2}
$$

And for fixed $\epsilon$, $1/(n^2 \epsilon^2) \to 0$ as $n \to \infty$.


The law of large numbers
=====

The law of large numbers is one of the most important results in all of probability theory.

It says says that the mean of a large sample is close to the mean of the distribution.

We now make this idea precise.  


The law of large numbers
=====

__Theorem.__  Suppose that $X_1, X_2, \ldots, X_N$ are independent, identically distributed random variables.  (Recall that we refer to this as an IID sample.)  Suppose each $X_i$ has mean $\mu = E(X_i) < \infty$ and variance $\sigma^2 = \mbox{var}(X_i) < \infty$.  

Let $\bar{X}_N = n^{-1} \sum_{i=1}^n X_i$ be the sample mean.  Then $\bar{X}_N  \overset{P}{\to} \mu$.  


The law of large numbers  
=====

As an example, consider flipping a biased coin where the probability of heads is $p$.
- Let $X_i$ denote the outcome of a single toss (0 or 1). Hence, $p = P(X_i = 1) = E(X_i)$.
- The fraction of heads after $N$ tosses is $\bar{X}_N = \hat{p}$.
- According to the LLN, as you toss the coin more and more times, $\bar{X}_N$ converges in 
probability to the true probability $p$.  

This doesn't mean that $\bar{X}_N = p$ for any $N$: you never get the answer _exactly_ right.   It does mean that for large $N$, the distribution of $\bar{X}_N$ is very tightly concentrated around $p$.  

The law of large numbers  
=====

Some comments:  
  1. This is the fundamental math result that connects the formal definition of an expected value with the idea of an expected value as a long-run average.  
  2. The requirement that $\sigma^2 < \infty$ isn't essential, but it does simplify the proof. 
  3. Technically I've shown you the Weak Law of Large Numbers.  
    - There is a stronger version of the theorem, called the Strong Law of Large Numbers.  
    - It replaces "convergence in probability" with "almost sure convergence," a different and stronger type of convergence. 
    - The differences aren't super important for our purposes.  The "Weak Law" is strong enough for us!  


The law of large numbers: proof
=====

With Chebyshev's inequality, it's a two liner!  First, note that

$$
\mbox{var}(\bar{X}_N) = \mbox{var} \left( \frac{1}{N} \sum_{i=1}^N X_i \right) = \frac{1}{N^2} \cdot N \cdot \mbox{var}(X_i) = \frac{\sigma^2}{N}
$$

Therefore,

$$
P(|\bar{X}_N - \mu| \geq \epsilon) \leq \frac{\sigma^2}{N \epsilon^2} \, ,
$$

which converges to 0 for fixed $\epsilon$ as $N \to \infty$.  __QED!__


The law of large numbers  
=====

<img src="fig/vegas.jpg" title="plot of chunk unnamed-chunk-2" alt="plot of chunk unnamed-chunk-2" width="850px" style="display: block; margin: auto;" />

A whole city built by the Law of Large Numbers...



The law of large numbers   
=====


<img src="fig/statefarm.png" title="plot of chunk unnamed-chunk-3" alt="plot of chunk unnamed-chunk-3" width="850px" style="display: block; margin: auto;" />

A whole industry, too!  



Convergence in distribution
=====

Our second type of convergence is _convergence in distribution._  Let $X_1, X_2, \ldots$ be a sequence of random variables, and suppose that $X_N$ has CDF $F_N$.  Let $X$ be some other random variable with CDF $F$.   We say that the sequence $X_N$ converges in distribution to $X$, written $X_n \rightsquigarrow X$, if

$$
\lim_{N \to \infty} F_N(t) = F(t)  
$$

at all $t$ where $F(t)$ is continuous.  

Intuitively: probability statements about $X_N$ can be approximated using probability statements about $X$, and the approximation gets arbitrarily good as $N$ diverges.  


Convergence in distribution
=====

Best math symbol ever!

$$
\huge
X_n \rightsquigarrow X
$$

OK, you can also write this as $X_N \stackrel{D}{\to} X$.  


Central limit theorem
=====

Suppose that $X_1, \ldots, X_n$ are IID random variables with mean $\mu$ and variance $\sigma^2$.  Let $\bar{X}_n$ be the sample mean:

$$
\bar{X}_n = \frac{1}{n} \sum_{i=1}^n X_i
$$

Now define the $z$-score of the sample mean as  

$$
\begin{aligned}
Z_n &= \frac{\bar{X}_n - \mu}{\mbox{se}(\bar{X}_n)} \\
&= \frac{\sqrt{n} (\bar{X}_n - \mu)}{\sigma}
\end{aligned}
$$

Note: the second line is from de Moivre's equation.  


Central limit theorem
=====

$$
Z_n = \frac{\sqrt{n} (\bar{X}_n - \mu)}{\sigma}
$$

The central limit theorem says that $Z_n \rightsquigarrow Z$, where $Z$ is a standard normal random variable.  That is,

$$
\lim_{n \to \infty} P(Z_n \leq z) = \Phi(z)
$$

In words: we can approximate statements about $Z_n$ using statements about a standard normal random variable.  Informally, we write this as $Z_n \approx N(0, 1)$.  


Central limit theorem
=====

Here's an equivalent way of expressing the central limit theorem.  Since

$$
Z_n = \frac{\sqrt{n} (\bar{X}_n - \mu)}{\sigma} \approx N(0, 1)
$$

then

$$
\bar{X}_n \approx N \left(\mu, \frac{\sigma}{\sqrt{n}} \right)
$$

Formally, this means that the CDF of $\bar{X}_n$ coverges to that of a normal distribution with mean $\mu$ and standard deviation $\sigma/\sqrt{n}$.  

Central limit theorem: comments
=====

1. The central limit theorem holds basically no matter what the distribution of the $X_i$'s are.  The only conditions are that the mean and variance are finite!  

2. Some terminology: the CLT implies that $\bar{X}_n$ is __asymptotically normal.__

3. The bigger the sample size, the closer the approximation gets.  By $n=30$, the normal approximation is pretty good, unless the distribution of $X_i$ is super heavy tailed and/or skewed.   


Central limit theorem: comments
=====

Let's see some examples in `CLT.R`.   


An example
=====
type: prompt

FedEx logistics:  
- A FedEx 737 cargo plane has a max cargo capacity of 11,422 pounds.
- From a long run of experience, FedEx knows that the average weight of a package is 6.1 pounds, with a standard deviation of 5.6 pounds (the distribution is skewed right: most packages are pretty light, a few packages are really heavy).  

Today's logistics problem: 1810 packages are in the system and scheduled to be shipped to Austin.  But these packages have yet to be weighed at the sorting facility.

Your turn: What is the probability that FedEx will need more than one flight to Austin to get all 1810 packages there?


An example
=====

Let $X_i$ be the weight of package $i = 1, \ldots, 1810$.  FedEx will need only one flight to Austin if 

$$
\sum_{i=1}^{1810} X_i \leq 11422
$$

or equivalently, if

$$
\frac{1}{1810} \sum_{i=1}^{1810} X_i \leq \frac{11422}{1810} = 6.31
$$

That is, average package weight $\bar{X}_n$ cannot exceed 6.31 pounds (recall $\mu = 6.1$ and $\sigma = 5.6$).  


An example
=====

So what is $P(\bar{X}_n \leq 6.31)$?

The sample size is $n=1810$: pretty large!  So use the central limit theorem: __make approximate statements about $\bar{X}$ using statements about the normal distribution.__


An example
=====

This gives us:

$$
\begin{aligned}
P(\bar{X}_n \leq 6.31) &= P\left( \frac{\sqrt{n} (\bar{X}_n - \mu) }{\sigma} \leq \frac{\sqrt{n} (6.31 - \mu)}{\sigma} \right) \\
&\approx P\left( Z \leq \frac{\sqrt{n} (6.31 - \mu)}{\sigma} \right) \quad \mbox{where $Z \sim N(0,1)$} \\
&\approx P\left( Z \leq \frac{\sqrt{1810} (6.31 - 6.1)}{5.6} \right) \\
&= P\left( Z \leq 1.595 \right) \\
&= \Phi(1.595) \approx 0.945
\end{aligned}
$$


Central limit theorem: plug-in version
=======

The central limit theorem assumes that we know $\sigma$, the true standard deviation of the data points, so that we can $z$-score using the true standard error, $\sigma/\sqrt{n}$.  

What if we don't know $\sigma$?  A natural thing to do is to plug-in the _sample_ standard deviation $\hat\sigma$ to give us an approximation:  

$$
\hat{se}(\bar{X}_n) = \frac{\hat\sigma}{\sqrt{n}}\quad \mbox{where} \quad
\hat{\sigma} = \sqrt{\frac{1}{n-1} \sum_{i=1}^m (X_i - \bar{X}_n)^2  }
$$

Remember: we call this the _plug-in estimate_ of the standard error.  



Central limit theorem: plug-in version
=======

It turns out that the central limit theorem still holds even if we use the plug-in estimate of the standard error.

That is, let

$$
T_n = \frac{\bar{X}_n - \mu}{\hat{se}(\bar{X}_n)} = \frac{\sqrt{n} (\bar{X}_n - \mu)}{\hat\sigma}
$$

Then $T_n \rightsquigarrow Z$, where $Z$ is a standard normal random variable.  (We call $T_n$ a $t$-statistic rather than a $z$-score.)  


As aside
=======

If you've taken a statistics class before, you may remember spending a lot of time on $t$ statistics and the $t$ distribution.


As aside
=======

Your experience might have involved a horrible, soul-crushing table that looked something like this:  

<img src="fig/tdistribution.png" title="plot of chunk unnamed-chunk-4" alt="plot of chunk unnamed-chunk-4" width="550px" style="display: block; margin: auto;" />


As aside
=======

The $Z$ statistic and $T$ statistic are really similar:  
- $Z$ statistic: divide an estimator by its true standard error, $\mbox{se}(\hat{\theta})$.  
- $T$ statistic: divide an estimator by __an estimate of__ its true standard error, $\hat{se}(\hat{\theta})$.  

In particular, both $Z$ and $T$ are asymptotically normal!  
- We can make approximate probability statements about either of them using the normal distribution.  
- The difference between $\mbox{se}(\hat{\theta})$ and $\hat{se}(\hat{\theta})$ is usually much smaller than the uncertainty you have about $\theta$ in the first place.  


So what gives?
=======

The whole point of that awful table was to correct for the small errors in the normal approximation that emerge when $n$ is modest (say, less than 30).     
- This was common in 1908, when the $t$ distribution was invented, and when most statisticians were concerned with analyzing data from small agricultural experiments.    
- This is pretty rare today.  Data sets are bigger than they were a century ago.  (And even for small samples, the differences are pretty small.)  



So what gives?
=======

The whole point of that awful table was to correct for the small errors in the normal approximation that emerge when $n$ is modest (say, less than 30).    
- This was common in 1908, when the $t$ distribution was invented, and when most statisticians were concerned with analyzing data from small agricultural experiments.    
- This is pretty rare today.  Data sets are bigger than they were a century ago.  (And even for small samples, the differences are pretty small.)  
- I have __never, in my entire career,__ encountered a real-life example where the difference between using the normal and $t$ distributions made a substantive scientific difference.  (I asked three other statisticians on my hallway and they all said the same thing.)


As aside
=======

So we'll basically ignore this horrible table and treat the $T$ statistic as if it were normal (which it is, asymptotically!)  

<img src="fig/tdistribution.png" title="plot of chunk unnamed-chunk-5" alt="plot of chunk unnamed-chunk-5" width="550px" style="display: block; margin: auto;" />


But...
=======

I cannot promise that everyone you encounter will be so gosh darn sensible.  
- journal editors...  
- peer reviewers...  
- econometrics teachers...
- PhD advisors...
- the FDA...

Some of these people may make you do calculations with the $t$ distribution, in which case you will have to learn/remind yourself about it.  


But...
=======

I cannot promise that everyone you encounter will be so gosh darn sensible.  
- journal editors...  
- peer reviewers...  
- econometrics teachers...
- PhD advisors...
- the FDA...

Some of these people may make you do calculations with the $t$ distribution, in which case you will have to learn/remind yourself about it.  __Sorry :-(__



CLT: summary  
=======

Suppose we're trying to estimate $\theta$ using an estimator $\hat{\theta}_n$. Let $\hat{se}(\hat{\theta}_n)$ be the (estimated) standard error of $\hat{\theta}_n$.  Define

$$
Z_n =  \frac{\hat{\theta}_n - \theta}{\hat{se}(\hat{\theta}_n)}
$$

If $Z_n \rightsquigarrow Z$ where $Z \sim N(0,1)$, we say that $\hat{\theta}$ is _asymptotically normal._  


CLT: summary  
=======

The central limit theorem can be used to prove that lots of common estimators are asymptotically normal:  
- sample means and proportions  
- differences of sample means and proportions  
- sample standard deviations and correlations  
- OLS estimators of the intercept and slope   
- basically anything that looks like an average of some sample quantity! 


Confidence intervals
=======

One consequence of this fact is that we can use the normal distribution to produce approximate confidence intervals for lots of common statistics problems.

How does that work?


Confidence intervals
=======

Suppose that we have some $\hat{\theta}_n$ that we know to be asymptotically normal.  Then we have the following approximation:  

$$
\frac{\hat{\theta}_n - \theta}{\hat{se}(\hat{\theta}_n)} \sim N(0,1)  
$$

Therefore,  
$$
\hat{\theta}_n - \theta \sim N \left( 0, \hat{se}(\hat{\theta}_n) \right)
$$

That is, our estimation error is (approximately) normally distributed.  


Confidence intervals
=======

So, for example, if we go out one standard error:

$$
P \left[ \hat{\theta}_n - \theta \in \left( -\hat{se},  \hat{se} \right) \right] \approx 0.68
$$

And if we go out two standard errors:

$$
P \left[ \hat{\theta}_n - \theta \in \left( -2 \hat{se}, 2 \hat{se} \right) \right] \approx 0.95
$$

Probalistic bounds on estimation error = confidence intervals!  


Confidence intervals
=======

In general, if $\hat{\theta}_n$ is asymptotically normal, and if we let $z_\alpha$ denote the $(1 - \alpha/2)$ quantile of the normal distribution, then the interval estimate

$$
I_n = [\hat{L}_N, \hat{U}_N] =  \hat{\theta}_n \pm z_\alpha \cdot \hat{se}(\hat{\theta}_n)
$$

is an approximate confidence interval at level $1-\alpha$.  That is, it covers the true value $\theta$ with probability approximately equal to $1 - \alpha$.  


Confidence intervals
=======

Remember the frequentist coverage principle?

$$
P_{\theta} \left( \theta \in [\hat{L}_N, \hat{U}_N] \right) \geq 1- \alpha \, ,
$$

Remember our three questions?  (What is fixed?  What is random?  What is the source of this randomness?)

It's the same statement again.  Here, as with bootstrapped confidence intervals, the probability claim is _approximately_ true, and the approximation gets better with larger $n$.  


Confidence intervals
=======

Let's see a couple of examples in `normalCI_examples.R`.    



Testing
=======

A really similar line of thinking allows us to construct hypothesis tests.  
Suppose we have:
- an unknown parameter $\theta$  
- an asymptotically normal test statistic $T_n$  
- a null hypothesis that $\theta = \theta_0$  


Testing
=======

Because of asymptotic normality, we know that if the null hypothesis is true (i.e. $\theta = \theta_0$), then

$$
T_n \sim N(\bar{T}_0, \mbox{se}_0 (T_n))
$$

where $\bar{T}_0 = E(T \mid \theta = \theta_0)$ and $\mbox{se}_0 (T_n)$ are the mean and standard error of $T_n$, assuming that $\theta = \theta_0$.   

We can then do any kind of test we want:
- Fisher: calculate a $p$-value$  
- Neyman-Pearson: specify an alternative hypothesis, choose a rejection region, calculate $\alpha$ and power  



Example
=======

Ikea produces 148.9 million of those tiny little Allen wrenches each year (5 wrenches per second, all day every day).  The wrenches should be 5.0 mm in diameter, on average.  If they're not, something has gone awry in the manufacturing process.  

The last 50 wrenches that were sampled off the assembly line have measured 5.03 mm in average diameter, with a standard deviation of 0.07 mm.

Should we stop making wrenches and figure out what's wrong?  Or is this just a chance statistical fluctuation?  


Example
=======

Let $X_i$ be the diameter of wrench $i$, and let $\mu = E(X_i).  The null hypothesis is that $\mu = 5.0$.  Let's compute a $p$-value under this null hypothesis.
- Our test statistic is $T = \bar{X}_n$.  This is asymptotically normal.  
- From de Moivre's equation, our standard error is $\hat{se} (\bar{X}_N) = 0.07/\sqrt{30} = 0.0128$.  


Example
=======

So under the null hypothesis, we can approximate the sampling distribution of $\bar{X}_n$ as

$$
\bar{X}_n \sim N(5.0, 0.0128)
$$

Under this null hypothesis, we have $P(\bar{X}_n \geq 5.03) = 0.0095$.  

Example
=======

Note: in this case we might want to calculate a two-sided $p$-value as:

$$
P(\bar{X}_n \leq 4.97) + P(\bar{X}_n \geq 5.03 ) = 0.019
$$

The thinking here is that deviations up and down are both equally important, and we don't have any prior ideas about which we expect.  


Example
=======

Note: compare this with the normal-theory confidence interval for $\mu$ in light of the data.

$$
\begin{align}
\mu &\in \bar{X}_n \pm 2 \cdot \hat{se}(\bar{X}_m)  \\
&=  5.03 \pm 2 \cdot 0.0128 \\
&= (5.0044, 5.0556)  
\end{align}
$$

Isn't that way more informative? 
$$
