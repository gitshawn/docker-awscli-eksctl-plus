

## Highly usable Docker image with AWSCLI, EKSCTL, Kubectl, Docker-in-docker (To push imges to ECR), oh-my-zsh

### One way to run:

```
docker run -it --rm \
-e AWS_ACCESS_KEY_ID="AWS access ID" \
-e AWS_SECRET_ACCESS_KEY="AWS access key" \
-v /var/run/docker.sock:/var/run/docker.sock \
sfriedel/awscli-eksctl-plus
```
