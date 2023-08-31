include("00-model_fits.jl")

# You can use the inspect function to calculate in one go:
# - population predictions (pred) and individual predictions (ipred)
# - weighted residuals (wres)
# - empirical bayes estimates (ebe)
# - individual parameters (icoef)
# - dose control parameters (dcp), if applicable
# It takes as input a single fitted Pumas model
inspect_1cmt = inspect(fit_1cmt)

# You can also have NPDEs if you pass an extra optional keyword
# argument nsim with the number of times each subject is simulated
# for npde computation
inspect_1cmt_npde = inspect(fit_1cmt; nsim = 200)

# Let's also call the inspect function on our 2-compartment model
inspect_2cmt = inspect(fit_2cmt)
inspect_2cmt_npde = inspect(fit_2cmt; nsim = 200)

# You can convert any inspect object to a NM-TRAN-formatted DataFrame
inspect_1cmt_df = DataFrame(inspect_1cmt)

# Anything that inspect does can be individually calculated using the following functions
DataFrame(predict(fit_1cmt)) # pred and ipred
DataFrame(wresiduals(fit_1cmt)) # wres
DataFrame(empirical_bayes(fit_1cmt)) # ebe
DataFrame(icoef(fit_1cmt)) # icoef
DataFrame(dosecontrol(fit_1cmt)) # dcp
