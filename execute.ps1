$destinationDir = "E:\GNAF\data\2024\MAY"

# Execute the R script with the directory path argument
$directory_path = $destinationDir -replace '\\', '/'

$rsc = "H:\Program Files\R\R-4.3.2\bin\x64\Rscript.exe"

#remove agsg 2016 files
$rspt_asgs_rem = "E:/GNAF/process_supply/remove_asgs_2016.r"
& $rsc --vanilla $rspt_asgs_rem $directory_path

#convert the parquet files
$rspt_conv = "E:/GNAF/process_supply/parquet_convert.r"
& $rsc --vanilla $rspt_conv $directory_path
