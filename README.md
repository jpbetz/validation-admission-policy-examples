For most examples, do:

```sh
kubectl apply -f <directory>
kubectl apply -f deployment.yaml
```


For curl:

```
alias k=kubectl

# in spare terminal
k proxy

# in main terminal
k apply -f <test-directory>

k apply -f deployment.yaml
./curl.sh
```


Scale example:

kubectl scale deploy/nginx-deployment --replicas=2
