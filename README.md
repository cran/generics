
# generics

[![Build
Status](https://travis-ci.org/r-lib/generics.svg?branch=master)](https://travis-ci.org/r-lib/generics)
[![Coverage
status](https://codecov.io/gh/r-lib/generics/branch/master/graph/badge.svg)](https://codecov.io/github/r-lib/generics?branch=master)
![](https://img.shields.io/badge/lifecycle-experimental-orange.svg)

`generics` is designed to help package authors reduce dependencies by
providing a set of generic methods that can be imported. For example, if
a package author wanted to include a `tidy` method for their object,
they would have to import the `broom` package to do so. This would work
but would potentially increase the number of package dependencies
required to install and/or test the package.

## Installation

To install `generics` from CRAN, use:

``` r
install.packages("generics")
```

To install the development version, use:

``` r
install.packages("devtools")
devtools::install_github("r-lib/generics")
```

## Usage

`generics` is a simple, lightweight package that contains S3 generics to
be used by other packages. Some examples are:

``` r
library(generics)
#> 
#> Attaching package: 'generics'
#> The following objects are masked from 'package:base':
#> 
#>     as.difftime, as.factor, as.ordered, intersect, is.element,
#>     setdiff, setequal, union

fit
#> function (object, ...) 
#> {
#>     UseMethod("fit")
#> }
#> <bytecode: 0x7fafff33a2e0>
#> <environment: namespace:generics>

tidy
#> function (x, ...) 
#> {
#>     UseMethod("tidy")
#> }
#> <bytecode: 0x7fafff3f73b8>
#> <environment: namespace:generics>
```

To use `generics` with your package, we recommend that you import and
re-export the generic(s) of interest. For example, if you want to
provide a method for the S3 `fit()` method, you’d using the following
`roxygen2` code:

``` r
#' @importFrom generics explain
#' @export
generics::explain
#> function (x, ...) 
#> {
#>     UseMethod("explain")
#> }
#> <bytecode: 0x7faffdb7e0c8>
#> <environment: namespace:generics>
```

As an example, the [recipes](https://github.com/tidymodels/recipes)
package defines a number of `tidy()` S3 methods by importing this
package (whereas it previously depended on `broom`).

## Documentation

When searching for help on a method that is exported from `generics` by
one or more packages, using `?method` will show entries for all exported
methods. If the version from `generics` is selected, the Methods section
dynamically lists all specific methods exported by any loaded packages.