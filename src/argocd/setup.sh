kubectl create namespace argocd
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
kubectl create namespace argo-rollouts
kubectl apply -n argo-rollouts -f https://github.com/argoproj/argo-rollouts/releases/latest/download/install.yaml
helm install prometheus prometheus-community/prometheus --namespace monitoring --create-namespace

sleep 10;

kubectl get secret argocd-initial-admin-secret -n argocd -o jsonpath="{.data.password}" | base64
sleep 5;

kubectl argo rollouts dashboard
