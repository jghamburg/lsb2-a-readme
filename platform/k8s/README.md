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

## Packaging and deploying helm charts  

As a starter to create helm charts for easy deployment on k8s I exprored two gradle plugins.  

### helm gradle plugin from unbroken-dome  

This plugin is developed as a complete replacement of cli helm. So it contains tasks for  

* initialize k8s container with tiller  
* package component with dependency resolution  
* install package on associated k8s instance  
* delete chart from cluster  
* publishing helm chart to an associated chart repository like chartmuseum  

Publishing for now contains a known [bug](https://github.com/unbroken-dome/gradle-helm-plugin/issues/8).

The most appelling feature for me is the install/update to a k8s cluster. This provides a self contained lifecycle management through gradle on the local machine.  

The implementation details can be found in the component `lsb2-config-server`. Look into the build-gradle configuration.  

### helm gradle plugin by wfhartford  

This plugin is developed for using a selfcontained toolchain for packaging and publishing helm charts.  
Here you find no tasks for installation of helm charts to a running k8s cluster.  

As an example I have incorporated this plugin to the component `lsb2-eureka-server`.  
