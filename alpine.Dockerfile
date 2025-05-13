ARG REGISTRY ghcr.io/
FROM ${REGISTRY}cyb3r-jak3/alpine-pypy:3.10-7.3.17-3.20

ARG TARGETPLATFORM
ARG FLASK_VERSION=3.1.0
ARG GUNICORN_VERSION=23.0.0
ARG GEVENT_VERSION=25.5.1

RUN --mount=type=cache,id=${TARGETPLATFORM}-${FLASK_VERSION}-${GUNICORN_VERSION}-${GUNICORN_VERSION},target=/var/cache/apk,sharing=locked \
    apk add --virtual .build-deps libffi-dev gcc musl-dev make build-base

RUN --mount=type=cache,id=${TARGETPLATFORM}-${FLASK_VERSION}-${GUNICORN_VERSION}-${GUNICORN_VERSION}target=/root/.cache/pip \
    pip install -U \
    pip \
    wheel \
    setuptools

RUN --mount=type=cache,id=${TARGETPLATFORM}-${FLASK_VERSION}-${GUNICORN_VERSION}-${GUNICORN_VERSION},target=/root/.cache/pip \
    pip install -U \
    Flask==${FLASK_VERSION} \
    gunicorn==${GUNICORN_VERSION} \
    gevent==${GEVENT_VERSION}

RUN apk del .build-deps \
    && pip cache purge
