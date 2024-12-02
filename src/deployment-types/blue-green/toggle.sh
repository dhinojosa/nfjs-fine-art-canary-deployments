#!/bin/bash

# Name of the Kubernetes service
SERVICE_NAME="nginx-service"

# Get the current version label (blue or green)
CURRENT_VERSION=$(kubectl get service $SERVICE_NAME -o jsonpath='{.spec.selector.version}')

#Display the current version
echo "Current version of service $SERVICE_NAME is $CURRENT_VERSION."

# Toggle the version
if [ "$CURRENT_VERSION" == "blue" ]; then
    NEW_VERSION="green"
elif [ "$CURRENT_VERSION" == "green" ]; then
    NEW_VERSION="blue"
else
    echo "Error: Unknown version '$CURRENT_VERSION'."
    exit 1
fi

# Update the service with the new version
kubectl patch service $SERVICE_NAME -p "{\"spec\": {\"selector\": {\"version\": \"$NEW_VERSION\"}}}"

# Confirm the change
UPDATED_VERSION=$(kubectl get service $SERVICE_NAME -o jsonpath='{.spec.selector.version}')
echo "Service $SERVICE_NAME version changed to $UPDATED_VERSION."
