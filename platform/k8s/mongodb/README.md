# use mongodb under k8s  

```bash
helm upgrade --install --namespace local --values values.yaml \
  local-mongo-server stable/mongodb
```

