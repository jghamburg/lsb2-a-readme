# Installing the k8s dashboard

* Kubernetes doesn't deploy any system dashboard to show relevant information per default. To install the [general-purpose web-ui for kubernetes](https://github.com/kubernetes/dashboard) follow the following steps:

```bash
# check cluster is running
kubectl cluster-info
# Kubernetes master is running at https://localhost:6443
# KubeDNS is running at https://localhost:6443/api/v1/namespaces/kube-system/services/kube-dns:dns/proxy
# 
# To further debug and diagnose cluster problems, use 'kubectl cluster-info dump'.

# install dashboard
kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/master/src/deploy/recommended/kubernetes-dashboard.yaml
# cause k8s api server is - per default - available only on local machine (where it is installed AND for security reasons) run proxy
kubectl proxy &
# [1] 6516
# Starting to serve on 127.0.0.1:8001
# now you can start any web-browser to show the dahboard
open http://localhost:8001/api/v1/namespaces/kube-system/services/https:kubernetes-dashboard:/proxy/
# don't forget to close k8s proxy afterwards
fg 1
# [1]  + 6516 running    kubectl proxy
^C
```

* cause the default permission for dashboard is very restrictive, you can use a service account with cluster-admin role to login with. To login you need the generated token (in the following example we used the admin-user service account):

```bash
# get the token
kubectl -n kube-system describe secret $(kubectl -n kube-system get secret | grep -w admin-user | awk '{print $1}') | grep token: | awk '{print $2}'
# eyJhbG....QDPLnbg
```

* copy the output (it may be more than one line) and take the "Token" option from dashboard login screen