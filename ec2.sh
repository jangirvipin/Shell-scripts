#!/bin/bash

echo "Checking if AWS CLI is installed..."

if ! command -v aws &> /dev/null
then
    echo "AWS CLI is not installed."
    echo "Installing AWS CLI..."

    curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
    unzip awscliv2.zip
    sudo ./aws/install

    rm -rf aws awscliv2.zip

    echo "AWS CLI installed successfully."
else
    echo "AWS CLI is already installed."
    echo "Moving to next step..."
fi


echo "Checking if AWS is configured or not"

