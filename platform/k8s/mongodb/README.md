# use mongodb under k8s  

```bash
helm upgrade --install --namespace default --values values.yaml default-mongo-server stable/mongodb
```

Startup with replicaset enabled  

```bash
helm upgrade --install --namespace default --values values.yaml --set replicaSet.enabled=true default-mongo-server stable/mongodb
```

