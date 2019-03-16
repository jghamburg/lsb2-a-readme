# Working under kubernetes  

This section contains more details on the setup under kubernetes.  
All examples are deployed under Docker-Desktop (Mac version >= 2.0.3.0 edge - incl kubernetes).  

You will find more references [here](../../References.md).  

## basic tools on the desktop  

For basic handling you need the following toolset.  

### kubectl  

The elementary tool for all cli on kubernetes: kubectl.  

```bash
brew install kubectl
```

### helm  

For deployment of packages to kubernetes I use helm charts.  

```bash
brew install kubernetes-helm
```

## More infrastructure  

* [How to install a k8s dashboard](./dashboard/README.md)
* [How to install chartmuseum - a chart repository under k8s](./chartmuseum/README.md).  
* [How to install a nginx ingress controller](./ingress-controller/README.md).  
