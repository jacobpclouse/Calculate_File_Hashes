#!/bin/bash

# Before you ask: YES, this was made with Chat-gpt, my bash abilities are not great

# Run this program with the following commands:
    # chmod +x ./Bash_Calculate_Hashes.sh
    # ./Bash_Calculate_Hashes.sh path/to/your/file.txt


# Function to print logo
print_logo() {
    echo ""
    echo -e "\e[96mCreated and Tested by:\e[0m"
    echo "   __                  _         ___ _                       "
    echo "   \\ \\  __ _  ___ ___ | |__     / __\\ | ___  _   _ ___  ___  "
    echo "    \\ \\/ _\` |/ __/ _ \\| '_ \\   / /  | |/ _ \\| | | / __|/ _ \\ "
    echo " /\\_/ / (_| | (_| (_) | |_) | / /___| | (_) | |_| \\__ \\  __/ "
    echo " \\___/ \\__,_|\\___\\___/|_.__/  \\____/|_|\\___/ \\__,_|___/\\___| "
    echo "Dedicated to Mary Ann Clouse, Carmen Liberticci, Peter Clouse, and Anna Libertucci"
    echo ""
}

# Function to compute hash
compute_hash() {
    local file=$1
    local algorithm=$2
    case $algorithm in
        "MD5") hash=$(md5sum "$file" | awk '{print $1}') ;;
        "SHA1") hash=$(sha1sum "$file" | awk '{print $1}') ;;
        "SHA256") hash=$(sha256sum "$file" | awk '{print $1}') ;;
        "SHA384") hash=$(sha384sum "$file" | awk '{print $1}') ;;
        "SHA512") hash=$(sha512sum "$file" | awk '{print $1}') ;;
        *) echo "Unsupported hash algorithm: $algorithm"; exit 1 ;;
    esac
    echo $hash
}

# Validate file path
if [ ! -f "$1" ]; then
    echo "File does not exist: $1"
    exit 1
fi

file_path=$1

# Call the function to print the logo
print_logo

# Compute hashes
md5_hash=$(compute_hash "$file_path" "MD5")
sha1_hash=$(compute_hash "$file_path" "SHA1")
sha256_hash=$(compute_hash "$file_path" "SHA256")
sha384_hash=$(compute_hash "$file_path" "SHA384")
sha512_hash=$(compute_hash "$file_path" "SHA512")

# Prepare output
output=$(cat <<-EOF
File Name: $file_path
-=-=-=-=-=-=-=-=-=-= -=-=-=-=-=-=-=-=-=-= -=-=-=-=-=-=-=-=-=-= -=-=-=-=-=-=-=-=-=-=
MD5: $md5_hash
SHA-1: $sha1_hash
SHA-256: $sha256_hash
SHA-384: $sha384_hash
SHA-512: $sha512_hash
-=-=-=-=-=-=-=-=-=-= -=-=-=-=-=-=-=-=-=-= -=-=-=-=-=-=-=-=-=-= -=-=-=-=-=-=-=-=-=-=
EOF
)

# Define output file path
output_file_path="./BASH_FileHashes.txt"

# Save to text file
echo "$output" > "$output_file_path"

# Print out hashes
echo "$output"
echo ""
echo -e "\e[91mHashes have been saved to:\e[0m"
echo "    $output_file_path"
echo ""
