# Scratch file to think about implementing Lee bounds in R

# Basic setup: function that takes Treatment (D), Selection dummies (S) and outcome variable (y)

# 1. Calculate selection proportion
#  p0 = [P(S=1|D=1)- P(S=1|D = 0)]/P(S=1|D=1)
# 2. Calculate trimming cutoffs 
# p0 and 1-p0 percentile of y
# 3. Calculate conditional expectations of treated and selected for upper bound and lower bound
# Lower bound: E(Y|D = 1, S = 1, Y ≤ y(1− p0)) 
# Upper bound E(Y|D = 1, S = 1, Y >= y(p0))
# 4 Calculate condtional expectation for not treated and selected
# E(Y|D = 0, S = 1)
# 5. Calculate upper and lower bounds 
# E(Y|D = 1, S = 1, Y ≤ y(1− p0))  - E(Y|D = 0, S = 1)
# E(Y|D = 1, S = 1, Y >= y(p0))  - E(Y|D = 0, S = 1)
