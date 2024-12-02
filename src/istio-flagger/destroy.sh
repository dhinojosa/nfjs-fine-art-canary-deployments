# Delete Metrics Server
kubectl delete -f ../metrics/components.yaml

# Delete flagger
kubectl delete -k github.com/fluxcd/flagger//kustomize/istio

# Delete Istio Addons
kubectl delete -f https://raw.githubusercontent.com/istio/istio/release-1.23/samples/addons/jaeger.yaml
kubectl delete -f https://raw.githubusercontent.com/istio/istio/release-1.23/samples/addons/kiali.yaml
kubectl delete -f https://raw.githubusercontent.com/istio/istio/release-1.23/samples/addons/grafana.yaml
kubectl delete -f https://raw.githubusercontent.com/istio/istio/release-1.23/samples/addons/prometheus.yaml

# Delete Gateway API
kubectl delete -f https://github.com/kubernetes-sigs/gateway-api/releases/download/v1.1.0/standard-install.yaml

# Delete Istio
kubectl label namespace default istio-injection-
istioctl uninstall --purge -y
