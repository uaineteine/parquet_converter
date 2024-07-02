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

# Unzip without progress
Expand-Archive -Path $zipFilePath -DestinationPath $destinationDir -Force


Write-Host "Unzipping complete!"
