#' Get the Red List API version
#'
#' @export
#' @param ... Curl options passed to [crul::verb-GET]
#' @return API version as character string
#' @examples \dontrun{
#' rl_version()
#' }
rl_version <- function(...) {
  rl_parse(rr_GET("version", NULL, ...), TRUE)$version
}
