// standardize the columns of a matrix
#ifndef FSCALE_H
#define FSCALE_H

#include <Rcpp.h>

// fscale: standardize columns of a matrix
//  The one-pass method can have a lot of round-off error, but it is quick.
Rcpp::NumericMatrix fscale(const Rcpp::NumericMatrix& x);

#endif // FSCALE_H