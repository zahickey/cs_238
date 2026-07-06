# Algorithms for Decision Making — Algorithm Index
Kochenderfer, Wheeler, Wray (MIT Press, 2022)

This version lists the actual numbered "Algorithm N.M" boxes in the book
(178 total, plus 5 in Appendix E), rather than just section titles.
Section titles are a good proxy for *topics* but not a 1:1 map to
implementable algorithms — some sections cover pure theory/discussion
with no boxed pseudocode, and some sections contain several distinct
numbered algorithms.

Descriptions below are short paraphrases for planning purposes, not the
book's own captions.

## Chapter 2 — Representation (3 algorithms)
- 2.1 — Data structures for discrete variables and factors (probability tables) — [folder](../algos/Ch2%20Representation/2.1%20Probability%20Tables)
- 2.2 — Bayesian network data structure (variables + factors + graph) — [folder](../algos/Ch2%20Representation/2.2%20Bayesian%20Network%20Data%20Structure)
- 2.3 — Joint probability of a full assignment via the chain rule — [folder](../algos/Ch2%20Representation/2.3%20Joint%20Probability%20Chain%20Rule)

## Chapter 3 — Inference (11 algorithms)
- 3.1 — Factor product (combining two factors)
- 3.2 — Marginalizing a variable out of a factor
- 3.3 — Factor conditioning on evidence
- 3.4 — Naive exact inference by enumeration
- 3.5 — Sum-product variable elimination
- 3.6 — Sampling an assignment from a Bayesian network
- 3.7 — Direct sampling (approximate inference)
- 3.8 — Likelihood-weighted sampling
- 3.9 — Full conditional distribution for Gibbs sampling
- 3.10 — Gibbs sampling loop
- 3.11 — Exact inference in multivariate Gaussian models

## Chapter 4 — Parameter Learning (3 algorithms)
- 4.1 — Extracting sufficient statistics (counts) from a discrete data set
- 4.2 — Uniform Dirichlet prior generation
- 4.3 — Gaussian kernel / kernel density estimation

## Chapter 5 — Structure Learning (4 algorithms)
- 5.1 — Bayesian score computation for a candidate graph
- 5.2 — K2 search (fixed variable ordering)
- 5.3 — Local search over graph neighbors
- 5.4 — Markov equivalence test between two DAGs

## Chapter 6 — Simple Decisions (2 algorithms)
- 6.1 — Decision network representation and evaluation
- 6.2 — Value-of-information computation

## Chapter 7 — Exact Solution Methods (11 algorithms)
- 7.1 — MDP data structure
- 7.2 — One-step lookahead state-action value
- 7.3 — Iterative policy evaluation
- 7.4 — Exact policy evaluation (linear system solve)
- 7.5 — Greedy policy extraction from a value function
- 7.6 — Policy iteration
- 7.7 — Bellman backup
- 7.8 — Value iteration
- 7.9 — Asynchronous value iteration
- 7.10 — Linear program formulation of an MDP
- 7.11 — Linear-quadratic regulator solution

## Chapter 8 — Approximate Value Functions (6 algorithms)
- 8.1 — Approximate value iteration with a parameterized value function
- 8.2 — k-nearest-neighbor value approximation
- 8.3 — Kernel-smoothed value approximation
- 8.4 — Multilinear interpolation
- 8.5 — Simplex interpolation
- 8.6 — Linear regression value approximation
*(Neural network regression, §8.7, is discussed but has no separate numbered algorithm box.)*

## Chapter 9 — Online Planning (11 algorithms)
- 9.1 — Policy rollout to a given depth
- 9.2 — Forward search
- 9.3 — Branch and bound
- 9.4 — Sparse sampling
- 9.5 — Monte Carlo tree search (main policy)
- 9.6 — MCTS simulation step
- 9.7 — MCTS exploration bonus (UCT-style)
- 9.8 — Heuristic search with bounds
- 9.9 — Labeled heuristic search
- 9.10 — Labeled heuristic search simulation loop
- 9.11 — Labeling procedure for heuristic search

