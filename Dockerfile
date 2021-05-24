FROM pypy:3-slim

COPY requirements.txt /tmp/pip-tmp/
RUN apt-get update \
   && apt install --no-install-recommends -y build-essential \
   && pip --disable-pip-version-check --no-cache-dir install -r /tmp/pip-tmp/requirements.txt \
   && rm -rf /tmp/pip-tmp /var/lib/apt/lists/* \
   && apt purge build-essential -y \
   && apt autoremove -y
