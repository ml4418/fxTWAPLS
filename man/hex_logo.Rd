% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/utils.R
\name{hex_logo}
\alias{hex_logo}
\title{Create hexagonal logo for the package}
\usage{
hex_logo(
  subplot = system.file("images/cave-painting.png", package = "fxTWAPLS"),
  dpi = 600,
  h_color = "#000000",
  h_fill = "#696969",
  output = system.file("images/logo.png", package = "fxTWAPLS"),
  package = "fxTWAPLS",
  p_color = "#eeeeee",
  url = "https://github.com/special-uor/fxTWAPLS",
  u_size = 1.25
)
}
\arguments{
\item{subplot}{image to use as the main logo}

\item{dpi}{plot resolution (dots-per-inch)}

\item{h_color}{colour for hexagon border}

\item{h_fill}{colour to fill hexagon}

\item{output}{output file (hexagonal logo)}

\item{package}{title for logo (package name)}

\item{p_color}{colour for package name}

\item{url}{URL for package repository or website}

\item{u_size}{text size for URL}
}
\value{
hexagonal logo
}
\description{
Create hexagonal logo for the package
}
\examples{
\dontrun{
    hex_logo()
    hex_logo("inst/images/cave-painting.png", 
             output = "inst/images/logo.png")
}
}
