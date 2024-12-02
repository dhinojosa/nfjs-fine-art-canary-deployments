#!/bin/bash

kubectl config use-context docker-desktop --namespace default

# Function to check if ingress-nginx repo already exists
check_ingress_nginx_repo() {
    helm repo list | grep -q "ingress-nginx"
}

# Add ingress-nginx repo if it's not already installed
if check_ingress_nginx_repo; then
    echo "ingress-nginx Helm repo already exists."
else
    echo "Adding ingress-nginx Helm repo..."
    helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx
    if [ $? -eq 0 ]; then
        echo "ingress-nginx Helm repo added successfully."
        helm repo update
    else
        echo "Failed to add ingress-nginx Helm repo."
        exit 1
    fi
fi

helm install ingress-nginx ingress-nginx/ingress-nginx --set controller.extraArgs.update-status=true --version 4.2.1
