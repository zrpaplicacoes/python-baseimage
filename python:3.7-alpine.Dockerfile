# Python 3.7 Release
FROM python:3.7-alpine

# Maintainer Information
LABEL maintainer="ZRP Aplicações Informáticas LTDA - ME <zrp@zrp.com.br>"
LABEL vendor="ZRP Aplicações Informáticas LTDA - ME"
LABEL license="MIT"

# Install custom scripts into local binaries
COPY alpine_rootfs /usr/local/bin/
COPY shared /usr/local/bin

# Set environment variables
ENV PYTHON_VERSION=3.7 \
    APP_PATH=/home/python/app \
    PATH=/usr/local/bin:/home/python/app/bin:$PATH

# Install and configure Poetry
RUN pip install poetry
## Set Poetry to create venvs inside project directory
RUN poetry config settings.virtualenvs.in-project true

# Configure user, groups and working directory
RUN addgroup app
RUN adduser -u 1000 -G app -D python
RUN mkdir -p /home/python/app
WORKDIR /home/python/app

# Run the app
ENTRYPOINT ["/usr/local/bin/docker_entrypoint"]
CMD ["ash"]
