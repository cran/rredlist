% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/rl_habitats.R, R/rl_history.R
\name{rl_habitats}
\alias{rl_habitats}
\alias{rl_habitats_}
\alias{rl_history_}
\title{Get species habitats by taxon name, IUCN id, and region}
\usage{
rl_habitats(
  name = NULL,
  id = NULL,
  region = NULL,
  key = NULL,
  parse = TRUE,
  ...
)

rl_habitats_(name = NULL, id = NULL, region = NULL, key = NULL, ...)

rl_history_(name = NULL, id = NULL, region = NULL, key = NULL, ...)
}
\arguments{
\item{name}{(character) A taxonomic name}

\item{id}{(character) An IUCN identifier}

\item{region}{(character) A region name, see \code{\link{rl_regions}} for
acceptable region identifiers (use the entries in the \code{identifier}
column)}

\item{key}{A IUCN API token. See \code{\link{rl_use_iucn}}.}

\item{parse}{(logical) Whether to parse to list (\code{FALSE}) or
data.frame (\code{TRUE}). Default: \code{TRUE}}

\item{...}{Curl options passed to \code{\link[crul]{HttpClient}}}
}
\value{
A list, with the data in the \code{result} slot, unless using
a function with a trailing underscore, in which case json as character
string is returned.
}
\description{
Get species habitats by taxon name, IUCN id, and region
}
\examples{
\dontrun{
rl_habitats('Fratercula arctica')
rl_habitats('Fratercula arctica', region = 'europe')
rl_habitats(id = 12392)
rl_habitats(id = 22694927, region = 'europe')

rl_habitats_('Fratercula arctica')
rl_habitats_(id = 12392)
}
}
\references{
API docs at https://apiv3.iucnredlist.org/api/v3/docs
}
