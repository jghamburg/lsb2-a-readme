# Installing NginX Ingress Controller  

```bash
helm install --name ng stable/nginx-ingress -f values-local.yaml
```

## Known Challenges  

While deploying a local Kubernetes cluster locally, the Nginx ingess controller was returning 502
errors for some requests. This was due to the headers being too large for Nginx to handle.
Increasing the proxy_buffer_size configuration parmeter solved the problem. To achieve this with
the ingress controller, you must provide a ConfigMap and point your ingress controller to it by
passing an additional arg in your Deployment.

[Reference to Solution](https://andrewlock.net/fixing-nginx-upstream-sent-too-big-header-error-when-running-an-ingress-controller-in-kubernetes/)

Simply add extra parameters to the configMap. - But remember not all possible parameters are supported - check source code.

```yaml
controller:
  config:
    proxy-buffer-size: "16k"
```

## Resources  

[nginx-ingress-controller](https://github.com/helm/charts/tree/master/stable/nginx-ingress)

