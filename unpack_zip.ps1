param(
    [Parameter(Mandatory=$true)]
    [string]$zipFilePath,

    [Parameter(Mandatory=$true)]
    [string]$destinationDir
)

# Load assembly
Add-Type -AssemblyName System.IO.Compression.FileSystem

# Ensure the destination directory exists
if (!(Test-Path -Path $destinationDir)) {
    New-Item -ItemType Directory -Force -Path $destinationDir
}

# Initialize progress
$progress = 0

# Unzip with progress
[System.IO.Compression.ZipFile]::ExtractToDirectory($zipFilePath, $destinationDir) | ForEach-Object {
    $progress++
    Write-Progress -Status "Extracting" -PercentComplete ($progress * 100 / $_.TotalCount) -Activity "Unzipping $zipFilePath"
}

Write-Host "Unzipping complete!"
