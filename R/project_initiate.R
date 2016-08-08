#' Bootstrap an analytical folder
#'
#' @param targetdir The default setting is to initial a new project folder
#' in the current working directory. However, if you want to create this
#' skeleton in a subdirectory, use this option
#'
#' @export

project_initiate <- function(targetdir = "."){
  if(!dir.exists(targetdir)){
    stop("The target directory does not exist.")
  }
  files_to_copy <- list.files(
    system.file("project_initiate", package = "coretools"),
    recursive = T
  )

  origin_path <- paste0(
    system.file("project_initiate", package = "coretools"), "/",
    files_to_copy
  )
  target_path <- paste0(targetdir, "/", files_to_copy)

  folders <- c("manipulation", "data", "report", "report/demo")
  folder_path <- paste0(targetdir, "/", folders)
  sapply(folder_path, dir.create, showWarnings = FALSE)

  operation_success <- file.copy(origin_path, target_path,
                                 overwrite = TRUE)
}
