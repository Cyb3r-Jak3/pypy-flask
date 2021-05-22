FROM pypy:3-slim

LABEL org.label-schema.vcs-url="https://github.com/Cyb3r-Jak3/pypy-flask.git" \
      org.label-schema.schema-version="1.0.0-rc1" \
      org.opencontainers.image.source="https://github.com/Cyb3r-Jak3/pypy-flask"

COPY requirements.txt /tmp/pip-tmp/
RUN apt-get update \
   && apt install --no-install-recommends -y build-essential \
   && pip --disable-pip-version-check --no-cache-dir install -r /tmp/pip-tmp/requirements.txt \
   && rm -rf /tmp/pip-tmp /var/lib/apt/lists/* \
   && apt purge build-essential -y \
   && apt autoremove -y
