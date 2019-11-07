FROM python:3.7-alpine3.9

# Maintainer Information
LABEL maintainer="ZRP <zrp@zrp.com.br>"
LABEL vendor="ZRP"
LABEL license="MIT"

# Set environment variables
ENV APP_PATH=/app \
  PATH=/app/bin:/docker-entrypoint.d/bin:/usr/local/bin$PATH \
  PYTHONVERSION=3.7 \
  PYTHONFAULTHANDLER=1 \
  PYTHONUNBUFFERED=1 \
  PYTHONHASHSEED=random \
  PIP_NO_CACHE_DIR=off \
  PIP_DISABLE_PIP_VERSION_CHECK=on \
  PIP_DEFAULT_TIMEOUT=100 \
  POETRY_VERSION=0.12.17

# Install custom scripts into local binaries
COPY bin/alpine_entrypoint /docker-entrypoint.d/bin/

# Set workdir
WORKDIR /app

# Install and configure Poetry
RUN pip install "poetry==$POETRY_VERSION" && \
  poetry config settings.virtualenvs.create false

# Destroy garbage
RUN rm -rf \
  /usr/share/man/* \
  /usr/includes/* \
  /var/cache/apk/*

# Run the app
ENTRYPOINT ["alpine_entrypoint"]
CMD ["ash"]
