# google-docker
Docker image for [google](https://github.com/1268/google)

## Building
```bash
DOCKER_BUILDKIT=1 docker build . -t "google:latest"
```
**NOTE**: it is possible to provide a `build-arg` for `UID` and `GID`, which will allow you to set UID and GID of your non-privileged user in your system, so that you can for example mount /data in the container and have I/O there.

## Building a specific version
```bash
export VERSION=v1.2.3
DOCKER_BUILDKIT=1 docker build . --build-arg "GOOGLE_VERSION=$VERSION" -t "google:$VERSION"
```

## Running
```bash
docker run -it --rm google
```
