#' Get species by country
#'
#' @export
#' @param country (character) A two-letter country code. See `isocode` column
#' in result of [rl_countries()] request for country codes.
#' @template all
#' @template info
#' @examples \dontrun{
#' rl_sp_country('AZ')
#' rl_sp_country('NZ')
#'
#' # don't parse to data.frame, gives list
#' rl_sp_country('NZ', parse = FALSE)
#' # don't parse at all, get json back
#' rl_sp_country_('NZ')
#'
#' # curl options
#' res <- rl_sp_country('NZ', verbose = TRUE)
#' }
rl_sp_country <- function(country, key = NULL, parse = TRUE, ...) {
  assert_is(parse, 'logical')
  rl_parse(rl_sp_country_(country, key, ...), parse)
}

#' @export
#' @rdname rl_sp_country
rl_sp_country_ <- function(country, key = NULL, ...) {
  assert_is(key, 'character')
  assert_is(country, 'character')
  assert_n(country, 1)
  rr_GET(file.path("country/getspecies", country), key, ...)
}
