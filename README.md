# google-docker
Docker image for [google](https://github.com/3052/google)

## Building
```bash
DOCKER_BUILDKIT=1 docker build . -t "google:latest"
```
**NOTE**: it is possible to provide a `build-arg` for `UID` and `GID`, which will allow you to set UID and GID of your non-privileged user in your system, so that you can for example mount /data in the container and have I/O there.

## Running
```bash
docker run -v $(pwd)/data:/google --rm google
```
