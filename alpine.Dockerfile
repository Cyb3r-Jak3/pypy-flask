FROM ghcr.io/cyb3r-jak3/alpine-pypy:3.10-7.3.14-3.19

ARG FLASK_VERSION=3.0.0
ARG GUNICORN_VERSION=21.2.0
ARG GEVENT_VERSION=23.9.1

RUN apk add --no-cache --virtual .build-deps libffi-dev gcc musl-dev make build-base

RUN pip --no-cache-dir install -U \
    pip \
    Flask==${FLASK_VERSION} \
    gunicorn==${GUNICORN_VERSION} \
    gevent==${GEVENT_VERSION}

RUN apk del .build-deps \
    && pip cache purge
