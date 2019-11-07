FROM python:3.8-alpine3.10

# Maintainer Information
LABEL maintainer="ZRP <zrp@zrp.com.br>"
LABEL vendor="ZRP"
LABEL license="MIT"

# Set environment variables
ENV APP_PATH=/home/python/app \
  PATH=/usr/local/bin:/home/python/app/bin:$PATH \
  PYTHONVERSION=3.8 \
  PYTHONFAULTHANDLER=1 \
  PYTHONUNBUFFERED=1 \
  PYTHONHASHSEED=random \
  PIP_NO_CACHE_DIR=off \
  PIP_DISABLE_PIP_VERSION_CHECK=on \
  PIP_DEFAULT_TIMEOUT=100 \
  POETRY_VERSION=0.12.17

# Configure user, groups and working directory
RUN adduser -u 1000 -D python && \
  mkdir -p /home/python/app

# Run as python user
USER python

# Install custom scripts into local binaries
COPY bin /home/python/

# Set workdir
WORKDIR /home/python/app

# Install and configure Poetry
RUN pip install "poetry==$POETRY_VERSION" && \
  poetry config settings.virtualenvs.create false

# Destroy garbage
USER root
RUN rm -rf \
  /usr/share/man/* \
  /usr/includes/* \
  /var/cache/apk/*

# Run the app
ENTRYPOINT ["alpine_entrypoint"]
CMD ["ash"]
