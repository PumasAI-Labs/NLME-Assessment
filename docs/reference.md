---
title: Reference Sheets for Pumas-AI NLME Model Assessment Workshop
---

[![CC BY-SA 4.0](https://img.shields.io/badge/License-CC%20BY--SA%204.0-lightgrey.svg)](http://creativecommons.org/licenses/by-sa/4.0/)

## Key Points

- You can fit multiple models with a single `Population` by calling the `fit` function with different arguments
- The `inspect` function calculates in one go preds, ipreds, wres, ebes, icoefs, and dose control parameters, if applicable for any fitted Pumas model
- You can convert any output of an `inspect` into a NM-TRAN-formatted `DataFrame`
- Everything that `inspect` computes can be individually computed using specific functions if necessary

## Summary of Basic Commands

| Action                                         | Command                                              | Observations                                                                                                               |
| ---------------------------------------------- | ---------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------- |
| Fit a Model using `FOCE()`                     | `fit(model, population, initial_parameters, FOCE())` | `initial_parameters` is a `NamedTuple` of parameter name and values                                                        |
| Generate a `inspect` result                    | `inspect(fit_result)`                                | Calculates pred, ipred, wres, ebe, icoef, and dcp (if applicable), in one go                                               |
| Generate a `inspect` result with NPDE          | `inspect(fit_result; nsim=200)`                      | Calculates pred, ipred, wres, ebe, icoef, dcp (if applicable), and NPDE with 200 times each subject is simulated in one go |
| Convert an `inspect` result into a `DataFrame` | `DataFrame(inspect_result)`                          | The resulting `DataFrame` will be NM-TRAN-formatted and can be parsed as a `Population`                                    |
| Generate a `DataFrame` of pred and ipred       | `DataFrame(predict(fit_result))`                     | NM-TRAN-formatted `DataFrame`                                                                                              |
| Generate a `DataFrame` of wres                 | `DataFrame(wresiduals(fit_result))`                  | NM-TRAN-formatted `DataFrame`                                                                                              |
| Generate a `DataFrame` of ebe                  | `DataFrame(ebe(fit_result))`                         | NM-TRAN-formatted `DataFrame`                                                                                              |
| Generate a `DataFrame` of icoef                | `DataFrame(icoef(fit_result))`                       | NM-TRAN-formatted `DataFrame`                                                                                              |
| Generate a `DataFrame` of dcp                  | `DataFrame(dosecontrol(fit_result))`                 | NM-TRAN-formatted `DataFrame`                                                                                              |

## Glossary

pred

: Population predictions, i.e. predictions using only the fixed effects and without random effects.

ipred

: Individual predictions, i.e. predictions using the fixed effects and random effects.

wres

: Weighted residuals. They are the difference between observed data and the predicted data. In other words, it's a measure of the error in the prediction. But weighted by the precision of the observations, i.e. they are divided by the standard deviation of the observations.

ebe

: Empirical Bayes estimates. They are commonly known as the individual parameters, or, also known as the "etas" (η).

icoef

: Individual coefficients. They are calculated using the population coefficients and the individual parameters.

dose control parameters

: Parameters that govern the dosage regimen of a drug, and the associated pharmacokinetic properties of the drug in the body. In Pumas models they are: lag of the dose, bioavability of the dose, rate of dosing, and duration of the dosing.

NM-TRAN

: Official NONMEM dataset format. Check [Pumas documentation on Data Representation](https://docs.pumas.ai/stable/basics/data_representation) for more information.

## Get in touch

If you have any suggestions or want to get in touch with our education team,
please send an email to <training@pumas.ai>.

## License

This content is licensed under [Creative Commons Attribution-ShareAlike 4.0 International](http://creativecommons.org/licenses/by-sa/4.0/).

[![CC BY-SA 4.0](https://licensebuttons.net/l/by-sa/4.0/88x31.png)](http://creativecommons.org/licenses/by-sa/4.0/)
