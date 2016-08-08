#' Bootstrap an analytical folder
#'
#' @param targetdir The default setting is to initial a new project folder
#' in the current working directory. However, if you want to create this
#' skeleton in a subdirectory, use this option
#'
#' @export

project_initiate <- function(targetdir = "."){
  files_to_copy <- list.files(
    system.file("project_initiate", package = "coretools"),
    recursive = T
  )

  origin_path <- paste0(
    system.file("project_initiate", package = "coretools"), "/",
    files_to_copy
  )

  file.copy(origin_path, targetdir, overwrite = T)
}
