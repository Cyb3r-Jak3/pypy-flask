FROM pypy:3-slim-buster

RUN apt-get update \
    && apt install --no-install-recommends -y build-essential

COPY requirements.txt /tmp/pip-tmp/
RUN pip --disable-pip-version-check --no-cache-dir install -U pip -r /tmp/pip-tmp/requirements.txt \
    && rm -rf /tmp/pip-tmp

RUN rm -rf /var/lib/apt/lists/* \
    && apt purge build-essential -y \
    && apt autoremove -y
