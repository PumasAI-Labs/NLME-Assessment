include("01-inspect.jl")

# Our original data has observations from 0 to 168 hours
unique(pkdata.TIME)

# predict generate pred/ipred and can take either:
# - fit result
# - model, population, parameters
predict_1cmt = DataFrame(predict(fit_1cmt))
predict_2cmt = DataFrame(predict(fit_2cmt))
predict_1cmt = DataFrame(predict(model_1cmt, pop, coef(fit_1cmt)))

# By default it will generate pred/ipred using the original data observation time profile
# Suppose you want a more richer/denser pred/ipred time profile
# You can do that with the keyword argument obstimes
# it will "extend" the original observation profile to encompass the desired obstimes
predict_1cmt_custom = DataFrame(predict(fit_1cmt; obstimes = 168:172))
