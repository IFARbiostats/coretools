#' Install core package
#'
#' @description Install a pack of R packages that people usually use around the
#' core.
#'
#' @param option Choose among \code{normal}, \code{minimum} and
#' \code{full} to install different packages under different cases
#' @param bioc If anyone want to install packages from bioconductor, set
#' this option to be \code{TRUE}.
#'
#' @export
#' 20161221 - modify package lists - tgt
#'
install_core <- function(option = c("normal", "minimum", "full"),
                                 bioc = FALSE){

  option <- match.arg(option)
  minimum_package_list <- c("dplyr", "tidyr", "ezsummary", "readr", "ggplot2",
                            "knitr", "rmarkdown", "shiny", "stringr", "REDCapR",
                            "viridis")
  normal_package_list <- c(minimum_package_list, "lubridate", "broom", "bookdown", "DT", "haven",
                           "readxl", "highcharter", "ggthemes")
  full_package_list <- c(normal_package_list, "data.table", "DiagrammeR", "fastmatch",
                    "formatR", "gridExtra", "Hmisc",
                    "httr", "htmltools", "jsonlite", "lattice", "leaflet",
                    "mailR", "miniUI", "nlme", "pander", "pkgcopier", "purrr",
                    "quantmod", "rcrossref", "roxygen2",
                    "rticles", "scatterD3", "shinydashboard", "shinyjs",
                    "sparklyr",  "testthat", "xml2",
                    "timevis", "ggpmisc", "rcrossref")
  switch(option,
         normal = install.packages(normal_package_list,
                                   repos = "https://cran.rstudio.com/"),
         minimum = install.packages(minimum_package_list,
                                    repos = "https://cran.rstudio.com/"),
         full = install.packages(full_package_list,
                                 repos = "https://cran.rstudio.com/")
         )

  if(bioc){
    source("https://bioconductor.org/biocLite.R")
    # biocLite("rhdf5")
  }
}
