Introduction to probability
========================================================
date: James Scott (UT-Austin)
autosize: true
font-family: 'Gill Sans'
transition: none


<style>
.small-code pre code {
  font-size: 1em;
}
</style>




Probability basics
=========

If $A$ denotes some event, then $P(A)$ is the probability that this event occurs:    
- P(coin lands heads) = 0.5   
- P(rainy day in Ireland) = 0.85  
- P(cold day in Hell) = 0.0000001

And so on.  


Probability basics
=========

Some probabilities are estimated from experience over the long run:  
- P(newborn baby is a boy) = $\frac{106}{206}$  
- P(death due to car accident) = $\frac{11}{100,000}$  
- P(death due to any cause) = $1$  


Probability basics
=========

Some probabilities are estimated from direct experience over the long run:  
- P(newborn baby is a boy) = $\frac{106}{206}$  
- P(death due to car accident) = $\frac{11}{100,000}$  
- P(death due to any cause) = $1$  

Others are synthesized from our best judgments about unique events:  
- P(Apple stock goes up after next earnings call) = $0.54$  
- P(Djokovic wins next US Open) = $0.4$  (6 to 4 odds)  
- etc.  


Conditional probability  
=========

A conditional probability is the chance that one thing happens, given that some other thing has already happened.

A great example is a weather forecast: if you look outside this morning and see gathering clouds, you might assume that rain is likely and carry an umbrella.  

We express this judgment as a conditional probability: e.g. "the conditional probability of rain this afternoon, given clouds this morning, is 60%."  

Conditional probability  
=========

In stats we write this a bit more compactly:
- P(rain this afternoon | clouds this morning) = 0.6
- That vertical bar means “given” or “conditional upon.”
- The thing on the left of the bar is the event we're interested in.  
- The thing on the right of the bar is our knowledge, also called the "conditioning event" or "conditioning variable": what we believe or assume to be true.

$P(A \mid B)$: "the probability of A, given that B occurs." 


Conditional probability  
=========

Conditional probabilities are how we express judgments in a way that reflects our partial knowledge.
- You just gave _Sherlock_ a high rating. What’s the conditional probability that you will like  _The Imitation Game_ or _Tinker Tailor Soldier Spy_?  
- You just bought organic dog food on Amazon. What’s the conditional probability that you will also buy a GPS-enabled dog collar?  
- You follow Lionel Messi (@leomessi) on Instagram. What’s the conditional probability that you will respond to a suggestion to follow Cristiano Ronaldo (@cristiano) or Gareth Bale (@garethbale11)?    

The digital economy runs on $P(A \mid B)$!  


Conditional probability  
=========

A really important fact is that conditional probabilities are _not symmetric_:

$$
P(A \mid B) \neq P(B \mid A)  
$$

As a quick counter-example, let the events A and B be as follows:  
- A: "you can dribble a basketball"  
- B: "you play in the NBA"  



Conditional probability  
=========

- A: "you can dribble a basketball"  
- B: "you play in the NBA"  

<img src="fig/kawhi_leonard.jpg" title="plot of chunk unnamed-chunk-1" alt="plot of chunk unnamed-chunk-1" width="500px" style="display: block; margin: auto;" />

Clearly $P(A \mid B) = 1$: every NBA player can dribble a basketball.    




Conditional probability  
=========

- A: "you can dribble a basketball"  
- B: "you play in the NBA"  

<img src="fig/grandpa_basketball.jpg" title="plot of chunk unnamed-chunk-2" alt="plot of chunk unnamed-chunk-2" width="500px" style="display: block; margin: auto;" />


But $P(B \mid A)$ is nearly zero! 


Uncertain outcomes and probability models  
=========

An uncertain outcome (more formally called a "random process") has two key properties:  
  1. The set of possible outcomes, called the _sample space_, is known beforehand.   
  2. The particular outcome that occurs is _not_ known beforehand.  

We denote the sample space as $\Omega$, and some particular element of the sample space as $\omega \in \Omega$.  


Uncertain outcomes and probability models  
=========

Examples: 
  1. NBA finals, Golden State vs. Toronto:
$$
\Omega = \{ \mbox{4-0, 4-1, 4-2, 4-3, 3-4, 2-4, 1-4, 0-4} \}
$$  
  2. Temperature in degrees F in Austin on a random day:  
$$
\Omega = [10, 115]
$$
  3. Number of no-shows on an AA flight from Austin to DFW:  
$$
\Omega = \{0, 1, 2, \ldots, N_{\mathrm{seats}} \}
$$  
  4. Poker hand
$$
\Omega = \mbox{all possible five-card deals from a 52-card deck}
$$

Uncertain outcomes and probability models  
=========

An _event_ is a _subset of the sample space_, i.e. $A \subset \Omega$.  For example:  
  1.   NBA finals, Golden State vs. Toronto.  Let $A$ be the event "Toronto wins".  Then 
  $$
  A = \{ \mbox{3-4, 2-4, 1-4, 0-4} \} \subset \Omega  
  $$
  2.   Austin weather.  Let $A$ be the event "cooler than 90 degrees".  Then 
  $$
  A = [10, 90) \subset [10, 115]  
  $$  
  3. Flight no-shows.  Let $A$ be "more than 5 no shows":
$$
A = \{6, 7, 8, \ldots, N_{\mathrm{seats}} \}
$$   
 


Some set-notation reminders
=========

We need some basic set-theory concepts to make sense of probability, since the sample space $\Omega$ is a set, and since "events" are subsets of $\Omega$.  
- Union: $A \cup B = \{\omega: \omega \in A \mbox{ or } \omega \in B \}$  
- Intersection: $A \cap B = \{\omega: \omega \in A \mbox{ and } \omega \in B \}$
- Complement: $A^C = \tilde{A} = \{\omega: \omega \notin A  \}$  
- Difference/relative complement: $A \setminus B = \{\omega: \omega \in A, \omega \notin B  \}$  
- Disjointness: $A$ and $B$ are disjoint if $A \cap B = \emptyset$ (the empty set).  


