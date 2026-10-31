#!/bin/bash

# Simple interactive wrapper for the THC-Hydra tool
echo "========================================="
echo "        EASY HYDRA WRAPPER CRACKER       "
echo "========================================="

# 1. Target Configuration
read -p "Enter Target IP / Domain (or leave blank if using a list): " target
if [ -z "$target" ]; then
    read -p "Enter path to Target List file (-M): " target_list
    if [ ! -f "$target_list" ]; then
        echo "[!] Error: Target list file not found."
        exit 1
    fi
    TARGET_CMD="-M $target_list"
else
    TARGET_CMD="$target"
fi

# 2. Protocol / Service Configuration
read -p "Enter Service Protocol (e.g., ssh, ftp, http-post-form, rdp): " protocol
if [ -z "$protocol" ]; then
    echo "[!] Error: Protocol cannot be empty."
    exit 1
fi

# 3. Username Configuration
read -p "Enter a single Username (leave blank if using a wordlist): " username
if [ -z "$username" ]; then
    read -p "Enter path to Username Wordlist (-L): " user_list
    if [ ! -f "$user_list" ]; then
        echo "[!] Error: Username file not found."
        exit 1
    fi
    USER_CMD="-L $user_list"
else
    USER_CMD="-l $username"
fi

# 4. Password Configuration
read -p "Enter a single Password to test (leave blank if using a wordlist): " password
if [ -z "$password" ]; then
    read -p "Enter path to Password Wordlist (-P): " pass_list
    if [ ! -f "$pass_list" ]; then
        echo "[!] Error: Password file not found."
        exit 1
    fi
    PASS_CMD="-P $pass_list"
else
    PASS_CMD="-p $password"
fi

# 5. Fine Tuning Options
read -p "Enter number of parallel tasks / threads (Default is 16) [-t]: " threads
threads=${threads:-16}

read -p "Additional parameters / paths (e.g., '/login.php:user=^USER^&pass=^PASS^:F' for web forms, or leave blank): " extra_args

# 6. Execute Command
echo ""
echo "[+] Constructing Hydra Command..."
FINAL_CMD="hydra $USER_CMD $PASS_CMD -t $threads $TARGET_CMD $protocol $extra_args"

echo "Executing: $FINAL_CMD"
echo "----------------------------------------="
eval $FINAL_CMD
