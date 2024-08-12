FROM pypy:3-slim-bookworm

ARG FLASK_VERSION=3.0.3
ARG GUNICORN_VERSION=23.0.0
ARG GEVENT_VERSION=24.2.1

RUN apt-get update \
    && apt install --no-install-recommends -y build-essential

RUN pip --no-cache-dir install -U \
    pip \
    wheel \
    setuptools

RUN pip --no-cache-dir install -U \
    Flask==${FLASK_VERSION} \
    gunicorn==${GUNICORN_VERSION} \
    gevent==${GEVENT_VERSION}

RUN rm -rf /var/lib/apt/lists/* \
    && apt purge build-essential -y \
    && apt autoremove -y \
    && pip cache purge
