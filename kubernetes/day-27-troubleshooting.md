# Kubernetes Troubleshooting

## Check Pods

```bash
kubectl get pods
```

## Describe Pod

```bash
kubectl describe pod <pod-name>
```

## View Logs

```bash
kubectl logs <pod-name>
```

## Execute Inside Pod

```bash
kubectl exec -it <pod-name> -- /bin/sh
```

## Delete Pod

```bash
kubectl delete pod <pod-name>
```

## Common Errors

### ImagePullBackOff

Reason

- Wrong image
- Private image

Solution

- Verify image name
- Authenticate to registry

---

### CrashLoopBackOff

Reason

- Application crashes

Solution

- Check logs
- Fix startup command

---

### Pending

Reason

- Insufficient resources

Solution

- Check node status