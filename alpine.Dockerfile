ARG REGISTRY ghcr.io/
FROM ${REGISTRY}cyb3r-jak3/alpine-pypy:3.10-7.3.17-3.20@sha256:49d2b5834f0916efae6172b36ae32e178b0b5e7102db4b62fd3ce79477485bee

ARG TARGETPLATFORM
ARG FLASK_VERSION=3.1.1
ARG GUNICORN_VERSION=23.0.0
ARG GEVENT_VERSION=25.5.1

RUN --mount=type=cache,id=${TARGETPLATFORM},target=/var/cache/apk,sharing=locked \
    apk add --virtual .build-deps libffi-dev gcc musl-dev make build-base

RUN --mount=type=cache,id=${TARGETPLATFORM},target=/root/.cache/pip \
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
