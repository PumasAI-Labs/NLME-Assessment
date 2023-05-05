---
title: Pumas-AI NLME Model Assessment Workshop
description: CHANGE ME.
---

[![CC BY-SA 4.0](https://img.shields.io/badge/License-CC%20BY--SA%204.0-lightgrey.svg)](http://creativecommons.org/licenses/by-sa/4.0/)

This workshop introduces concepts of model assessment and model selection in Pumas.

It covers how:

- inspect models with the `inspect` function
- generate population and individual predictions with the `predict` function
- calculate model metrics with the `metrics_table` function
- plot goodness of fit (GoF) plots
- perform visual predictive checks (VPCs)


The following Julia files are provided:

1. `00-model_fits.jl`: defines and fits a one- and a two-compatment IV models that will be used throghout the workshop
1. `01-inspect.jl`: an overview of the `inspect` function
1. `02-predict.jl`: covers how to use the `predict` function to do rich population and individual predictions
1. `03-metrics.jl`: an overview of the different model metrics available in Pumas and the `goodness_of_fit` plotting function
1. `04-vpc.jl`: covers how to run and plot VPCs 

!!! success "Prerequisites"

    We recommend users being familiar with NLME Modeling in Pumas, especially `Population`s, `@model` macro, and `fit` function.

    The formal requirements are the [NLME Modeling Workshop](https://pumasai-labs.github.io/NLME-Model/).

## Schedule

| Time (HH:MM) | Activity | Description                              |
| ------------ | -------- | ---------------------------------------- |
| 00:00        | Setup    | Download files required for the workshop |

## Get in touch

If you have any suggestions or want to get in touch with our education team,
please send an email to <training@pumas.ai>.

## Authors

- Jose Storopoli - <jose@pumas.ai>

## License

This content is licensed under [Creative Commons Attribution-ShareAlike 4.0 International](http://creativecommons.org/licenses/by-sa/4.0/).

[![CC BY-SA 4.0](https://licensebuttons.net/l/by-sa/4.0/88x31.png)](http://creativecommons.org/licenses/by-sa/4.0/)
