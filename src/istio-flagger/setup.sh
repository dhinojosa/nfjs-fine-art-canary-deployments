# Install Istio
istioctl install --set profile=demo -y

# Label automatic injection of sidecars
kubectl label namespace default istio-injection=enabled

# Install gateway-api
kubectl get crd gateways.gateway.networking.k8s.io &> /dev/null || \
  { kubectl apply -f https://github.com/kubernetes-sigs/gateway-api/releases/download/v1.1.0/standard-install.yaml; }

# Apply Istio Add-ons
kubectl apply -f https://raw.githubusercontent.com/istio/istio/release-1.23/samples/addons/prometheus.yaml
kubectl apply -f https://raw.githubusercontent.com/istio/istio/release-1.23/samples/addons/grafana.yaml
kubectl apply -f https://raw.githubusercontent.com/istio/istio/release-1.23/samples/addons/kiali.yaml
kubectl apply -f https://raw.githubusercontent.com/istio/istio/release-1.23/samples/addons/jaeger.yaml

# Metrics Server
kubectl apply -f ../metrics/components.yaml

# Apply flagger
kubectl apply -k github.com/fluxcd/flagger//kustomize/istio
