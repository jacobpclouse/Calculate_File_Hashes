# File Hash Computation Scripts

## Overview
These scripts are designed to compute various cryptographic hashes (MD5, SHA-1, SHA-256, SHA-384, SHA-512) for a given file. They display a logo, compute the hashes, and save the results to a text file. There are two versions of the script: one written in Bash for Unix-based systems and one written in PowerShell for Windows.

## Bash Script (`Bash_Calculate_Hashes.sh`)
### Purpose
The Bash script is intended for Unix-based systems (Linux, macOS) and computes the following hashes for a specified file:
- MD5
- SHA-1
- SHA-256
- SHA-384
- SHA-512

### Usage
1. Make the script executable:
    ```bash
    chmod +x Bash_Calculate_Hashes.sh
    ```
2. Run the script with the path to the file as an argument:
    ```bash
    ./Bash_Calculate_Hashes.sh path/to/your/file.txt
    ```

### Output
The script prints the hashes to the console and saves them to `BASH_FileHashes.txt` in the current directory.

## PowerShell Script (`PWSH_Calculate_Hashes.ps1`)
### Purpose
The PowerShell script is intended for Windows systems and computes the following hashes for a specified file:
- MD5
- SHA-1
- SHA-256
- SHA-384
- SHA-512

### Usage
1. Open PowerShell.
2. Run the script with the path to the file as an argument:
    ```powershell
    .\PWSH_Calculate_Hashes.ps1 -filePath "path\to\your\file.txt"
    ```

### Output
The script prints the hashes to the console and saves them to `POWERSHELL_FileHashes.txt` in the current directory.

## Notes
- Ensure that the required utilities (`md5sum`, `sha1sum`, `sha256sum`, `sha384sum`, `sha512sum`) are installed on your Unix-based system to use the Bash script.
- The PowerShell script should work on any modern Windows system with PowerShell installed.

## Authors
Created and tested by Jacob Clouse (aka, it was ChatGPT, I helped a little bit).
