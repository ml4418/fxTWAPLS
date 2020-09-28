
<!-- README.md is generated from README.Rmd. Please edit that file -->

## fxTWAPLS: Reconstruction from Biotic Assemblages <img src="inst/images/logo.png" alt="logo" align="right" height=200px/>

<!-- <img src="https://raw.githubusercontent.com/special-uor/fxTWAPLS/master/inst/images/logo.png" alt="logo" align="right" height=200px/> -->

<!-- badges: start -->

<!-- [![](https://img.shields.io/github/languages/code-size/special-uor/fxTWAPLS.svg)](https://github.com/special-uor/fxTWAPLS) -->

<!-- [![R build status](https://github.com/special-uor/fxTWAPLS/workflows/R-CMD-check/badge.svg)](https://github.com/special-uor/fxTWAPLS/actions) -->

[![](https://img.shields.io/badge/devel%20version-0.0.0.9000-blue.svg)](https://github.com/special-uor/fxTWAPLS)
[![](https://codecov.io/gh/special-uor/fxTWAPLS/branch/master/graph/badge.svg?token=Q6SYL7AOGR)](https://codecov.io/gh/special-uor/fxTWAPLS)
[![R build
status](https://github.com/special-uor/fxTWAPLS/workflows/R-CMD-check/badge.svg)](https://github.com/special-uor/fxTWAPLS/actions)
<!-- badges: end -->

## Overview

The goal of `fxTWAPLS` is …

## Installation

### Create a Personal Access Token (PAT) for Github

This is needed to install packages from private repositories. Once
configured, there is no need to configure it again.

``` r
# install.packages("usethis")
usethis::browse_github_pat(scopes = "repo", 
                           description = "R:GITHUB_PAT", 
                           host = "https://github.com/special-uor")
```

Copy the generated token. Then, run the following command:

``` r
usethis::edit_r_environ()
```

Add a new line to the `.Renviron` file:

``` bash
GITHUB_PAT=xxxyyyzzz
```

Make sure to leave a new empty line after `GITHUB_PAT`. Restart R
(Session \> Restart R in the RStudio menu bar), as environment variables
are loaded from `.Renviron` only at the start of an R session. Check
that the PAT is now available like
so:

``` r
usethis::git_sitrep()
```

<!-- You can install the released version of fxTWAPLS from [CRAN](https://CRAN.R-project.org) with: -->

<!-- ``` r -->

<!-- install.packages("fxTWAPLS") -->

<!-- ``` -->

<!-- And the development version from [GitHub](https://github.com/) with: -->

You can install the development version from
[GitHub](https://github.com/) with:

``` r
# install.packages(c("hexSticker", "remotes", "usethis"))
remotes::install_github("special-uor/fxTWAPLS")
```

## Example

<!-- This is a basic example which shows you how to solve a common problem: -->
