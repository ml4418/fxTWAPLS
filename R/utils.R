#' Create hexagonal logo for the package
#'
#' @param subplot image to use as the main logo
#' @param dpi plot resolution (dots-per-inch)
#' @param h_color color for hexagon border
#' @param h_fill color to fill hexagon
#' @param output output file (hexagonal logo)
#' @param package title for logo (package name)
#' @param p_color color for package name
#' @param url URL for package repository or website
#' @param u_size text size for URL
#'
#' @return hexagonal logo
#' @export
#'
#' @examples
#' hex_logo()
#' \dontrun{
#' hex_logo("inst/images/cave-painting.png", output = "inst/images/logo.png")
#' }
hex_logo <- function(subplot = system.file("images/cave-painting.png", 
                                           package = "reconbio"),
                     dpi = 600,
                     h_color = "#000000",
                     h_fill = "#696969",
                     output = system.file("images/logo.png", package = "reconbio"),
                     package = "reconbio",
                     p_color = "#eeeeee",
                     url = "https://github.com/special-uor/reconbio",
                     u_size = 1.30) {
  hexSticker::sticker(subplot = subplot, package = package,
                      h_color = h_color,  h_fill = h_fill,
                      dpi = dpi,
                      s_x = 1.0, s_y = .85, s_width = .5,
                      p_x = 1.0, p_y = 1.52, p_size = 6, p_color = p_color,
                      url = url,
                      u_angle = 30, u_color = p_color, u_size = u_size,
                      filename = output)
}

#' Perform parallel benchmarks on a function
#'
#' @param CPUS vector with the number of CPUs
#' @param FUN parallel function, MUST have a parameter called "cpus"
#' @param plot boolean flag to request a plot for the results
#' @param quiet boolean flag to print results of each execution
#' @param ... optional arguments for the function, must be named; e.g. x = df
#'
#' @export
#'
#' @examples
#' # Define toy function that sleeps for (60/cpus) seconds
#' a <- function(cpus) {Sys.sleep(60/cpus)}
#' par_benchmark(c(1, 2, 4), a)
#' par_benchmark(c(1, 2, 4), a, plot = TRUE)
par_benchmark <- function(CPUS, FUN, plot = FALSE, quiet = FALSE, ...) {
  tictoc::tic.clearlog()
  for (c in CPUS) {
    tictoc::tic(paste0("Using ", c, " CPUs"))
    out <- FUN(..., cpus = c)
    tictoc::toc(log = TRUE, quiet = quiet)
  }
  times <- unlist(tictoc::tic.log(format = TRUE))
  times <- gsub(" sec elapsed", "", unlist(times))
  times <- gsub(".*: ", "", unlist(times))
  times <- as.numeric(times)
  times_df <- data.frame(cpus = CPUS, times = times)
  
  if(plot) {
    print(ggplot2::qplot(cpus, times, data = times_df) + 
            ggplot2::geom_area(alpha = 0.5) + 
            ggplot2::geom_line() + 
            ggplot2::labs(x = "CPUs", y = "Execution time [seconds]") +
            ggplot2::scale_x_continuous(breaks = 1:max(CPUS)) + 
            ggplot2::scale_y_continuous(breaks = scales::pretty_breaks(10))
    )
  }
  return(times_df)
}

# Progress combine function
rbind_pb <- function(iterator){
  pb <- txtProgressBar(min = 1, max = iterator - 1, style = 3)
  count <- 0
  function(...) {
    count <<- count + length(list(...)) - 1
    setTxtProgressBar(pb, count)
    flush.console()
    rbind(...) # this can feed into .combine option of foreach
  }
}