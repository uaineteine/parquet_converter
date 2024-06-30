#!/usr/bin/env Rscript
args <- commandArgs(trailingOnly = TRUE)
if (length(args) != 1) {
  stop("Only one argument must be supplied (input directory).\n", call. = FALSE)
} 

# Remove files with the format *xyz*
rem_files <- function(ptn) {
  ptn <- paste0(".*", ptn, ".*")
  files_to_remove <- list.files(args[1], pattern = ptn, full.names = TRUE, recursive = TRUE)
  file.remove(files_to_remove)

  cat(paste0("Files with the format'", ptn, "' have been deleted.\n"))
}

#remove them
rem_files("MB_2016")
rem_files("MESH_BLOCK_2016")