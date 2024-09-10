#!/bin/bash

# Define colors for different purposes
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[1;34m'
CYAN='\033[1;36m'
MAGENTA='\033[1;35m'
WHITE='\033[1;37m'
NC='\033[0m' # No Color

# Add some space before displaying the text
# echo -e "\n"

# Display "Created by s0ck3t" in multicolor
echo -e "${RED}C${GREEN}r${YELLOW}e${BLUE}a${MAGENTA}t${CYAN}e${WHITE}d ${GREEN}b${CYAN}y ${YELLOW}s${RED}0${BLUE}c${MAGENTA}k${GREEN}3${CYAN}t"


# Function to display colored messages
function echo_colored() {
    echo -e "${1}${2}${NC}"
}

# Function to confirm if an action is correct or should be re-entered
function confirm_action() {
    echo_colored $CYAN "Do you want to keep this? ${YELLOW}(y/n)${CYAN}: "
    read confirm
    if [[ "$confirm" != "y" ]]; then
        echo_colored $RED "Deleting $1..."
        rm -r "$1"
        return 1
    else
        echo_colored $GREEN "Keeping $1."
        return 0
    fi
}

# Welcome message
echo_colored $MAGENTA "---------------------------"
echo_colored $WHITE "     Directory Creator"
echo_colored $MAGENTA "---------------------------"

# Prompt user for the main directory name
while true; do
    echo_colored $BLUE "Enter the ${CYAN}name of the main directory${BLUE}: "
    read main_dir
    mkdir "$main_dir"
    echo_colored $GREEN "Created main directory: ${WHITE}$main_dir"
    
    confirm_action "$main_dir"
    [[ $? -eq 0 ]] && break
done

# Move into the main directory
cd "$main_dir" || { echo_colored $RED "Failed to move into ${WHITE}$main_dir"; exit 1; }

# Prompt for the number of subdirectories
echo_colored $BLUE "How many ${CYAN}subdirectories${BLUE} would you like to create? "
read num_subdirs

# Loop to create subdirectories and text files
for ((i = 1; i <= num_subdirs; i++)); do
    while true; do
        # Ask for subdirectory name
        echo_colored $BLUE "Enter the ${CYAN}name of subdirectory ${WHITE}$i${BLUE}: "
        read sub_dir
        
        # Create subdirectory
        mkdir "$sub_dir"
        echo_colored $GREEN "Created subdirectory: ${WHITE}$sub_dir"

        # Confirm the subdirectory name
        confirm_action "$sub_dir"
        [[ $? -eq 0 ]] && break
    done

    # Move into subdirectory
    cd "$sub_dir" || { echo_colored $RED "Failed to move into ${WHITE}$sub_dir"; exit 1; }

    # Ask for the number of .txt files to create in this subdirectory
    echo_colored $BLUE "How many ${CYAN}.txt files${BLUE} do you want to create in ${WHITE}$sub_dir${BLUE}? "
    read num_files

    # Create the specified number of .txt files
    for ((j = 1; j <= num_files; j++)); do
        while true; do
            # Ask for the name of the .txt file
            echo_colored $BLUE "Enter the ${CYAN}name of .txt file ${WHITE}$j${BLUE} (without extension): "
            read file_name
            touch "$file_name.txt"
            echo_colored $GREEN "Created file: ${WHITE}$file_name.txt"
            
            # Confirm the file name
            confirm_action "$file_name.txt"
            [[ $? -eq 0 ]] && break
        done
    done

    # Move back to the main directory
    cd ..
done

echo_colored $MAGENTA "----------------------------------------"
echo_colored $GREEN "All directories and files created successfully!"
echo_colored $MAGENTA "----------------------------------------"