Kolmogorov's axioms (baby version)  
====================================
right: 70%

<img src="fig/kolmogorov.jpg" title="plot of chunk unnamed-chunk-3" alt="plot of chunk unnamed-chunk-3" width="300px" style="display: block; margin: auto;" />
"Obey my rules, filthy capitalists."

***

Consider an uncertain outcome with sample space $\Omega$.  "Probability" $P(\cdot)$ is a set function that maps $\Omega$ to the real numbers, such that:  
  1. Non-negativity: For any event $A \subset \Omega$, $P(A) \geq 0$.  
  2. Normalization: $P(\Omega) = 1$ and $P(\emptyset) = 0$.  
  3. Finite additivity: If $A$ and $B$ are disjoint, then $P(A \cup B) = P(A) + P(B)$.  
  
Not that intuitive!  Notice no mention of frequencies...


Some optional technical points 
=========

Point 1: the "non-baby" version of Kolmogorov's third axiom is actually something called _countable additivity_ (versus "finite additivity".)  
- Consider a countable sequence of events $A_1, A_2, A_3, \ldots$, each $A_i \subset \Omega$.  
- Suppose the events are all disjoint: $A_i \cap A_j = \emptyset$ for $i \neq j$.  
- Countable additivity says that
$$
P \left( \bigcup_{i=1}^{\infty} A_i  \right) = \sum_{i=1}^\infty P(A_i)  
$$
where
$$
\bigcup_{i=1}^{\infty} A_i = A_1 \cup A_2 \cup A_3 \cup \cdots
$$


Some optional technical points 
=========

Point 2: our definition of probability assumes that $P(A)$ is well defined for any $A \subset \Omega$.  If $\Omega$ is a finite or countable set (e.g. the integers), then $P(A)$ is always well defined.  

But if $\Omega$ is uncountably infinite (e.g. the real numbers), then $P(A)$ is not necessary well defined for all possible subsets $A \subset \Omega$.  
- Wild but true!  It is possible to define bizarre sets for which there is _no meaningful notion of that set's size_.   (If you care: Google "non-measurable set" and "Banach-Tarski paradox").  
- But it's hard to construct such crazy sets.  Every "normal" set you might care about (intervals, unions of intervals) has a well-defined size.  Technically speaking, these are called the _Borel sets._  


Quick summary of terms
========

- Uncertain outcome/"random process": we know the possibilities ahead of time, just not the specific one that occurs.  
- Sample space: the set of possible outcomes.  
- Event: a subset of the sample space.  
- Probability: a function that maps events to real numbers and that obeys Kolmogorov's axioms.  

OK, so how do we actually _calculate_ probabilities?


The discrete uniform distribution and the counting rule    
=========

Suppose our sample space $\Omega$ is a finite set consisting of $N$ elements $\omega_1, \ldots, \omega_N$.

Suppose further that $P(\omega_i) = 1/N$: each outcome is equally likely, i.e. we have a _discrete uniform distribution_ over possible outcomes.

Then for each set $A \subset \Omega$, 
$$
P(A) = \frac{|A|}{N} = \frac{\mbox{Number of elements in $A$}}{\mbox{Number of elements in $\Omega$}}
$$

That is, to compute $P(A)$, we just need to count how many elements are in $A$.  


The counting rule: example   
=========

Someone deals you a five-card poker hand from a 52-card deck.  What is the probability of a flush (all five cards the same suit)?  

<img src="fig/flush.png" title="plot of chunk unnamed-chunk-4" alt="plot of chunk unnamed-chunk-4" width="600px" style="display: block; margin: auto;" />

Note: this is a very historically accurate illustration of probability, given its origins among bored French aristocrats!


The counting rule: example   
=========

Let's use the counting rule.  

- Our sample space has $N = \binom{52}{5} =$ 2,598,960 possible poker hands, each one equally likely.  
- How many possible flushes are there?  Let's start with hearts:  
  - There are 13 hearts.  
  - To make a flush with hearts, you need any 5 of these 13 cards.  
  - Thus there are $\binom{13}{5}$ = 1287 possible flushes with hearts.  
- The same argument works for all four suits, so there are 4 $\times$ 1287 = 5,148 flushes.  Thus

$$
P(\mbox{flush}) = \frac{|A|}{|\Omega|} = \frac{5148}{2598960} = 0.00198079
$$


Probability calculus  
=========

The "probability calculus" provides a set of rules for calculating probabilities.  _These aren't axioms_: they can be derived from Kolmogorov's axioms.  

  1. $P(A^C) = 1 - P(A)$  
  (Why?  Because $A \cup A^C = \Omega$, and $P(\Omega) = 1$.)   
  
  2. If $A \subset B$, then $P(A) \leq P(B)$.  
  (Why?  Write $B$ as $B = A \cup (B \setminus A)$ and use finite additivity.  )

  3. $P(B \setminus A) = P(B) - P(A \cap B)$.  
  (Why?  __Your turn!__)  
  
  4. Addition rule: $P(A \cup B) = P(A) + P(B) - P(A \cap B)$.  
  (Why?  __Your turn!__)  



Quick example
=========

Again, someone deals you a five-card poker hand.  What is the probability of either a straight (five cards in a row, e.g. 3-4-5-6-7) or a flush (all cards the same suit)?

Note: these aren't mutually exclusive, since you might draw a hand that is both a straight AND a flush (e.g. 5-6-7-8-9 of clubs).  

<img src="fig/straight_flush.png" title="plot of chunk unnamed-chunk-5" alt="plot of chunk unnamed-chunk-5" width="600px" style="display: block; margin: auto;" />


Quick example
=========

If all 2,598,960 poker hands are equally likely, then using the counting rule:
- P(flush) = 0.00198079 (5,148 possible flushes)
- P(straight) = 0.00392465 (10,200 possible straights.) 
- P(straight and flush) = 0.0000153908 (40 possible straight flushes)  

