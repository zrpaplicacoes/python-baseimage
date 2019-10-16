# Python 3.7 Release
FROM python:3.8.0

# Maintainer Information
LABEL maintainer="ZRP <zrp@zrp.com.br>"
LABEL vendor="ZRP"
LABEL license="MIT"

# Set environment variables
ENV PYTHON_VERSION=3.7 \
  APP_PATH=/home/python/app \
  PATH=/usr/local/bin:/home/python:/home/python/app/bin:$PATH

# Install and configure Poetry
RUN pip install poetry

# Configure user, groups and working directory
RUN adduser -u 1000 -D python && \
  mkdir -p /home/python/app

# Run as python user
USER python

# Install custom scripts into local binaries
COPY bin /home/python/

# Set workdir
WORKDIR /home/python/app

# Run the app
ENTRYPOINT ["alpine_entrypoint"]
CMD ["ash"]
