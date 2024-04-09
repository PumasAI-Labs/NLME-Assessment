include("02-predict.jl")
using PumasUtilities

# You can get all model metrics from a fit result with metrics_table
# It returns a DataFrame
metrics_table(fit_1cmt)
metrics_table(fit_2cmt)

# Additionally, everything in metrics_table can be individually retrieved with specialized functions
loglikelihood(fit_1cmt)
aic(fit_1cmt)
bic(fit_1cmt)
ηshrinkage(fit_1cmt)
ϵshrinkage(fit_1cmt)

# One highlight is the log-likelihood function
# It can compute a loglikelihood for any model given any population, parameter values, and estimation method
# This is helpful for model conversions from other software/tools
loglikelihood(
    model_1cmt,
    pop,
    (; # NamedTuple of parameter values
        tvcl = 0.2,
        tvvc = 5,
        Ω = Diagonal([0.1, 0.1]),
        σ_add = 0.01,
        σ_prop = 0.05,
    ),
    FOCE(),
)

# There are several plotting functions available in Pumas
# We will not cover all of them but one deserves a highlight: goodness_of_fit
# It takes a Pumas result from inspect and outputs a 4-panel plot with:
# 1. observations versus pred
# 2. observation versus ipred
# 3. wres versus time
# 4. wres versus ipred
goodness_of_fit(inspect_1cmt)
goodness_of_fit(inspect_2cmt)

# If you calculated NPDEs in the inspect result instead of wres you will have NPDE
goodness_of_fit(inspect_1cmt_npde)
goodness_of_fit(inspect_2cmt_npde)