So by the addition rule:

$$
\begin{aligned}
P(\mbox{straight or flush}) &= P(\mbox{straight}) + P(\mbox{flush}) - P(\mbox{straight AND flush}) \\
&= 0.00392465 + 0.00198079 - 0.0000153908 \\
&= 0.005890049
\end{aligned}  
$$



The multiplication rule
=========

We've met Kolmogorov's three axioms, together with several rules we can derive from these axioms.

There's one final axiom for conditional probability, often called the _multiplication rule_.  Let $P(A, B) = P(A \cap B)$ be the _joint probability_ that both $A$ and $B$ happen.  Then:

\begin{equation}
\label{eqn:conditional_probability}
P(A \mid B) = \frac{P(A, B)}{P(B)} \, .
\end{equation}

Or equivalently:

$$
P(A, B) = P(A \mid B) \cdot P(B) \, .
$$

This is an axiom: it cannot be proven from Kolmogorov's rules.  


Conditional probability
=========

Let's see why this axiom makes sense.  (Figure courtesy David Speigelhalter and Jenny Gage.)


<img src="fig/breast_cancer_screening_tree.png" title="plot of chunk unnamed-chunk-6" alt="plot of chunk unnamed-chunk-6" width="650px" style="display: block; margin: auto;" />



Conditional probability
=========

Suppose a woman goes for regular screening (left branch).  What is P(survive | cancer)?  
- Among screened women, 15 will get cancer, on average.  
- Of those 15, 12 are treated and survive, on average.
- Thus inuitively, we should have P(survive | cancer) = 12/15 = 0.8

Let's calculate this using the rule for conditional probabilities:
 
$$
\begin{aligned}
P(S | C) = \frac{P(S, C)}{P(C)} &= \frac{12/200}{15/200} \\
&= \frac{12}{15} \\
\end{aligned}
$$



Conditional probabilities from data
=========

Consider the story of Abraham Wald and the "missing"" WWII bombers.  

<img src="fig/b17.jpg" title="plot of chunk unnamed-chunk-7" alt="plot of chunk unnamed-chunk-7" width="850px" style="display: block; margin: auto;" />


Conditional probabilities from data
=========

- B-17 bombers returning from their missions in WWII often had damage: on the fuselage, across the wings, on the engine block, and sometimes even near the cockpit.  
- At some point, a clever data-minded person had the idea of analyzing the distribution of these hits over the surface of the returning planes.  
- The thinking was that, if you could find patterns in where the B-17s were taking enemy fire, you could figure out where to reinforce them with extra armor, to improve survivability.  
- You couldn’t reinforce them everywhere, or they would be too heavy to fly.  

Conditional probabilities from data
=========

Suppose we saw data on returning bombers that looked like this:  

<img src="fig/wald_table1.png" title="plot of chunk unnamed-chunk-8" alt="plot of chunk unnamed-chunk-8" width="550px" style="display: block; margin: auto;" />

Naive answer: of 648 returning planes, 434 (68%) on the fuselage.  

$$
P(\mbox{hit on wings or fuselage} \mid \mbox{returns home}) = 0.68
$$

So bulk up the fuselage!  


Conditional probabilities from data
=========

But that's the right answer to the wrong question!  We need the inverse probability

$$
P(\mbox{returns home} \mid \mbox{hit on wings or fuselage})
$$

Wald used some fancy math to reconstruct the _joint frequency distribution_ over damage type and mission result:  

<img src="fig/wald_table2.png" title="plot of chunk unnamed-chunk-9" alt="plot of chunk unnamed-chunk-9" width="650px" style="display: block; margin: auto;" />

Conditional probabilities from data
=========

This gives us:

$$
P(\mbox{returns safely} \mid \mbox{hit on wings or fuselage}) = \frac{434}{434 + 33} \approx 0.93 \, .
$$

Pretty high.  

Conditional probabilities from data
=========

On the other hand, of the 110 planes that had taken damage to the engine, only 53 only returned safely.  Therefore

$$
P(\mbox{returns safely} \mid \mbox{hit on engine}) = \frac{53}{53 + 57} \approx 0.48 \, .
$$

Similarly,

$$
P(\mbox{returns safely} \mid \mbox{hit on cockpit area}) = \frac{65}{65 + 46} \approx 0.59 \, .
$$

Moral of the story: make sure you're focusing on the right conditional probability.  And remember that $P(A \mid B) \neq P(B \mid A)$!  


Conditional probabilities from data
=========

The same math that Abraham Wald used to analyze bullet holes on B-17s also underpins the modern digital economy of films, television, music, and social media.

Netflix, Hulu, and other video-streaming services all use this same math to examine what shows their users are watching, and apply the results of their number-crunching to recommend new shows.

Many companies do the same:  
- Amazon for products  
- New York Times for new stories  
- Google for web pages  
- etc


Conditional probabilities from data
=========


Suppose that you're designing the movie-recommendation algorithm for Netflix, and you have access to the entire Netflix database, showing which customers have liked which films.

Your goal is to leverage this vast data resource to make automated, personalized movie recommendations. 

You decide to start with an easy case: assessing how probable it is that a user will like the film _Saving Private Ryan_ (event $A$), given that the same user has liked the HBO series _Band of Brothers_  (event $B$).  

This is almost certainly a good bet: both are epic war dramas about the Normandy invasion and its aftermath.  Therefore, you might think: job done!  Recommend away.

Conditional probabilities from data
=========

But keep in mind that you want to be able to do this kind of thing automatically.  

Key insight: _frame the problem in terms of conditional probability._  Suppose we learn that Linda liked film $B$, but hasn't yet seen film $A$.  
- What if $P(\mbox{likes A} \mid \mbox{likes B}) = 0.8$?  Then $A$ is a good recommendation!  Based on Linda liking $B$, we know there's an 80% chance she'll like A.  
- But if $P(\mbox{likes A} \mid \mbox{likes B}) = 0.02$, she probability won't like A, given our knowledge of how she reacted to B.  

