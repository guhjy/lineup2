#' Get self-self distance
#'
#' For each individual represented in a distance matrix, pull the
#' self-self entry (with NAs for individuals present in only the rows
#' or only the columns).
#'
#' @md
#'
#' @param d A distance matrix
#'
#' @return A vector with all distinct individuals, with the self-self
#' values
#'
#' @seealso [get_best()], [get_2ndbest()], [get_nonself()]
#'
#' @export
get_self <-
    function(d)
{
    rn <- rownames(d)
    cn <- colnames(d)
    if(is.null(rn) || is.null(cn))
        stop("Input matrix must have both row and column names")

    # distinct individuals
    ind <- unique(c(rn, cn))

    # pull out the self-self distances
    vapply(ind, function(a) ifelse(a %in% rn && a %in% cn, d[a,a], NA), 1, USE.NAMES=TRUE)
}
