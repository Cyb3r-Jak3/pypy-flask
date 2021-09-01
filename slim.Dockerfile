FROM pypy:3-slim-buster

ARG FLASK_VERSION=2.0.1
ARG GUNICORN_VERSION=20.1.0
ARG GEVENT_VERSION=21.8.0

RUN apt-get update \
    && apt install --no-install-recommends -y build-essential

RUN pip --no-cache-dir install -U \
    pip \
    Flask==${FLASK_VERSION} \
    gunicorn==${GUNICORN_VERSION} \
    gevent==${GEVENT_VERSION}

RUN rm -rf /var/lib/apt/lists/* \
    && apt purge build-essential -y \
    && apt autoremove -y \
    && pip cache purge
