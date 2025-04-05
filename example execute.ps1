$destinationDir = "E:\GNAF\data\2024\MAY"

# Execute the R script with the directory path argument
$directory_path = $destinationDir -replace '\\', '/'

#convert the parquet files
$rspt_conv = "E:/GNAF/process_supply/parquet_convert.r"
& Rscript --vanilla $rspt_conv $directory_path psv
