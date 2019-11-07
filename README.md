# Python Development Base Image

[![All Contributors](https://img.shields.io/badge/all_contributors-3-orange.svg?style=flat-square)](#contributors) [![Commitizen friendly](https://img.shields.io/badge/commitizen-friendly-brightgreen.svg?style=flat-square)](http://commitizen.github.io/cz-cli/) [![Developed by ZRP](https://img.shields.io/badge/made_with_love_by-ZRP-red.svg?style=flat-square)](https://www.zrp.com.br/)

A **development** image for Python projects with a small set of features to ease bootstraping and starting apps using docker and docker-compose. This image is built on top of Python and Python Alpine official images. The image and available tags can be found in [Docker Hub](https://hub.docker.com/r/zrpaplicacoes/python/).

This image uses **Poetry** release `0.12.17` as a package manager. Documentation for poetry can be found here [here](https://poetry.eustace.io/). Our recommendation is to pin on `pyproject.toml` the poetry version also, avoiding version mismatch between local and docker environments.

## Using the image

This image is intended to be used as a base image for your own Dockerfile, or directly through docker-compose. For example:

### e.g. Dockerfile

```Dockerfile
FROM zrpaplicacoes/python:3.8-alpine3.10

# Update poetry to use preview
RUN poetry self:update --preview

# Other commands
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

## Disclaimer

Do not use this image on **production** environments. For production, we recommend extending the **official-images** and use multi-stage builds for better image security and size.

## Contributors ✨

Thanks goes to these wonderful people ([emoji key](https://allcontributors.org/docs/en/emoji-key)):

<!-- ALL-CONTRIBUTORS-LIST:START - Do not remove or modify this section -->
<!-- prettier-ignore -->
<table>
  <tr>
    <td align="center"><a href="https://github.com/GArmane"><img src="https://avatars1.githubusercontent.com/u/13931137?v=4" width="100px;" alt="Giovanni Armane"/><br /><sub><b>Giovanni Armane</b></sub></a><br /><a href="#maintenance-GArmane" title="Maintenance">🚧</a> <a href="https://github.com/zrpaplicacoes/python-baseimage/commits?author=GArmane" title="Code">💻</a></td>
    <td align="center"><a href="https://www.linkedin.com/in/pedro-gryzinsky-b2570490/"><img src="https://avatars3.githubusercontent.com/u/8284669?v=4" width="100px;" alt="Pedro Gryzinsky"/><br /><sub><b>Pedro Gryzinsky</b></sub></a><br /><a href="#maintenance-pedrogryzinsky" title="Maintenance">🚧</a></td>
    <td align="center"><a href="https://github.com/MatheusSouzaRios"><img src="https://avatars2.githubusercontent.com/u/30212080?v=4" width="100px;" alt="Matheus Rios"/><br /><sub><b>Matheus Rios</b></sub></a><br /><a href="https://github.com/zrpaplicacoes/python-baseimage/commits?author=MatheusSouzaRios" title="Code">💻</a></td>
  </tr>
</table>

<!-- ALL-CONTRIBUTORS-LIST:END -->

This project follows the [all-contributors](https://github.com/all-contributors/all-contributors) specification. Contributions of any kind welcome!
