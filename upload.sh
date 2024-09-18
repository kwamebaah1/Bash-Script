#!/bin/bash

# Prompt user for EC2 instance details
read -p "Enter EC2 username (ubuntu): " EC2_USER
read -p "Enter EC2 public IP address: " EC2_HOST
read -p "Enter the path to your SSH key file: " SSH_KEY

# Function to upload file to EC2 instance
upload_file() {
    read -p "Enter the local file path to upload: " LOCAL_PATH
    read -p "Enter the remote file path on EC2 instance (/home/ubuntu/): " REMOTE_PATH

    scp -i "$SSH_KEY" "$LOCAL_PATH" "$EC2_USER@$EC2_HOST:$REMOTE_PATH"
}

# Function to download file from EC2 instance
download_file() {
    read -p "Enter the remote file path on EC2 instance to download (/home/ubuntu/filename): " REMOTE_PATH
    read -p "Enter the local file path to save the downloaded file: " LOCAL_PATH

    scp -i "$SSH_KEY" "$EC2_USER@$EC2_HOST:$REMOTE_PATH" "$LOCAL_PATH"
}

# Display menu and get user's choice
echo "Select an option:"
echo "1. Upload file to EC2 instance"
echo "2. Download file from EC2 instance"
read -p "Enter your choice (1 or 2): " CHOICE

case $CHOICE in
    1)
        upload_file
        ;;
    2)
        download_file
        ;;
    *)
        echo "Invalid option. Please choose 1 or 2."
        ;;
esac