## Chapter 10 — Policy Search (6 algorithms)
- 10.1 — Monte Carlo policy evaluation
- 10.2 — Hooke-Jeeves local search
- 10.3 — Genetic algorithm policy search
- 10.4 — Cross entropy method
- 10.5 — Evolution strategies
- 10.6 — Isotropic evolution strategies

## Chapter 11 — Policy Gradient Estimation (6 algorithms)
- 11.1 — Trajectory rollout generation
- 11.2 — Finite-difference gradient estimate (deterministic policy)
- 11.3 — Finite-difference gradient estimate (stochastic policy)
- 11.4 — Likelihood ratio (REINFORCE) gradient estimate
- 11.5 — Reward-to-go gradient estimate
- 11.6 — Reward-to-go with baseline subtraction

## Chapter 12 — Policy Gradient Optimization (6 algorithms)
- 12.1 — Gradient ascent update step
- 12.2 — Gradient scaling and clipping
- 12.3 — Restricted gradient update
- 12.4 — Natural gradient update
- 12.5 — Trust region policy optimization update
- 12.6 — Clamped surrogate objective (PPO-style) update

## Chapter 13 — Actor-Critic Methods (3 algorithms)
- 13.1 — Basic actor-critic update
- 13.2 — Generalized advantage estimation
- 13.3 — Deterministic policy gradient
*(Actor-critic with MCTS, §13.4, combines 9.5 with 13.1-13.2 rather than being its own numbered box.)*

## Chapter 14 — Policy Validation (1 algorithm)
- 14.1 — Converting policy evaluation into an adversarial search problem
*(Performance metric evaluation, rare event simulation, robustness/trade analysis are covered as methodology/math rather than boxed algorithms.)*

## Chapter 15 — Exploration and Exploitation (9 algorithms)
- 15.1 — Bandit problem simulator
- 15.2 — Bayesian (Beta-Bernoulli) bandit update
- 15.3 — epsilon-greedy exploration
- 15.4 — Explore-then-commit exploration
- 15.5 — Softmax exploration
- 15.6 — Quantile exploration
- 15.7 — UCB1 exploration
- 15.8 — Posterior sampling (Thompson sampling)
- 15.9 — General reinforcement-learning simulation loop

## Chapter 16 — Model-Based Methods (9 algorithms)
- 16.1 — Maximum-likelihood transition/reward model update
- 16.2 — Converting a learned model into an MDP
- 16.3 — Full value-function update via linear programming
- 16.4 — Randomized-update model-based RL
- 16.5 — Prioritized sweeping
- 16.6 — epsilon-greedy over a learned model
- 16.7 — R-max exploration
- 16.8 — Bayesian (Dirichlet) model update
- 16.9 — Posterior sampling model update

## Chapter 17 — Model-Free Methods (6 algorithms)
- 17.1 — Incremental mean estimator
- 17.2 — Q-learning update
- 17.3 — Sarsa update
- 17.4 — Sarsa(lambda) with eligibility traces
- 17.5 — Q-learning with linear function approximation
- 17.6 — Q-learning with function approximation and experience replay

## Chapter 18 — Imitation Learning (6 algorithms)
- 18.1 — Behavioral cloning
- 18.2 — DAgger (data set aggregation)
- 18.3 — SMILe
- 18.4 — Feature-expectation estimation for IRL
- 18.5 — Maximum-margin inverse reinforcement learning
- 18.6 — Maximum-entropy inverse reinforcement learning
*(GAIL is discussed narratively without its own numbered box.)*

## Chapter 19 — Beliefs (9 algorithms)
- 19.1 — POMDP data structure
- 19.2 — Discrete Bayesian belief update
- 19.3 — Kalman filter
- 19.4 — Extended Kalman filter
- 19.5 — Unscented Kalman filter
- 19.6 — Particle filter update
- 19.7 — Particle filter with rejection
- 19.8 — Particle filter with injection
- 19.9 — Adaptive particle injection

