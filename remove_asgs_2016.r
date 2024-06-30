#!/usr/bin/env Rscript
args <- commandArgs(trailingOnly = TRUE)
if (length(args) != 1) {
  stop("Only one argument must be supplied (input directory).\n", call. = FALSE)
} 

# Remove files with the format MB_2016
files_to_remove <- list.files(args[1], pattern = "MB_2016", full.names = TRUE)
unlink(files_to_remove)

cat("Files with the format 'MB_2016' have been deleted.\n")
