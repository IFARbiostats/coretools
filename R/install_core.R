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
#'
install_core <- function(option = c("normal", "minimum", "full"),
                                 bioc = FALSE){
  # 20161221 - modify package lists - tgt


  option <- match.arg(option)
  minimum_package_list <- c("dplyr", "tidyr", "ezsummary", "readr", "ggplot2",
                            "knitr", "rmarkdown", "shiny", "stringr", "REDCapR",
                            "viridis", "sas7bdat", "devtools")
  normal_package_list <- c(minimum_package_list, "lubridate", "broom", "bookdown", "DT", "haven",
                           "readxl", "highcharter", "ggthemes")
  full_package_list <- c(normal_package_list, "Cairo", "cluster", "data.table", "deming", "DiagrammeR", "fastmatch", "foreign",
                    "formatR", "geepack", "ggpmisc", "gridExtra", "gtools", "Hmisc",
                    "httr", "htmltools", "jsonlite", "lattice", "leaflet",
                    "magrittr", "mailR", "miniUI", "MplusAutomation", "nlme", "pander", "pkgcopier", "purrr",
                    "quantmod", "rcrossref", "roxygen2", "rpart",
                    "rticles", "scatterD3", "shinydashboard", "shinyjs",
                    "sparklyr", "timevis",  "testthat", "xml2")
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
