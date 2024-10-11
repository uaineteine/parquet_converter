#!/usr/bin/env Rscript
args <- commandArgs(trailingOnly = TRUE)
if (length(args) != 1) {
  stop("Only one argument must be supplied (input file).\n", call. = FALSE)
} 

# Suppress warnings globally
options(warn = -1)

suppressMessages(suppressWarnings({

# Load necessary libraries
library(readr)
library(arrow)
library(haven)
library(fs)

read_input <- function(filepath, format) {
  if (format == "csv") {
    data <- read_csv(filepath)
  } else if (format == "psv") {
    data <- read_delim(file, delim = "|")
  } else if (format == "sas'") {
    data <- read_sas(file)
  } else if (format == "xlsx") {
    data <- read_excel(file)
  } else {
    stop("Unsupported file format: ", format, call. = FALSE)
  }
  return (data)
}

convert_to_parquet <- function(directory) {
  # Get a list of all files (including sub-folders) in the directory
  all_files <- dir_ls(directory, regexp = "\\.psv$", recurse = TRUE)
  
  # Calculate the total size of all files
}

convert_to_parquet <- function(directory, format="psv") {
  # Get a list of all files (including sub-folders) in the directory
  all_files <- dir_ls(directory, regexp = "\\.psv$", recurse = TRUE)
  
  # Calculate the total size of all files
  total_size <- sum(file_size(all_files))
  
  # Initialize progress variables
  processed_size <- 0
  progress <- 0
  
  # Loop over all files
  for (file in all_files) {
    # Read the file in pipe-delimited format
    data <- read_input(format)
    
    # Define the output file name
    out_fn <- basename(file)
    out_fn <- paste0(fs::path_ext_remove(out_fn), ".parquet")
    output_file <- file.path(directory, out_fn)
    
    # Write the data to a Parquet file
    write_parquet(data, output_file)
    
    # Update progress based on file size
    processed_size <- processed_size + file_size(file)
    progress <- processed_size / total_size
    
    # Display progress (adjust as needed)
    cat(sprintf("Processing: %.2f%%\r", progress * 100))
  }
  
  # Print completion message
  cat("Parquet conversion completed!\n")
}

convert_to_parquet(args[1])

}))