_Conditional probabilities hold the key to understanding individualized preferences._  So how can we learn $P(\mbox{likes A} \mid \mbox{likes B})$?   


Conditional probabilities from data
=========

Solution: go to the data!  Suppose your database on 5 million subscribers like Linda reveals the following pattern:  

<img src="fig/netflix_table1.png" title="plot of chunk unnamed-chunk-10" alt="plot of chunk unnamed-chunk-10" width="550px" style="display: block; margin: auto;" />

Then 

$$
\begin{aligned}
P(\mbox{liked Saving Private Ryan} \mid \mbox{liked Band of Brothers}) &= \frac{2.8 \mbox{ million}}{3.5 \mbox{ million}} \\
&= 0.8 \, .
\end{aligned}
$$

Result: a good recommendation with no human in the loop.  


The rule of total probability
=========

Consider the following data on complication rates at a maternity hospital in Cambridge, England:

| | Easier deliveries | Harder deliveries | Overall |
|----------------|-------------|-------------|-------------|
| Senior doctors | 0.052 | 0.127  | 0.076 |
| Junior doctors | 0.067  | 0.155  | 0.072 |

So would you rather have a junior doctor or a senior doctor?  


The rule of total probability
=========

Consider the following data on complication rates at an obstetrics ward in England:

| | Easier deliveries | Harder deliveries | Overall |
|----------------|-------------|-------------|-------------|
| Senior doctors | 0.052 | 0.127  | 0.076 |
| Junior doctors | 0.067  | 0.155  | 0.072 |

 So would you rather have a junior doctor or a senior doctor?  

_Simpson's paradox_.  Senior doctors have:  
- lower complication rates for easy cases.  
- lower complication rates for hard cases.  
- higher complication rates overall! (7.6% versus 7.2%.)  __Why?__  



The rule of total probability
=========

Let's see the table with number of deliveries performed (in parentheses):  

| | Easier deliveries | Harder deliveries | Overall |
|----------------|-------------|-------------|-------------|
| Senior doctors | 0.052 (213) | 0.127 (102) | 0.076 (315) |
| Junior doctors | 0.067 (3169) | 0.155 (206) | 0.072 (3375) |


The rule of total probability
=========

Let's see the table with number of deliveries performed (in parentheses):  

| | Easier deliveries | Harder deliveries | Overall |
|----------------|-------------|-------------|-------------|
| Senior doctors | 0.052 (213) | 0.127 (102) | 0.076 (315) |
| Junior doctors | 0.067 (3169) | 0.155 (206) | 0.072 (3375) |


Now we see what's going on:  
- Most of the deliveries performed by junior doctors are easier cases, where complication rates are lower overall.  
- The senior doctors, meanwhile, work a much higher fraction of the harder cases.  


The rule of total probability
=========

It turns out the math of Simpson's paradox can be understood a lot more deeply in terms of something called the _rule of total probability_, or the mixture rule.

This rule sounds fancy, but is actually quite simple.

It says: __the probability of any event is the sum of the probabilities for all the different ways in which the event can happen.__   

It's really just Kolmogorov's third rule in disguise!  


The rule of total probability
=========

Let's see this rule in action for the hospital data.  

There are two types of deliveries: easy and hard.  So:  

$$
P(\mbox{complication}) = P(\mbox{easy and complication}) + P(\mbox{hard and complication}) \, .
$$ 

Now use the rule for conditional probabilities to each joint probability on the right-hand side:  

$$
\begin{aligned}
P(\mbox{complication}) &= P(\mbox{easy}) \cdot P(\mbox{complication} \mid \mbox{easy}) \\
& + P(\mbox{hard}) \cdot P(\mbox{complication} \mid \mbox{hard}) \, .
\end{aligned}  
$$ 

The rule of total probability says that overall probability is a weighted average---a __mixture__---of the two conditional probabilities


The rule of total probability
=========

For senior doctors we get

$$
P(\mbox{complication}) = \frac{213}{315} \cdot 0.052 + \frac{102}{315} \cdot 0.127 = 0.076 \, .
$$ 

And for junior doctors, we get

$$
P(\mbox{complication}) = \frac{3169}{3375} \cdot 0.067 + \frac{206}{3375} \cdot 0.155 = 0.072 \, .
$$ 

This is a lower _marginal_ or _overall_ probabiity of a complication, even though junior doctors have higher _conditional_ probabilities of a complication in all scenarios.   

Synonyms: overall probability = total probability = marginal probability  


The rule of total probability
=========

You can see why these are called _marginal_ probabilities if you go back to the Abraham Wald example:  


| | Returned | Shot down | 
|------|-------|--------|
| Engine | 53 | 57 |
| Cockpit area | 65 | 46 |
| Fuel system | 96 | 16 |
| Wings, fuselage, etc.| 434 | 33 |



The rule of total probability
=========

You can see why these are called _marginal_ probabilities if you go back to the Abraham Wald example: 

| | Returned | Shot down | 
|------|-------|--------|
|Engine | 0.066 |  0.071 | 
|Cockpit area | 0.081 | 0.058  |
|Fuel system | 0.120 | 0.020 |  
|Wings, fuselage, etc.| 0.542 | 0.042  | 

Divide by the total number (800) to turn these into joint probabilities...  



The rule of total probability
=========

You can see why these are called _marginal_ probabilities if you go back to the Abraham Wald example: 

| | Returned | Shot down |  __Marginal__ |
|------|-------|--------|----|
|Engine | 0.066 |  0.071 | 0.137 |
|Cockpit area | 0.081 | 0.058  | 0.139  |
|Fuel system | 0.120 | 0.020 |  0.140  |
|Wings, fuselage, etc.| 0.542 | 0.042  | 0.584  |
|__Marginal__ | 0.809 | 0.191 |  1  |

Now calculate the overall probabilities for each individual type of event, and put those in the margins of the table.  


The rule of total probability
=========

