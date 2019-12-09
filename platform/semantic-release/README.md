# Semantic Release module  

Docker image of https://github.com/semantic-release/semantic-release to get semantic releases.

# Build own image  

Run this shell script:

```bash
./build-docker.sh
```

# Use this image

```bash
docker run -it --rm -v "$PWD":/app jghamburg/git-semantic-release:latest semantic-release -b master --dry-run
```
