# use mongodb under k8s  

```bash
helm repo add bitnami	https://charts.bitnami.com/bitnami
#
helm upgrade --install --namespace default --values values.yaml default-mongo-server bitnami/mongodb
```

Startup with replicaset enabled  

```bash
helm upgrade --install --namespace default --values values.yaml --set replicaSet.enabled=true default-mongo-server bitnami/mongodb
```

