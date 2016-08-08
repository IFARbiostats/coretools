#' Install core package
#'
#' @description Install a pack of R packages that people usually use around the
#' core. Anyone are welcome to contribute
#'
#' @param option Choose among \code{normal}, \code{minimum} and
#' \code{full} to install different packages under different cases
#' @param bioc If anyone want to install packages from bioconductor, set
#' this option to be \code{TRUE}.
#'
#' @export
install_core <- function(option = c("normal", "minimum", "full"),
                                 bioc = FALSE){

  option <- match.arg(option)
  normal_package_list <- c("dplyr", "tidyr", "ezsummary", "readr", "ggplot2",
                           "knirt", "rmarkdown", "shiny", "stringr", "REDCapR",
                           "lubridate", "broom", "bookdown", "DT", "haven",
                           "readxl", "highcharter", "viridis")
  minimum_package_list <- c("dplyr", "tidyr", "ezsummary", "readr", "ggplot2",
                            "knirt", "rmarkdown", "shiny", "stringr", "REDCapR",
                            "viridis")
  full_package_list <- c("dplyr", "tidyr", "ezsummary", "ggplot2", "shiny",
                    "readr", "lubridate", "broom", "knirt", "rmardown",
                    "bookdown", "data.table", "DT", "DiagrammeR", "fastmatch",
                    "formatR", "gridExtra", "haven", "highcharter", "Hmisc",
                    "httr", "htmltools", "jsonlite", "lattice", "leaflet",
                    "mailR", "miniUI", "nlme", "pander", "pkgcopier", "purrr",
                    "quantmod", "rcrossref", "roxygen2", "REDCapR", "readxl",
                    "rticles", "scatterD3", "shinydashboard", "shinyjs",
                    "sparklyr", "stringr", "testthat", "xml2", "viridis")
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