Here's the formal statement of the rule.  Let $\Omega$ be any sample space, and let $B_1, B_2, \ldots, B_N$ be a _partition_ of $\Omega$---that is, a set of events such that:  

$$
P(B_i, B_j) = 0 \mbox{ for any $i \neq j$,} \quad \mbox{and} \quad \sum_{i=1}^N P(B_i) = 1 \, .
$$

Now consider any event $A$.  Then 

$$
P(A) = \sum_{i=1}^N P(A, B_i) = \sum_{i=1}^N P(B_i) \cdot P(A \mid B_i) \, .
$$




Example: drug surveys
=========


Virginia Delaney-Black and her colleagues at Wayne State University gave an anonymous survey to teenagers in Detroit:
- 432 teens were asked whether they had used various drugs.  
- Of these 432 teens, 211 agreed to give a hair sample.  
- Therefore, for these 211 respondents, the researchers could compare people's answers with an actual drug test.  
- Hair samples were analyzed in the aggregate: no hair sample could be traced back to an individual survey or teen.  


Citation: V. Delaney--Black et. al.  "Just Say I Don't: Lack of Concordance Between Teen Report and Biological Measures of Drug Use." _Pediatrics_ 165:5, pp. 887-93 (2010)  


Example: drug surveys
=========

The two sets of results were strikingly different.  
- Of the 211 teens who provided a hair sample, only a tiny fraction of them (0.7%) admitted to having used cocaine.  
- Bu when the hair samples were analyzed in the lab, 69 of them (33.7%) came back positive for cocaine use.   


Example: drug surveys
=========

The two sets of results were strikingly different.  
- Of the 211 teens who provided a hair sample, only a tiny fraction of them (0.7%) admitted to having used cocaine.  
- Bu when the hair samples were analyzed in the lab, 69 of them (33.7\%) came back positive for cocaine use.   

And the parents lied, too:  
- The researchers also asked the parents whether they had used cocaine themselves.  
- Only 6.1% said yes.  
- But 28.3% of the parents' hair samples came back positive.  


Example: drug surveys
=========

Remember:
- these people were guaranteed anonymity
- they wouldn't be arrested or fired for saying admitting drug use
- they willingly agreed to provide a hair sample that could detect drug use.  

Yet a big fraction lied about their drug use anyway.  

Example: drug surveys
=========

Drug surveys are really important:  
- Drug abuse, whether it's cocaine in Detroit or bathtub speed in Nebraska, is a huge social problem. 
- The problem fills our jails, drains public finances, and perpetuates a trans-generational cycle of poverty.  
- Getting good data on this problem is important! Doctors, schools, and governments all rely on self-reported measures of drug use to guide their thinking on this issue. 

Delaney-Black's work seems to ask: __can we trust any of it?__
 
 
It's not just drug surveys
=========
incremental:true 

Here are some other things that, according to research _on_ surveys, people lie about _in_ surveys.  
- Churchgoers overstate the amount of money they give when the hat gets passed around during the service.  
- Gang members embellish the number of violent encounters they have been in.  
- Men exaggerate their salary.  
- Ravers will "confess" to having gotten high on drugs that do not actually exist.   

Upshot: people lie in predictable ways for predictable reasons.  This opens the door for survey designers to use a bit of probability, and a bit of psychology, to get at the truth.  


Example: a better drug survey
=========

Suppose that you want to learn about the prevalence of drug use among college students.  Here's a cute trick that uses probability theory to mitigate someone's incentive to lie.

Suppose that, instead of asking people point-blank, you tell them:    
- Flip a coin.  Look at the result, but keep it private.
- If the coin comes up heads, please use the space provided to write an answer to question Q1: "Is the last digit of your tax ID number (e.g. SSN) odd?"  
- If the coin comes up tails, please use the space provided to write an answer to question Q2: "Have you smoked marijuana in the last year?"  


Example: a better drug survey
=========
type: prompt

Key fact here: only the respondent knows which question he or she is answering.  
- This gives people plausible deniability.  
- Someone answering "yes"" might have easily flipped heads and answered the first, innocuous question rather than the second, embarrassing one.  
- The survey designer would never know the difference.  

This reduces the incentive to lie.

__Let's run the survey!__  Flip a coin, keep the result private, and then answer the question in public :-)  


Analyzing the results  
=========

Notation:  
- Let $Y$ be the event "a randomly chosen subject answers yes."  
- Let $Q_1$ be the event "the subject answered question 1, about their tax ID number."
- Let $Q_2$ be the event "the subject answered question 2, about marijuana use."  

By the rule of total probability:  

$$
\begin{aligned}
P(Y) &= P(Y, Q_1) + P(Y, Q_2)  \\
&= P(Q_1) \cdot P(Y \mid Q_1) + P(Q_2) \cdot P(Y \mid Q_2)
\end{aligned}
$$


Analyzing the results  
=========

$$
P(Y) = P(Q_1) \cdot P(Y \mid Q_1) + P(Q_2) \cdot P(Y \mid Q_2)
$$

$P(Y)$ is a weighted average of two conditional probabilities:  
- $P(Y \mid Q_1)$, the probability that a subject answers "yes" when answering the tax-ID-number question.     
- $P(Y \mid Q_2)$,  the probability that a subject answers "yes" when answering the marijuana question.  

This equation has five probabilities in it.  
- __Which ones do we know from our survey?__  
- __Which one do we care about?__  


Analyzing the results  
=========
type: prompt

Let's solve for $P(Y \mid Q_2)$:  

$$
P(Y) = P(Q_1) \cdot P(Y \mid Q_1) + P(Q_2) \cdot \mathbf{P(Y \mid Q_2) }
$$

So 

$$
P(Y \mid Q_2) = \frac{P(Y) - P(Q_1) \cdot P(Y \mid Q_1)}{ P(Q_2) }
$$

__Let's plug in our numbers on the right-hand side and get an answer!__  Feel free to chat with your neighbors.  


Independence
============

Two events $A$ and $B$ are said to be _independent_ if

