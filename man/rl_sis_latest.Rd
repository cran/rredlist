% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/rl_taxa.R
\name{rl_sis_latest}
\alias{rl_sis_latest}
\title{SIS ID latest assessment}
\usage{
rl_sis_latest(id, scope = "1", key = NULL, parse = TRUE, ...)
}
\arguments{
\item{id}{(integer) The SIS ID of the taxonomic entity to look up.}

\item{scope}{(character) An optional scope (see \code{\link[=rl_scopes]{rl_scopes()}}) to filter the
results by. The default, "1", returns the latest global assessment. If no
assessments exist for the specified \code{scope}, the latest assessment across
all scopes is returned. If \code{NULL}, the latest assessment across all scopes
is returned.}

\item{key}{(character) An IUCN API token. See \code{\link[=rl_use_iucn]{rl_use_iucn()}}.}

\item{parse}{(logical) Whether to parse the output to list (\code{FALSE}) or,
where possible, data.frame (\code{TRUE}). Default: \code{TRUE}.}

\item{...}{Includes the following arguments related to the wait time between
request retries if a "Too Many Requests" error is received from the API
(see \link[crul:HttpClient]{HttpClient()$retry()} for more details):
\itemize{
\item \code{pause_base}, \code{pause_cap}, and \code{pause_min}: basis, maximum, and minimum
for calculating wait time for retry
\item \code{times}: the maximum number of times to retry
\item \code{onwait}: a callback function if the request will be retried and a
wait time is being applied
}
Also supports any \link[curl:curl_options]{curl options} passed to the GET
request via \link[crul:HttpClient]{HttpClient}.}
}
\value{
A list unless using a function with a trailing underscore, in which
case json as character string is returned.
}
\description{
Get the latest assessment for a particular taxonomic entity based on its ID
number from the \href{https://www.iucnredlist.org/assessment/sis}{IUCN Species Information Service (SIS)}. Wraps \code{\link[=rl_sis]{rl_sis()}} and
\code{\link[=rl_assessment]{rl_assessment()}}.
}
\examples{
\dontrun{
# Get latest assessment for species
ex1 <- rl_sis_latest(id = 9404)
ex1$stresses
}
}
\references{
API docs at \url{https://api.iucnredlist.org/}.
}
\seealso{
Assessments by taxa:
\code{\link{rl_class}()},
\code{\link{rl_family}()},
\code{\link{rl_kingdom}()},
\code{\link{rl_order}()},
\code{\link{rl_phylum}()},
\code{\link{rl_sis}()},
\code{\link{rl_species}()},
\code{\link{rl_species_latest}()}
}
\concept{taxa}
