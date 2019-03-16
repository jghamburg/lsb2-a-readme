# Install chartmuseum  

## Installation  

```
helm upgrade chartmuseum stable/chartmuseum --install --force --values local-storage.yaml --namespace local
```

## References  

[chartmuseum](https://github.com/helm/charts/tree/master/stable/chartmuseum#using-with-local-filesystem-storage)