# Parquet Converter v2.0 [![Execution Test](https://github.com/uaineteine/parquet_converter/actions/workflows/execution_test.yaml/badge.svg)](https://github.com/uaineteine/parquet_converter/actions/workflows/execution_test.yaml)

This script converts an input directory of target file types to Parquet format in that same directory. It can handle the following data types:

* CSV
* PSV
* EXCEL/XLSX
* SAS7BDAT

## Requirements

- R (version 3.5 or higher)
- The following R packages:
  - `readr`
  - `arrow`
  - `haven`
  - `fs`

## Usage

To run the script, use the following command:

```sh
./convert_to_parquet.R <directory>
```

Replace <directory> with the path to the directory containing the .psv files.

## Description
The script performs the following steps:

Argument Validation: Ensures that exactly one argument (the input directory) is provided.
Suppress Warnings: Suppresses warnings globally to avoid cluttering the output.
Load Libraries: Loads the necessary libraries (readr, arrow, fs).
File Processing:
Recursively lists all .psv files in the specified directory.
Calculates the total size of all files.
Initializes progress variables.
Loops over each file:
Reads the file in pipe-delimited format.
Defines the output file name with a .parquet extension.
Writes the data to a Parquet file.
Updates and displays the progress based on file size.
Completion Message: Prints a message upon completion of the conversion process.

## Example
```sh
./convert_to_parquet.R /path/to/your/directory
```

This command will convert all .psv files in /path/to/your/directory to Parquet format.

## Notes
Ensure that the specified directory contains .psv files.
The script suppresses warnings and messages for a cleaner output.
