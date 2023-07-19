FROM ghcr.io/cyb3r-jak3/alpine-pypy:3.10-7.3.12-3.18

ARG FLASK_VERSION=2.3.2
ARG GUNICORN_VERSION=21.1.0
ARG GEVENT_VERSION=23.7.0

RUN apk add --no-cache --virtual .build-deps libffi-dev gcc musl-dev make build-base

RUN pip --no-cache-dir install -U \
    pip \
    Flask==${FLASK_VERSION} \
    gunicorn==${GUNICORN_VERSION} \
    gevent==${GEVENT_VERSION}

RUN apk del .build-deps \
    && pip cache purge
