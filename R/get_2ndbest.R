#' Get 2nd-smallest distance for each individual
#'
#' For each individual represented in a distance matrix, find the
#' 2nd-smallest entry (with NAs for individuals present in only the
#' rows or only the columns).
#'
#' @md
#'
#' @param d A distance matrix
#' @param dimension Whether to get the 2nd-best by row or by column
#' @param get_min If TRUE, get the 2nd-minimum; if FALSE, get the 2nd-maximum
#'
#' @return A vector with **all** distinct individuals, with the
#' 2nd-smallest (or largest) value by row or column. We include
#' all individuals so that the results are aligned with the
#' results of [get_self()].
#'
#' @seealso [get_self()], [get_best()], [which_2ndbest()], [get_nonself()]
#'
#' @importFrom stats setNames
#' @export
get_2ndbest <-
    function(d, dimension=c("row", "column"), get_min=TRUE)
{
    dimension <- match.arg(dimension)

    if(get_min) f <- function(x) sort(x, decreasing=FALSE, na.last=TRUE)[2]
    else f <- function(x) sort(x, decreasing=TRUE, na.last=TRUE)[2]

    rn <- rownames(d)
    cn <- colnames(d)
    if(is.null(rn) || is.null(cn))
        stop("Input matrix must have both row and column names")

    # distinct individuals
    ind <- unique(c(rn, cn))

    # pull out the best distances
    if(dimension=="row") result <- setNames(apply(d, 1, f), rownames(d))
    else result <- setNames(apply(d, 2, f), colnames(d))

    # paste into a vector with all individuals
    full_result <- setNames(rep(NA, length(ind)), ind)
    full_result[names(result)] <- result

    full_result
}
