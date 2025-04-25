ARG REGISTRY 
FROM ${REGISTRY}pypy:3-slim-bookworm

ARG FLASK_VERSION=3.1.0
ARG GUNICORN_VERSION=23.0.0
ARG GEVENT_VERSION=25.4.2

RUN --mount=type=cache,target=/var/cache/apt,sharing=locked \
    --mount=type=cache,target=/var/lib/apt,sharing=locked \
    apt-get update \
    && apt install --no-install-recommends -y build-essential

RUN --mount=type=cache,target=/root/.cache/pip pip install -U \
    pip \
    wheel \
    setuptools

RUN --mount=type=cache,target=/root/.cache/pip pip install -U \
    Flask==${FLASK_VERSION} \
    gunicorn==${GUNICORN_VERSION} \
    gevent==${GEVENT_VERSION}

RUN rm -rf /var/lib/apt/lists/* \
    && apt purge build-essential -y \
    && apt autoremove -y \
    && pip cache purge
