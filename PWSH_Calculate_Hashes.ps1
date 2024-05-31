# Before you ask: YES, this was made with Chat-gpt, my powershell abilities are not great

# Run this program with the following command:
    # .\Compute-FileHashes.ps1 -filePath "path\to\your\file.txt"


param (
    [string]$filePath
)

# Function to print logo
function Print-MyLogo {
    Write-Host " "
    Write-Host "Created and Tested by: " -ForegroundColor Cyan
    Write-Host "   __                  _         ___ _                       "
    Write-Host "   \ \  __ _  ___ ___ | |__     / __\ | ___  _   _ ___  ___  "
    Write-Host "    \ \/ _`  |/ __/ _ \| '_ \   / /  | |/ _ \| | | / __|/ _ \ "
    Write-Host " /\_/ / (_| | (_| (_) | |_) | / /___| | (_) | |_| \__ \  __/ "
    Write-Host " \___/ \__,_|\___\___/|_.__/  \____/|_|\___/ \__,_|___/\___| "
    Write-Host "Dedicated to Mary Ann Clouse, Carmen Liberticci, Peter Clouse, and Anna Libertucci"
    Write-Host ""
}

# Function to compute hash
function Get-FileHash {
    param (
        [string]$file,
        [string]$algorithm
    )
    $hashAlgorithm = [System.Security.Cryptography.HashAlgorithm]::Create($algorithm)
    $fileStream = [System.IO.File]::OpenRead($file)
    $hashBytes = $hashAlgorithm.ComputeHash($fileStream)
    $fileStream.Close()
    return [BitConverter]::ToString($hashBytes) -replace '-'
}

# Validate file path
if (-Not (Test-Path $filePath)) {
    Write-Error "File does not exist: $filePath"
    exit 1
}


# Call the function to print the logo
Print-MyLogo

# Compute hashes
$md5Hash = Get-FileHash -file $filePath -algorithm "MD5"
$sha1Hash = Get-FileHash -file $filePath -algorithm "SHA1"
$sha256Hash = Get-FileHash -file $filePath -algorithm "SHA256"
$sha384Hash = Get-FileHash -file $filePath -algorithm "SHA384"
$sha512Hash = Get-FileHash -file $filePath -algorithm "SHA512"


# Prepare output
$output = @"
File Name: $filePath
-=-=-=-=-=-=-=-=-=-= -=-=-=-=-=-=-=-=-=-= -=-=-=-=-=-=-=-=-=-= -=-=-=-=-=-=-=-=-=-=
MD5: $md5Hash
SHA-1: $sha1Hash
SHA-256: $sha256Hash
SHA-384: $sha384Hash
SHA-512: $sha512Hash
-=-=-=-=-=-=-=-=-=-= -=-=-=-=-=-=-=-=-=-= -=-=-=-=-=-=-=-=-=-= -=-=-=-=-=-=-=-=-=-=
"@

# Define output file path
$outputFilePath = [System.IO.Path]::Combine((Get-Location), "POWERSHELL_FileHashes.txt")

# Save to text file
$output | Out-File -FilePath $outputFilePath -Encoding UTF8

# Print out hashes: 
Write-Host "$output"
Write-Host " "

Write-Host "Hashes have been saved to: "
Write-Host "    $outputFilePath" -ForegroundColor Red
Write-Host " "
