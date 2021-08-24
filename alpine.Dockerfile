FROM jamiehewland/alpine-pypy:3-alpine3.11


RUN apk add --no-cache libffi-dev gcc musl-dev make build-base

COPY requirements.txt /tmp/pip-tmp/
RUN pip --disable-pip-version-check --no-cache-dir install -U pip -r /tmp/pip-tmp/requirements.txt \
   && rm -rf /tmp/pip-tmp

RUN apk del libffi-dev gcc musl-dev make build-base