$$
P(A \mid B) = P(A \mid \mbox{not } B) = P(A)   
$$

In words: $A$ and $B$ convey no information about each other:  
- P(flip heads second time | flip heads first time) = P(flip heads second time)  
- P(stock market up | bird poops on your car) = P(stock market up)
- P(God exists | Longhorns win title) = P(God exists)  

So if $A$ and $B$ are independent, then $P(A, B) = P(A) \cdot P(B)$.  


Independence
============
left: 40%

<img src="fig/joe_dimaggio.jpg" title="plot of chunk unnamed-chunk-11" alt="plot of chunk unnamed-chunk-11" width="325px" style="display: block; margin: auto;" />


***

Independence is often something we _choose to assume_ for the purpose of making calculations easier.  For example:  
- Joe DiMaggio got a hit in about 80% of the baseball games he played in.  
- Suppose that successive games are independent: if JD gets a hit today, it doesn't change the probability he's going to get a hit tomorrow.  
- Then P(hit in game 1, hit in game 2) = $0.8 \cdot 0.8 = 0.64$.  


Independence
============

This works for more than two events.  For example, Joe DiMaggio had a 56-game hitting streak in the 1941 baseball season.  This was pretty unlikely!  

$$
\begin{aligned}
&\phantom{=} P(\mbox{hit game 1, hit game 2, hit game 3, $\ldots$, hit game 56}) \\
&= P(\mbox{hit game 1}) \cdot P(\mbox{hit game 2}) \cdot P(\mbox{hit game 3}) \cdots P(\mbox{hit game 56}) \\
&= 0.8 \cdot 0.8 \cdot 0.8 \cdots 0.8 \\
&= 0.8^{56} \\
&\approx \frac{1}{250,000}
\end{aligned}
$$

Independence
============

Let's compare this with the corresponding probability for Pete Rose, a player who got a hit in 76% of his games.  He's only _slightly_ less skillful than DiMaggio!  But:  

$$
\begin{aligned}
&\phantom{=} P(\mbox{hit game 1, hit game 2, hit game 3, $\ldots$, hit game 56}) \\
&= 0.76^{56} \\
&\approx \frac{1}{\mbox{5 million}}
\end{aligned}
$$

Small difference in one game, but a big difference over the long run.  

Independence
============

What about an average MLB player who gets a hit in 68% of his games:  

$$
\begin{aligned}
&\phantom{=} P(\mbox{hit game 1, hit game 2, hit game 3, $\ldots$, hit game 56}) \\
&= 0.68^{56} \\
&\approx \frac{1}{\mbox{2.5 billion}}
\end{aligned}
$$

Never gonna happen!  

Independence
============

Summary:  
- Joe DiMaggio: 80% one-game hit probability, 1 in 250,000 streak probability  
- Pete Rose: 76% one-game hit probability,  1 in 5 million streak probability  
- Average player: 68% one-game hit probability, 1 in 2.5 billion streak probability  

A small difference in probabilities becomes an enormous gulf over the long term.  

Lesson: probability compounds __multiplicatively__, like the interest on your credit cards.  


What about everday "hitting streaks"...?  
============

- A mutual-fund manager outperforms the stock market for 15 years straight.
- A World-War II airman completes 25 combat missions without getting shot down, and gets to go home.
- A retired person successfully takes a shower for 1000 days in a row without slipping.   
- A child goes 180 school days, or 1 year, without catching a cold from other kids at school.  (Good luck!)  


An example: surviving falls  
============

<img src="fig/ford_10.jpg" title="plot of chunk unnamed-chunk-12" alt="plot of chunk unnamed-chunk-12" width="750px" style="display: block; margin: auto;" />

Gerald Ford falls down the steps of Air Force One.  (He survived.)  


An example: surviving falls  
============

<img src="fig/ford_skiing.jpg" title="plot of chunk unnamed-chunk-13" alt="plot of chunk unnamed-chunk-13" width="650px" style="display: block; margin: auto;" />

Gerald Ford falls while skiing.  (He again survived.)  

An example: surviving falls  
============

<img src="fig/gerald_ford_salzburg.jpg" title="plot of chunk unnamed-chunk-14" alt="plot of chunk unnamed-chunk-14" width="750px" style="display: block; margin: auto;" />

Gerald Ford falls at a summit in Salzburg.  (He once again survived.)  


An example: surviving falls  
============

