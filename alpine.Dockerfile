FROM jamiehewland/alpine-pypy:3-alpine3.11

ARG FLASK_VERSION=2.0.3
ARG GUNICORN_VERSION=20.1.0
ARG GEVENT_VERSION=22.10.1

RUN apk add --no-cache --virtual .build-deps libffi-dev gcc musl-dev make build-base

RUN pip --no-cache-dir install -U \
    pip \
    Flask==${FLASK_VERSION} \
    gunicorn==${GUNICORN_VERSION} \
    gevent==${GEVENT_VERSION}

RUN apk del .build-deps \
    && pip cache purge
