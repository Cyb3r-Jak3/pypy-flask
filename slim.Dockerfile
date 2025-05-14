ARG REGISTRY 
FROM ${REGISTRY}pypy:3-slim-bookworm@sha256:32cfb77c6fea25c0b6287dfc6750ab9f08aa0e6f24c0eadbf57c6ff01ba7dd46

ARG TARGETPLATFORM
ARG FLASK_VERSION=3.1.1
ARG GUNICORN_VERSION=23.0.0
ARG GEVENT_VERSION=25.5.1

RUN --mount=type=cache,id=${TARGETPLATFORM},target=/var/cache/apt,sharing=locked \
    --mount=type=cache,target=/var/lib/apt,sharing=locked \
    apt-get update \
    && apt install --no-install-recommends -y build-essential

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

RUN rm -rf /var/lib/apt/lists/* \
    && apt purge build-essential -y \
    && apt autoremove -y \
    && pip cache purge
