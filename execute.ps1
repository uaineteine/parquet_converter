# Define variables for the zip file path and destination directory
$zipFilePath = "E:\GNAF\data\g-naf_may24_allstates_gda2020_psv_1015.zip"
$destinationDir = "E:\GNAF\data\2024\MAY"

# Call the unzip script with the defined variables
& .\unpack_zip.ps1 -zipFilePath $zipFilePath -destinationDir $destinationDir

# Execute the R script with the directory path argument
$directory_path = $destinationDir -replace '\\', '/'

$rsc = "H:\Program Files\R\R-4.3.2\bin\x64\Rscript.exe"
$rspt_conv = "E:/GNAF/process_supply/parquet_convert.r"
& $rsc --vanilla $rspt_conv $directory_path

#remove agsg 2016 files
$rspt_asgs_rem = "E:/GNAF/process_supply/remove_asgs_2016.r"
& $rsc --vanilla $rspt_asgs_rem $directory_path
