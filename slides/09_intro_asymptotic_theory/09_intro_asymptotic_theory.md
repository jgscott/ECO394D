Asymptotic theory: a short introduction
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

- Central limit theorem 
- Normal-theory confidence intervals  
- Normal-theory hypothesis tests  


Some important ineqalities
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
\bar{X}_n = \frac{1}{nN} \sum_{i=1}^n X_i
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
Z_n = \frac{\bar{X}_n - \mu}{\hat{se}(\bar{X}_n)} = \frac{\sqrt{n} (\bar{X}_n - \mu)}{\hat\sigma}
$$

Then $Z_n \rightsquigarrow Z$, where $Z$ is a standard normal random variable.  

Example 2
=====

Suppose that we sample $N=49$ hospital patients and measure their systolic blood pressure. What is the probability that the sample average $\bar{X}_n$ is more than 5 units from the true population average $\mu$?  
