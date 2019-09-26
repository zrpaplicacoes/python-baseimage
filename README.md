# Python Base Image

[![Commitizen friendly](https://img.shields.io/badge/commitizen-friendly-brightgreen.svg)](http://commitizen.github.io/cz-cli/)

An image for Python projects with a small set of features to ease developing applications using docker and docker-compose. This image is built on top of Python and Python Alpine official images. The image and available tags can be found in [Docker Hub](https://hub.docker.com/r/zrpaplicacoes/python/).

This image opted to use Poetry as a package manager. Documentation for poetry can be found here [here](https://poetry.eustace.io/).

## Using the image

This image is intended to be used as a base image for your own Dockerfile, or directly through docker-compose. For example:

### e.g. Dockerfile

```Dockerfile
FROM zrpaplicacoes/python:3.7

# custom configuration
```

### e.g. Docker Compose

```yaml
version: "3"
services:
  app:
    image: zrpaplicacoes/python:latest
```

## Handling Permissions (Linux only)

Before running your container ensure to provide to `docker run` your user id through the environment:

```bash
docker run -e USER_ID=<MY_USER_ID> zrpaplicacoes/python:latest
```

This ensures that the user id inside the container is the same as the host. On Docker Compose, it's advised to provide user id as an environment variable through the `env_file` option.

## All Contributors