[Chevy Chase playing Gerald Ford on Saturday Night Live](https://www.youtube.com/watch?v=nEIpAIqzbTg&feature=youtu.be&t=140) 

An example: surviving falls  
============

- On an average day, 0.00003% of human beings will die in a fall.  
- So the "average" daily fall-survival probability is 0.9999997.  
- What about over 30 years?  Assuming independence:

$$
\begin{aligned}
P(\mbox{30-year streak without a deadly fall}) &= (0.9999997)^{365 \times 30} \\
&\approx 0.997
\end{aligned}  
$$

So if you have an average daily risk, then you have a 0.3% chance of dying in a fall at some point over the next 30 years---hardly negligible, but still small.



An example: surviving falls  
============


Let's change the numbers a tiny bit.  

What if your daily survivorship probability was a bit smaller than average?
- Maybe you forget to put a towel down on the bathroom floor after a shower?    
- Maybe you never bother holding the handrail as you walk down the stairs?  

To invoke the DiMaggio/Rose example: what if you became only slightly less skillful at not falling?  

An example: surviving falls  
============

For some specific numbers, let's make a diet analogy:  
- Imagine that every day you have a single mid-morning Tic-Tac, which has 2 calories.  
- One day, you decide to give it up.  
- But you're wary of crash diets, so you decide to go slowly: you'll forego that Tic-Tac only once every 10 days.  

You've just reduced your average daily calorie consumption by about 1/100th of a percent.  Will you lose weight over the long run?  Probably not.  


An example: surviving falls  
============

But what if you reduced your daily fall-survivorship probability by 1/100 of a percent?  (From 99.99997% to "merely" 99.99%.)  


Tiny change in the short run, big change in the long run:

$$
\begin{aligned}
P(\mbox{30-year streak without a deadly fall}) &= (0.9999)^{365 \times 30} \\
&\approx 0.33
\end{aligned}  
$$

Again: probability compounds multiplicatively (like interest), not additively (like calories).    



Checking independence from data
========

Suppose we have two random outcomes $A$ and $B$ and we want to know if they're independent or not.  

Solution: 
- Check whether $B$ happening seems to change the probability of $A$ happening.  
- That is, verify using data whether $P(A \mid B) = P(A \mid \mbox{not } B) = P(A)$
- These probabilities won't be _exactly_ alike because of statistical fluctuations, especially with small samples.  
- But with enough data they should be pretty close if $A$ and $B$ are independent.  


Example: the hot hand  
========

<img src="fig/nbajam.jpg" title="plot of chunk unnamed-chunk-15" alt="plot of chunk unnamed-chunk-15" width="650px" style="display: block; margin: auto;" />

Example: the hot hand  
========

The "hot hand hypothesis" says that if a player makes their _previous_ shot, they're more likely to make their _next_ shot ("He's on fire!"):  

$$
P(\mbox{makes next} \mid \mbox{makes previous}) > 
P(\mbox{makes next} \mid \mbox{misses previous})
$$

On the other hand, the "independence hypothesis" says that

$$
P(\mbox{makes next} \mid \mbox{makes previous}) = P(\mbox{makes next} \mid \mbox{misses previous})
$$


Example: the hot hand  
========
right: 45%

The next slide show some data on shooting percentages for Dr. J's 1980--81 Philadelphia 76ers.  

Key question: do players shoot better, worse, or about the same after they've just _made_ a basket, versus how they do after they've just _missed_ a basket?  

Let's look at the data...  

***

<img src="fig/julius_irving.jpg" title="plot of chunk unnamed-chunk-16" alt="plot of chunk unnamed-chunk-16" width="350px" style="display: block; margin: auto;" />


Example: the hot hand  
========
type: prompt 

Shooting percentages after:
<small>  

| Player | 3 misses | 2 misses | 1 miss | overall | 1 hit | 2 hits | 3 hits  |
|-----------------|-----|-----| -----| -----|-----|-----|-----|
| Julius Erving | 0.52 | 0.51 | 0.51 | 0.52 | 0.52 | 0.53 | 0.48 |
| Caldwell Jones | 0.50 | 0.48 | 0.47 | 0.43 | 0.47 | 0.45 | 0.27 |
| Maurice Cheeks | 0.77 | 0.6 | 0.6 | 0.54 | 0.56 | 0.55 | 0.59 |
| Daryl Dawkins | 0.88 | 0.73 | 0.71 | 0.58 | 0.62 | 0.57 | 0.51 |
| Lionel Hollins | 0.50 | 0.49 | 0.46 | 0.46 | 0.46 | 0.46 | 0.32 |
| Bobby Jones | 0.61 | 0.58 | 0.58 | 0.47 | 0.54 | 0.53 | 0.53 |
| Andrew Toney | 0.52 | 0.53 | 0.51 | 0.40 | 0.46 | 0.43 | 0.34 |
| Clint Richardson | 0.50 | 0.47 | 0.56 | 0.50 | 0.50 | 0.49 | 0.48 |
| Steve Mix | 0.70 | 0.56 | 0.52 | 0.48 | 0.52 | 0.51 | 0.36 |   

</small> 
__Which hypothesis looks right:__ hot hand or independence?  (Remember small-sample fluctations.)  


When independence goes wrong
========
right: 40%

Suppose we pick a random US family with four male children.  What is the probability $P$ that all four will be colorblind?  

The probability that a randomly sampled US male is colorblind is about 8%.  So the naive answer involves just compounding up this probability:  

$$
P = 0.08^4 \approx 0.002  
$$

What's wrong here?  

***

<img src="fig/colorblind_sweater.jpg" title="plot of chunk unnamed-chunk-17" alt="plot of chunk unnamed-chunk-17" width="350px" style="display: block; margin: auto;" />



When independence goes wrong
========

Colorblindness runs in families (it's an X-linked trait, so males only need one copy on their X chromosome to express the phenotype).  So it may be true that

$$
P(\mbox{brother 1 colorblind}) = 0.08  
$$

But

$$
P(\mbox{brother 2 colorblind} \mid \mbox{brother 1 colorblind}) = 0.5 \neq 0.08
$$

And the same is true for all subsequent brothers: if brother 1 is colorblind, you know that mom is a carrier, and so all her male children have a 50/50 chance of colorblindness.  


When independence goes wrong
========

The correct overall probability has to be built up piece by piece using the multiplication rule:  

$$
\begin{aligned}
P(\mbox{brothers 1-4 colorblind}) &= P(\mbox{brother 1 colorblind}) \\
&\times P(\mbox{brother 2 colorblind} \mid \mbox{brother 1 colorblind}) \\
&\times P(\mbox{brother 3 colorblind} \mid \mbox{brothers 1-2 colorblind}) \\
&\times P(\mbox{brother 4 colorblind} \mid \mbox{brothers 1-3 colorblind})  \\
\end{aligned}
$$

So:

$$
P(\mbox{brothers 1-4 colorblind}) =  0.08 \times 0.5^3 
= 0.01
$$


When independence goes wrong
========

Seems silly, right?

But you'd be surprised at how often people make this mistake!  We might call this the "fallacy of mistaken compounding:" assuming events are independent and naively multiplying their probabilities.    

Out of class, I'm asking you to read two short pieces that illustrate this unfortunate reality:  

- [How likely is it that birth control could let you down?](https://www.nytimes.com/interactive/2014/09/14/sunday-review/unplanned-pregnancies.html) from the _New York Times_  
- An excerpt from Chapter 7 of [AIQ: How People and Machines are Smarter Together](https://github.com/jgscott/ECO394D/blob/master/ref/AIQ_excerpt_contraceptive_effectiveness.pdf), by Nick Polson and James Scott.    


Bayes' Rule  
========

Key fact: all probabilities are contingent on what we know.  

When our knowledge changes, our probabilities must change, too.  

__Bayes' rule tells us how to change them.__  Suppose A is some event we're interested in and B is some new relevant information.  Bayes' rule tells us how to move from a prior probability, $P(A)$, to a posterior probability $P(A \mid B)$ that incorporates our knowledge of B.  


Bayes' Rule  
========

$$
P(A \mid B) = P(A) \cdot \frac{P(B \mid A)}{P(B)}  
$$

- $P(A)$ is the prior probability: how probable is $A$, before having seen data $B$?
- $P(A \mid B)$ is the posterior probability: how probable is $A$, now that we've seen data $B$?
- $P(B \mid A)$ is the likelihood: if $A$ were true, how likely is it that we'd see data $B$?
- $P(B)$ is the marginal probability of $B$: how likely is it that we'd see data $B$ overall, regardless of whether $A$ is true or not?

Calculating $P(B)$: use the rule of total probability.  


Bayes' Rule: a toy example
=======

Imagine a jar with 1024 normal quarters.  Into this jar, a friend places a single two-headed quarter (i.e. with heads on both sides).  Your friend shakes the jar to mix up the coins.  You draw a single coin at random from the jar, and without examining it closely, flip the coin ten times.

The coin comes up heads all ten times.

__Are you holding the two-headed quarter, or an ordinary quarter?__

Not just a toy example: in any industry where companies compete strenuously for talent, a lot of time and energy is spent looking for "two-headed quarters"!  



Bayes' Rule: a toy example
=======

A real-world version of the two-headed quarter problem:  
- Suppose you're in charge of a large trading desk at a major Wall Street bank.  
- You have 1025 employees under you, and each one is responsible for managing a portfolio of stocks to make money for your firm and its clients.
- One day, a young trader knocks on your door and confidently asks for a big raise.  You ask her to make a case for why she deserves one.

Bayes' Rule: a toy example
=======

She replies:

> Look at my trading record.  I've been with the company for ten months, and in each of those ten months, my portfolio returns have been in the top half of all the portfolios managed by my peers on the trading floor.  If I were just an average trader, this would be very unlikely.  In fact, the probability that an average trader would see above-average results for ten months in a row is only $(1/2)^{10}$, which is less than one chance in a thousand.  Since it's unlikely I would be that lucky, the implication is that I am a talented trader, and I should therefore get a raise.


Bayes' Rule: a toy example
=======

__Is the trader lucky, or good?__  Same math as the big jar of quarters!  
- Metaphorically, the trader is claiming to be a two-headed coin ($T$)  
- Her data is "D = ten heads in a row": she's performed above average for ten months straight.  
- This is admittedly unlikely: $P(D \mid T) = 1/2^10 = 1/1024$. 
- But excellent performers are probably also rare, so that the prior probability $P(T)$ is pretty small to begin with.  

To make an informed decision, you need to know $P(T \mid D)$: the posterior probability that the trader is an above-average performer, given the data.
  
Bayes' Rule: a toy example
=======

So let's return to the two-headed quarter example and see how a posterior probability is calculated using Bayes' rule:  

$$
P(T \mid D) = \frac{P(T) \cdot P(D \mid T)}{P(D)} \, .
$$

We'll take this equation one piece at a time.  

Bayes' Rule: a toy example
=======

$$
P(T \mid D) = \frac{P(T) \cdot P(D \mid T)}{P(D)} \, .
$$

$P(T)$ is the prior probability that you are holding the two-headed quarter.  
- There are 1025 quarters in the jar: 1024 ordinary ones, and one two-headed quarter.  
- Assuming that your friend mixed the coins in the jar well enough, then you are just as likely to draw one coin as another.  
- So $P(T)$ must be 1/1025. 

Bayes' Rule: a toy example
=======

$$
P(T \mid D) = \frac{P(T) \cdot P(D \mid T)}{P(D)} \, .
$$

Next, what about $P(D \mid T)$, the likelihood of flipping ten heads in a row, given that you chose the two-headed quarter?  
- Clearly this is 1.  
- If the quarter has two heads, there is no possibility of seeing anything else.

Bayes' Rule: a toy example
=======

$$
P(T \mid D) = \frac{P(T) \cdot P(D \mid T)}{P(D)} \, .
$$

Finally, what about $P(D)$, the marginal probability of flipping ten heads in a row?  Use the rule of total probability:  

$$
P(D) = P(T) \cdot P(D \mid T) + P(\mbox{not $T$}) \cdot P(D \mid \mbox{not $T$}) \, .
$$

- $P(T)$ is 1/1025, so $P(\mbox{not T})$ is 1024/1025.  
- $P(D \mid T) = 1$.    
- $P(D \mid \mbox{not T})$ is the probability of a ten-heads "winning streak":

$$
P(D \mid \mbox{not $T$}) = \left(\frac{1}{2}\right)^{10} = \frac{1}{1024} \, .
$$


Bayes' Rule: a toy example
=======

We can now put all these pieces together:

$$
\begin{aligned}
P(T \mid D) &= \frac{P(T) \cdot P(D \mid T) }
{ P(T) \cdot P(D \mid T) + P(\mbox{not $T$}) \cdot P(D \mid \mbox{not $T$}) } \\
&= \frac{ \frac{1}{1025} \cdot 1}
{\frac{1}{1025} \cdot 1 + \frac{1024}{1025} \cdot \frac{1}{1024}  } = \frac{1/1025}{2/1025} \\
&= \frac{1}{2} \, .
\end{aligned}
$$

There is only a 50% chance that you are holding the two-headed coin.  Yes, flipping ten heads in a row with a normal coin is very unlikely (low likelihood).  But so is drawing the one two-headed coin from a jar of 1024 normal coins! (Low prior probability.)  


