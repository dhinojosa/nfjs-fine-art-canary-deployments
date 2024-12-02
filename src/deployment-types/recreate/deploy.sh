#!/bin/bash

# Check if kubectl is installed
if ! command -v kubectl &> /dev/null
then
    echo "kubectl could not be found, please install it first."
    exit 1
fi

# Loop through all YAML files in the current directory
for file in *.yaml; do
    if [[ -f "$file" ]]; then
        echo "Deploying $file..."
        kubectl apply -f "$file"
        if [ $? -eq 0 ]; then
            echo "$file deployed successfully."
        else
            echo "Error deploying $file."
            exit 1
        fi
    else
        echo "No YAML files found in the current directory."
        exit 1
    fi
done

echo "All YAML files have been deployed."
