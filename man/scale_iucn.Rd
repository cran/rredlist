% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/rl_categories.R
\name{scale_color_iucn}
\alias{scale_color_iucn}
\alias{scale_colour_iucn}
\alias{scale_fill_iucn}
\alias{scale_discrete_iucn}
\title{IUCN Red List color scales}
\usage{
scale_color_iucn(...)

scale_fill_iucn(...)

scale_discrete_iucn(aesthetics, ...)
}
\arguments{
\item{...}{Arguments passed on to \link[ggplot2:discrete_scale]{ggplot2::discrete_scale} (except for
\code{na.value} which is already set according to the IUCN standard of
\verb{#C1B5A5})}

\item{aesthetics}{Character string or vector of character strings listing the
name(s) of the aesthetic(s) that this scale works with. This can be useful,
for example, to apply color settings to the \code{color} and \code{fill} aesthetics
at the same time, via \code{aesthetics = c("color", "fill")}.}
}
\description{
ggplot2 color scales using the colors for the IUCN Red List threat categories, as
documented in \href{https://nc.iucnredlist.org/redlist/resources/files/1646067752-FINAL_IUCN_Red_List_colour_chart.pdf}{this chart}.
}
\examples{
\dontshow{if (require(ggplot2)) withAutoprint(\{ # examplesIf}
library(ggplot2)
categories <- c("NE", "DD", "LC", "NT", "VU", "EN", "CR", "RE", "EW", "EX")
df <- data.frame(
  x = runif(1000, 0, 10), y = runif(1000, 0, 10),
  color = sample(categories, 1000, TRUE), shape = 21
)
ggplot(df) +
  geom_point(aes(x = x, y = y, fill = color), shape = 21) +
  scale_fill_iucn(name = "IUCN Category") +
  theme_classic()
\dontshow{\}) # examplesIf}
}
