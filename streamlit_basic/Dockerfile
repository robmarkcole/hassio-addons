ARG BUILD_FROM=hassioaddons/base-python:5.2.0
# hadolint ignore=DL3006
FROM ${BUILD_FROM}

# Set shell
SHELL ["/bin/bash", "-o", "pipefail", "-c"]

# Copy Python requirements file
COPY requirements.txt /tmp/

# Setup base
ARG BUILD_ARCH=amd64
RUN \
    apk add --no-cache --virtual .build-dependencies \
    g++=9.2.0-r4 \
    gcc=9.2.0-r4 \
    make=4.2.1-r2 \
    \
    && apk add --no-cache \
    nginx-mod-http-lua=1.16.1-r6 \
    lua-resty-http=0.15-r0 \
    nginx=1.16.1-r6 \
    cython=0.29.14-r0 \
    \
    && pip3 install \
    --no-cache-dir \
    --prefer-binary \
    --find-links "https://wheels.hass.io/alpine-3.11/${BUILD_ARCH}/" \
    -r /tmp/requirements.txt \
    \
    && find /usr/local \
    \( -type d -a -name test -o -name tests -o -name '__pycache__' \) \
    -o \( -type f -a -name '*.pyc' -o -name '*.pyo' \) \
    -exec rm -rf '{}' + \
    \
    && apk del --purge .build-dependencies \
    && rm -f -r \
    /etc/nginx \
    /tmp/*

# Copy data for add-on
COPY run.sh /
COPY requirements.txt /tmp/
# Install requirements for add-on
RUN pip install -r /tmp/requirements.txt

RUN chmod a+x /run.sh
CMD [ "/run.sh" ]