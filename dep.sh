#!/bin/bash

# Update package repositories
sudo apt-get update

# Install unzip
sudo apt-get install -y unzip

# Download Terraform binary
wget https://releases.hashicorp.com/terraform/0.15.4/terraform_0.15.4_linux_amd64.zip

# Unzip Terraform binary
unzip terraform_0.15.4_linux_amd64.zip

# Move Terraform binary to /usr/local/bin
sudo mv terraform /usr/local/bin/

# Install AWS CLI
sudo apt-get install -y awscli

echo "Terraform and AWS CLI have been installed."
