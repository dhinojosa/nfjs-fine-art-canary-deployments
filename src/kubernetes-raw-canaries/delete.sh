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
        echo "Deleting resources defined in $file..."
        kubectl delete -f "$file"
        if [ $? -eq 0 ]; then
            echo "$file deleted successfully."
        else
            echo "Error deleting $file."
            exit 1
        fi
    else
        echo "No YAML files found in the current directory."
        exit 1
    fi
done

echo "All resources from YAML files have been deleted."
