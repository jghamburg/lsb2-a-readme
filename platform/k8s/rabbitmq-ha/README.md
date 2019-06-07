# Use rabbitmq under k8s  

## installation

For installation on a local machine startup with reduced resources  

```bash
helm upgrade --install --namespace default \
  --set fullnameOverride=rabbitmq,replicaCount=1\
,rabbitmqUsername=guest,rabbitmqPassword=guest \
  --values values.yaml default-rabbitmq stable/rabbitmq-ha
```

## updates

```bash
# save cookie
export ERLANGCOOKIE=$(kubectl get secrets -n <NAMESPACE> <HELM_RELEASE_NAME>-rabbitmq-ha -o jsonpath={.data.rabbitmq-erlang-cookie}
# do upgrade without forcing helm to generate a new, random cookie
helm upgrade --name <HELM_RELEASE_NAME> \
    --set rabbitmqErlangCookie=$ERLANGCOOKIE \
    --set fullnameOverride=rabbitmq-ha \
    stable/rabbitmq-ha
```

## Extras  

Define separate service with clusterip to access web interface by service name - only for development!  

```bash
kubectl apply -f service.yaml
```

If you have configured local resolution of svc names via dnsmasq you can now access rabbitmq gui via: 

[http://rabbitmq-ha-http.local.svc.cluster.local](http://rabbitmq-ha-http.local.svc.cluster.local) 
