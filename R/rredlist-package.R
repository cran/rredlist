#' @keywords internal
"_PACKAGE"

#' @title rredlist
#' @section Authentication:
#' IUCN requires you to get your own API key, an alphanumeric string that you
#' need to send in every request. See [rl_use_iucn()] for help getting and
#' storing it. Get it at <https://api.iucnredlist.org/users/sign_up>. Keep this
#' key private. You can pass the key in to each function via the `key`
#' parameter, but it's better to store the key either as an environment variable
#' (`IUCN_REDLIST_KEY`) or an R option (`iucn_redlist_key`) - we recommend using
#' the former option.
#'
#' @section High vs. Low level package APIs:
#' **High level API**
#' High level functions do the HTTP request and parse data to a data.frame for
#' ease of downstream use. The high level functions have no underscore on
#' the end of the function name, e.g., [rl_species()].
#'
#' **Low level API**
#' The parsing to data.frame in the high level API does take extra time.
#' The low level API only does the HTTP request, and gives back JSON without
#' doing any more parsing. The low level functions DO have an underscore on
#' the end of the function name, e.g., [rl_species_()].
#'
#' @section No Spatial:
#' This package does not include support for spatial data from the IUCN Red
#' List. IUCN Red List Spatial data can be downloaded at
#' <https://www.iucnredlist.org/resources/spatial-data-download>.
#'
#' @section Citing the IUCN Red List API:
#' Get the proper citation for the version of the Red List you are using
#' by programatically running [rl_citation()]. Also see
#' <https://api.iucnredlist.org/>.
#'
#' @section Red List API Terms of Use:
#' See <https://www.iucnredlist.org/terms/terms-of-use>.
#'
#' @section Rate limiting:
#' From the IUCN folks: Too many frequent calls, or too many calls per day
#' might get your access blocked temporarily. If you're a heavy API user, the
#' Red List Unit asked that you contact them, as there might be better options.
#' They suggest a 2-second delay between your calls if you plan to make a
#' lot of calls.
#'
#' @importFrom jsonlite fromJSON
#' @importFrom lifecycle deprecated
#' @name rredlist-package
#' @aliases rredlist
#' @keywords package
NULL
