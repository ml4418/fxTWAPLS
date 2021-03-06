% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/fxTWAPLS.R
\name{TWAPLS.predict.w}
\alias{TWAPLS.predict.w}
\title{TWA-PLS predict function}
\usage{
TWAPLS.predict.w(TWAPLSoutput, fossil_taxa)
}
\arguments{
\item{TWAPLSoutput}{the output of the \code{\link{TWAPLS.w}} training
function, either with or without \code{fx} correction}

\item{fossil_taxa}{fossil taxa abundance data to reconstruct past climates,
each row represents a site to be reconstructed, each column represents
a taxon.}
}
\value{
a list of the reconstruction results. \code{fit} is the fitted value.
}
\description{
TWA-PLS predict function
}
\examples{
\dontrun{
    # Load modern pollen data
    modern_pollen <- read.csv(system.file("extdata", 
                                         "Modern_Pollen_gdd_alpha_Tmin.csv", 
                                         package = "fxTWAPLS", 
                                         mustWork = TRUE))
    
    # Extract taxa
    taxaColMin <- which(colnames(modern_pollen) == "Abies")
    taxaColMax <- which(colnames(modern_pollen) == "Zygophyllaceae")
    taxa <- modern_pollen[, taxaColMin:taxaColMax]
    
    # Load reconstruction data
    Holocene <- read.csv(system.file("extdata", "Holocene.csv",
                                     package = "fxTWAPLS",
                                     mustWork = TRUE),
                         row.names = 1)
    taxaColMin <- which(colnames(Holocene) == "Abies")
    taxaColMax <- which(colnames(Holocene) == "Zygophyllaceae")
    core <- Holocene[, taxaColMin:taxaColMax]
    
    # Get the frequency of each climate variable fx
    fx_Tmin <- fxTWAPLS::fx(modern_pollen$Tmin, bin = 0.02)
    fx_gdd <- fxTWAPLS::fx(modern_pollen$gdd, bin = 20)
    fx_alpha <- fxTWAPLS::fx(modern_pollen$alpha, bin = 0.002)

    # MTCO
    ## Train
    fit_t_Tmin <- fxTWAPLS::TWAPLS.w(modern_taxa = taxa, 
                                     modern_climate = modern_pollen$Tmin, 
                                     nPLS = 5)
    fit_tf_Tmin <- fxTWAPLS::TWAPLS.w(modern_taxa = taxa, 
                                      modern_climate = modern_pollen$Tmin,
                                      nPLS = 5, 
                                      usefx = TRUE, 
                                      fx = fx_Tmin)
    
    ## Predict
    fossil_t_Tmin <- fxTWAPLS::TWAPLS.predict.w(fit_t_Tmin, core)
    fossil_tf_Tmin <- fxTWAPLS::TWAPLS.predict.w(fit_tf_Tmin, core)
}

}
\seealso{
\code{\link{TWAPLS.w}}
}
