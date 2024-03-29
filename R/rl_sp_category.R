#' Get species by category
#'
#' @export
#' @param category (character) A two-letter category code. One of
#' "DD", "LC", "NT", "VU", "EN", "CR", "EW", "EX", "LRlc", "LRnt", "LRcd"
#' @template all
#' @examples \dontrun{
#' rl_sp_category('VU')
#' rl_sp_category('LRlc')
#' rl_sp_category('EN')
#' rl_sp_category('EX')
#' rl_sp_category('EX', parse = FALSE)
#' rl_sp_category_('EX')
#' }
rl_sp_category <- function(category, key = NULL, parse = TRUE, ...) {
  assert_is(parse, 'logical')
  rl_parse(rl_sp_category_(category, key, ...), parse)
}

#' @export
#' @rdname rl_sp_category
rl_sp_category_ <- function(category, key = NULL, parse = TRUE, ...) {
  assert_is(key, 'character')
  assert_is(category, 'character')
  assert_n(category, 1)
  rr_GET(file.path("species/category", category), key, ...)
}
