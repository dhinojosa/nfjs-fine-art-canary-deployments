kubectl delete -f https://raw.githubusercontent.com/istio/istio/release-1.23/samples/addons/jaeger.yaml
kubectl delete -f https://raw.githubusercontent.com/istio/istio/release-1.23/samples/addons/kiali.yaml
kubectl delete -f https://raw.githubusercontent.com/istio/istio/release-1.23/samples/addons/grafana.yaml
kubectl delete -f https://raw.githubusercontent.com/istio/istio/release-1.23/samples/addons/prometheus.yaml

kubectl delete -f https://github.com/kubernetes-sigs/gateway-api/releases/download/v1.1.0/standard-install.yaml

kubectl label namespace default istio-injection-
istioctl uninstall --purge -y
