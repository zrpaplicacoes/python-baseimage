# Docker in Python

Docker in Python is a base image that provides a small set of features to ease developing Python applications using docker and docker-compose. This image is built on top of Python standard and Python Alpine images.
The image can be found [here](https://hub.docker.com/r/zrpaplicacoes/docker-in-python/).

This image opted to use Poetry package manager. Documentation can be found here [here](https://poetry.eustace.io/).

# Using the image

This image is intended to be use as a base image for your own Dockerfile. To use it, simply reference it in the `FROM` clause at the top of the dockerfile:

```
FROM zrpaplicacoes/docker-in-python:3.7.4
FROM zrpaplicacoes/docker-in-python:3.7.4-alpine
...
...
ENTRYPOINT ["mycustomentrypoint"]
CMD ["mycustomcmd"]
```

# Handling permissions on Linux

Before starting running your container, ensure to provide to docker run your user_id, thus handling the permissions problem that may arise during development. To do so you must use an environment variable USER_ID, so you can do `docker run --rm -ti -e USER_ID=$UID -v /myapplication/root:/home/app/web -w /home/app/web zrpaplicacoes/docker-in-python:latest` to ensure that the UID used inside the container is the same as the host machine.

# Versions

*   zrpaplicacoes/docker-in-python:3.7.4
*   zrpaplicacoes/docker-in-python:3.7.4-alpine

