FROM python:3.7-alpine3.9

# Maintainer Information
LABEL maintainer="ZRP <zrp@zrp.com.br>"
LABEL vendor="ZRP"
LABEL license="MIT"

# Set environment variables
ENV APP_PATH=/home/python/app \
  PATH=/usr/local/bin:/home/python/app/bin:/home/python/.poetry/bin:$PATH \
  PYTHONVERSION=3.7 \
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

# Install custom scripts into local binaries
COPY bin /home/python/

# Set workdir
WORKDIR /home/python/app

# Install and configure Poetry
RUN apk add --update curl && \
  pip install "poetry==$POETRY_VERSION" && \
  poetry config settings.virtualenvs.in-project true && \
  apk del curl && \
  rm -rf \
  /usr/share/man/* \
  /usr/includes/* \
  /var/cache/apk/*

# Run as python user
USER python

# Run the app
ENTRYPOINT ["alpine_entrypoint"]
CMD ["ash"]
