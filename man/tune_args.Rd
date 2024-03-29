% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/tune_args.R
\name{tune_args}
\alias{tune_args}
\title{Determine arguments tagged for tuning}
\usage{
tune_args(object, ...)
}
\arguments{
\item{object}{A \code{model_spec}, \code{recipe}, \code{workflow}, or other object.}

\item{...}{Other arguments passed to methods.}
}
\value{
A tibble with columns for the parameter name (\code{name}), whether it
contains \emph{any} tunable value (\code{tune}), the \code{id} for the parameter (\code{id}),
and the information on where the parameter was located (\code{source}).
}
\description{
\code{tune_args()} takes an object such as a model specification or a recipe and
returns a tibble of information on all possible tunable arguments and
whether or not they are actually tunable.
}
\details{
The \code{source} column is determined differently for a
\code{model_spec} or a \code{recipe} (with additional detail on the type).

The \code{id} field has any identifier that was passed from \code{tune::tune()} (e.g.
\code{tune("some note")}). If no additional detail was used in that function,
the \code{id} field reverts to the name of the parameters.
}
\section{Methods}{

\Sexpr[stage=render,results=rd]{generics:::methods_rd("tune_args")}
}

