

## Highly usable Docker image with AWSCLI, EKSCTL, Kubectl, Docker-in-docker (To push imges to ECR), oh-my-zsh

### One way to run:

```
docker run -it --rm \
-e AWS_ACCESS_KEY_ID="access ID" \
-e AWS_SECRET_ACCESS_KEY="access ID" \
-v ~/awscli:/awscli \
-v /var/run/docker.sock:/var/run/docker.sock \
sfriedel/awscli-eksctl-plus
```
