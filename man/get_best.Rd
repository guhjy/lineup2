% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/get_best.R
\name{get_best}
\alias{get_best}
\title{Get smallest distance for each individual}
\usage{
get_best(d, dimension = c("row", "column"), get_min = TRUE)
}
\arguments{
\item{d}{A distance matrix}

\item{dimension}{Whether to get the minimum by row or by column}

\item{get_min}{If TRUE, get the minimum; if FALSE, get the maximum}
}
\value{
A vector with \strong{all} distinct individuals, with the
minimum (or maximum) value by row or column. We include all
individuals so that the results are aligned with the results of
\code{\link[=get_self]{get_self()}}.
}
\description{
For each individual represented in a distance matrix, find the
smallest entry (with NAs for individuals present in only the rows
or only the columns).
}
\seealso{
\code{\link[=get_self]{get_self()}}, \code{\link[=get_2ndbest]{get_2ndbest()}}, \code{\link[=which_best]{which_best()}}, \code{\link[=get_nonself]{get_nonself()}}
}
