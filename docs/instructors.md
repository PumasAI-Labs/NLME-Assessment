---
title: Instructor's Notes for Pumas-AI NLME Model Assessment Workshop
---

[![CC BY-SA 4.0](https://img.shields.io/badge/License-CC%20BY--SA%204.0-lightgrey.svg)](http://creativecommons.org/licenses/by-sa/4.0/)

Start with the `00-model_fits.jl` script.
This covers already what the `NLME-Model` workshop teaches about model definition and model fitting.
There are two PK models of an IV drug infusion.
The first is a 1-compartment model and the second is a 2-compartment model.
Go over the model explaining the main differences between them.
You'll use these models to explain how to assess and compare models in Pumas.

Next, proceed to the `01-inspect.jl` script.
This file focuses on the `inspect` function.
Showcase how to use and explain all the calculations it is doing under the hood:
pred, ipred, wres, ebe, icoef, dcp, and NPDE.
If any user has questions about these concepts they are explained in the glossary in the reference sheet.
These can also be individually retrieved using the convenience functions and their output converted to a `DataFrame`.
Don't forget to show that the `inspect` function can generate NPDEs with the `nsim` keyword argument.

Now, proceed to the `02-predict.jl` script.
Here you'll explain about the `predict` function that generates the `_pred` and `_ipred` suffix columns for every variable defined in the `@derived` model block.
Explain the difference between those two columns, use the glossary in the reference sheet if necessary.
If the user wants to have a more dense or an altogether different time profile for the predictions than the original one in the data,
the user can do that by passing an interval/vector of time values to the optional keyword argument `obstimes`.
Show these to the user and focus on the `_pred` and `_ipred` columns despite that the `DV` column has `missing` values for these different time values.

Move to the `03-metrics.jl` script.
This is where all the model metrics will be explained.
The first function is the `metrics_table` which needs `PumasUtilities` package to be loaded.
Remind learners to use `using PumasUtilities` before using `metrics_table`.
Most of the important metrics in this table can be retrieved individually with helper functions.
The `loglikelihood` function deserves enhanced attention.
It can be called on a model `fit` result and it will give the fitted model log-likelihood with constant.
However, it is very flexible.
The user can call it using the following positional arguments: model, `Population`, `NamedTuple` of the parameters values, and any estimation method (e.g. `FOCE()` or `LaplaceI()`).
This is very helpful when the user is converting a model from another software like NONMEM.
You can in one quick and easy `loglikelihood` function call check if you have a correct model conversion or equivalent data parsing procedures.
Remind the users that for NONMEM comparisons, the user needs to multiply this value by `-2` and compare with NONMEM's "OFV with constant".
Pumas does not drop the constant when reporting log-likelihood value.
If any learner has doubts about AIC or BIC you can use the Wikipedia entries for [AIC](https://en.wikipedia.org/wiki/Akaike_information_criterion) and [BIC](https://en.wikipedia.org/wiki/Bayesian_information_criterion).
For the `ηshrinkage` and `ϵshrinkage` functions, highlight that they return a `NamedTuple` that the number of entries depend on the number of individual parameters or observations in the model, respectively.
Finally, show the `goodness_of_fit` function that takes an `inspect` result as single position argument and generates a well-established common four-panel plot containing:

1. observations versus population predictions
1. observations versus individual predictions
1. individual weighted residuals versus time
1. individual weighted residuals versus individual predictions

If the `inspect` result was called with the NPDE `nsim` keyword argument,
then all individual weighted residuals are replaced by individual normalized prediction distribution errors.
Don't forget to tell users that the `goodness_of_fit` functions depends on the `PumasUtilities` package being loaded by the user.
You can assess visually the goodness of fit plot of the 1-comparment against the 2-compartment model and discuss with the learners which one they would choose.

Finally, the last script `04-vpc.jl` deals on how to plot VPCs.
Here you first generate the data quantiles using the `vpc` function.
In Pumas, for models with continuous derived variables (including prediction corrected VPCs),
the non-parametric quantile regression approach discussed in [Jamsen et al.](https://ascpt.onlinelibrary.wiley.com/doi/pdf/10.1002/psp4.12319) is used.
This means that Pumas takes away binning from the user.
Explain to the users that the quantile regression approach is more robust and less prone to human intervention.
The `vpc_plot` function takes a result of the `vpc` as the single argument and outputs the VPC plot.
There's an option to have prediction-corrected VPCs (pcVPCs) with the keyword argument `prediction_correction` set to `true`
(it is `false` by default) in the `vpc` function.
You can assess visually the VPC plot of the 1-comparment against the 2-compartment model and discuss with the learners which one they would choose.

## Get in touch

If you have any suggestions or want to get in touch with our education team,
please send an email to <training@pumas.ai>.

## License

This content is licensed under [Creative Commons Attribution-ShareAlike 4.0 International](http://creativecommons.org/licenses/by-sa/4.0/).

[![CC BY-SA 4.0](https://licensebuttons.net/l/by-sa/4.0/88x31.png)](http://creativecommons.org/licenses/by-sa/4.0/)