## Chapter 20 — Exact Belief State Planning (9 algorithms)
- 20.1 — Conditional plan data structure
- 20.2 — Conditional plan evaluation
- 20.3 — Alpha-vector generation from a plan
- 20.4 — Alpha-vector policy (action selection)
- 20.5 — One-step-lookahead alpha-vector policy
- 20.6 — Belief-improvement check (for pruning)
- 20.7 — Pruning dominated alpha vectors
- 20.8 — POMDP value iteration
- 20.9 — Plan/alpha-vector expansion step

## Chapter 21 — Offline Belief State Planning (16 algorithms)
- 21.1 — Generic alpha-vector iteration framework
- 21.2 — QMDP
- 21.3 — Fast informed bound
- 21.4 — Best-action worst-state lower bound
- 21.5 — Blind lower bound
- 21.6 — Belief backup operator
- 21.7 — Point-based value iteration (PBVI)
- 21.8 — Randomized PBVI
- 21.9 — Sawtooth upper bound representation
- 21.10 — Sawtooth iteration
- 21.11 — Random belief/reward sampling step
- 21.12 — Random belief-set expansion
- 21.13 — Exploratory belief-set expansion
- 21.14 — Sawtooth heuristic search
- 21.15 — Triangulated (Freudenthal) value representation
- 21.16 — Triangulated value iteration

## Chapter 22 — Online Belief State Planning (4 algorithms)
- 22.1 — POMDP Monte Carlo tree search
- 22.2 — Determinized particle belief update
- 22.3 — Determinized sparse tree search
- 22.4 — Heuristic search with gap bound

## Chapter 23 — Controller Abstractions (7 algorithms)
- 23.1 — Finite state controller representation
- 23.2 — Controller policy evaluation
- 23.3 — Controller policy iteration
- 23.4 — Controller pruning
- 23.5 — Nonlinear-programming controller optimization
- 23.6 — Controller gradient ascent
- 23.7 — Controller gradient step computation

## Chapter 24 — Multiagent Reasoning (12 algorithms)
- 24.1 — Simple game data structure
- 24.2 — Joint/individual policy representation
- 24.3 — Deterministic best response
- 24.4 — Softmax best response
- 24.5 — Nash equilibrium via nonlinear program
- 24.6 — Joint correlated policy representation
- 24.7 — Correlated equilibrium via linear program
- 24.8 — Iterated best response
- 24.9 — Hierarchical softmax response
- 24.10 — Joint policy simulation loop
- 24.11 — Fictitious play
- 24.12 — Gradient ascent (simple games)

## Chapter 25 — Sequential Problems, Multiagent (9 algorithms)
- 25.1 — Markov game data structure
- 25.2 — MG policy representation
- 25.3 — Deterministic best response (MG)
- 25.4 — Softmax response (MG)
- 25.5 — Nash equilibrium via nonlinear program (MG)
- 25.6 — MG simulation loop
- 25.7 — Fictitious play (MG)
- 25.8 — Gradient ascent (MG)
- 25.9 — Nash Q-learning

## Chapter 26 — State Uncertainty, Multiagent (4 algorithms)
- 26.1 — POMG data structure
- 26.2 — Joint conditional plan evaluation
- 26.3 — Nash equilibrium via simple-game reduction
- 26.4 — Dynamic programming for POMGs

## Chapter 27 — Collaborative Agents (5 algorithms)
- 27.1 — Dec-POMDP data structure
- 27.2 — Dynamic programming for Dec-POMDPs
- 27.3 — Iterated best response (Dec-POMDP)
- 27.4 — Memory-bounded heuristic search
- 27.5 — Nonlinear-programming controller optimization (Dec-POMDP)

## Appendix E — Search Algorithms (5 algorithms)
General (non-MDP-specific) versions of search algorithms, referenced from
Chapter 9. Good warm-up implementations before the MDP-specific versions.
- E.1 — Generic search problem data structure
- E.2 — Forward search
- E.3 — Branch and bound
- E.4 — Forward search with memoization (transposition table)
- E.5 — Heuristic search

---
**Chapters with no numbered algorithms:** Chapter 1 (Introduction) is
conceptual only.

**Total: 178 numbered algorithms across Chapters 2-27, plus 5 in Appendix E = 183.**

At one per day (skipping the handful of pure-theory sections noted
above), this is close to 7-8 months of daily material if done in order,
front to back.
