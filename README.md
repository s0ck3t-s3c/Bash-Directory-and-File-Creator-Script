# d1rcr3at0r Bash-Directory-and-File-Creator-Script

## Description

This Bash script is designed to help users create a structured directory hierarchy with multiple subdirectories and text files. It prompts users for input at various stages and provides color-coded feedback to guide them through the process.

## Features

1. **Multicolor Banner Display**:
   - The script begins by displaying a multicolor banner that reads "Created by s0ck3t", utilizing different colors to highlight each letter.

2. **Colored Output**:
   - The script uses colored output to enhance readability and provide visual feedback. Colors are defined at the beginning of the script and applied to various messages.

3. **Confirmation Function**:
   - The `confirm_action` function prompts users to confirm if they want to keep or delete the created directory or file. It provides options to confirm (y) or delete (n) the item.

4. **Main Directory Creation**:
   - Users are prompted to enter the name for the main directory. The script creates this directory and confirms the action using the `confirm_action` function. If the user decides to delete the directory, the script will remove it and prompt for a new name.

5. **Subdirectory Creation**:
   - After creating the main directory, the script moves into it and prompts the user to specify the number of subdirectories to create. For each subdirectory, the user is prompted to enter a name and confirm the creation. 

6. **Text File Creation**:
   - Within each subdirectory, the script prompts the user for the number of `.txt` files to create. It then asks for each file's name (without extension), creates the file, and confirms the creation.

7. **Error Handling**:
   - The script includes error handling to manage cases where it fails to move into a directory. If directory navigation fails, the script provides an error message and exits.

8. **Completion Message**:
   - Once all directories and files are created successfully, the script displays a completion message with color-coded feedback to indicate success.

## Usage

1. **Run the Script**: Execute the script in a Bash environment.
2. **Follow Prompts**: Enter the required information when prompted, including names for directories and files.
3. **Confirm Actions**: Confirm or delete created directories and files as prompted.
4. **Completion**: Review the final message to ensure all directories and files have been created successfully.

This script is useful for automating the creation of a directory structure with multiple levels and files, providing a simple and interactive way to organize files on a system.
