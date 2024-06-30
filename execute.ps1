# Define variables for the zip file path and destination directory
$zipFilePath = "E:\GNAF\data\g-naf_may24_allstates_gda2020_psv_1015.zip"
$destinationDir = "E:\GNAF\data\2024\MAY"

# Call the unzip script with the defined variables
& .\unpack_zip.ps1 -zipFilePath $zipFilePath -destinationDir $destinationDir


