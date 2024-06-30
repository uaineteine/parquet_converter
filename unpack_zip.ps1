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

# Unzip with progress
[System.IO.Compression.ZipFile]::ExtractToDirectory($zipFilePath, $destinationDir)
# Show progress
Write-Progress -Status "Extracting" -PercentComplete 100 -Activity "Unzipping $zipFilePath"
