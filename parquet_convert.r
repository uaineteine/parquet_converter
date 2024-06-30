# Load necessary libraries
library(readr)
library(arrow)
library(fs)

# Specify the directory containing the files
dir_path <- "E:/GNAF/2024/MAY"

# Get a list of all files in the directory
files <- dir_ls(dir_path, regexp = "\\.psv$")

# Loop over all files
for (file in files) {
  # Read the file in pipe-delimited format
  data <- read_delim(file, delim = "|")
  
  # Define the output file name
  out_fn <- basename(file)
  out_fn <- paste0(fs::path_ext_remove(out_fn), ".parquet")
  output_file <- file.path(dir_path, out_fn)
  
  # Write the data to a Parquet file
  write_parquet(data, output_file)
}
