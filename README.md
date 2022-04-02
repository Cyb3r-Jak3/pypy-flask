# PyPy Flask

Docker base image for deploying python applications on pypy with flask, gunicorn and gevent. Saves on container build time by wrapping it all into one repo. This image is available from DockerHub, GitHub, and Gitlab.

## Tags

Images are tagged in the format: `slim|alpine-FlaskVersion-GunicornVersion-GeventVersion` i.e. `ghcr.io/cyb3r-jak3/pypy-flask:alpine-2.0.1-20.1.0-21.8.0`. There is also just plain `slim|alpine` which is always the latest versions i.e. `ghcr.io/cyb3r-jak3/pypy-flask:alpine`

## Using

```docker
    FROM cyb3rjak3/pypy-flask:alpine

    # If there are other requirements for the application
    COPY requirements.txt /tmp/pip-tmp/
    RUN pip --disable-pip-version-check --no-cache-dir install -r /tmp/pip-tmp/requirements.txt \
        && rm -rf /tmp/pip-tmp

    WORKDIR /usr/app

    COPY src/ ./

    ENTRYPOINT [ "gunicorn", "-k", "gthread","--preload", "--bind", "0.0.0.0", "--workers", "8", "app:app" ]
```

You can replace the FROM image with any of the following:

- ghcr.io/cyb3r-jak3/pypy-flask:slim
- cyb3rjak3/pypy-flask:slim
- registry.gitlab.com/cyb3r-jak3/pypy-flask:slim

Slim images are build using the [official pypy image](https://hub.docker.com/_/pypy/)

### Alpine

There are also alpine-based images available. This are build using [this container](https://hub.docker.com/r/jamiehewland/alpine-pypy/)

- ghcr.io/cyb3r-jak3/pypy-flask:alpine
- cyb3rjak3/pypy-flask:alpine
- registry.gitlab.com/cyb3r-jak3/pypy-flask:alpine

#### Note

The latest version of Flask that the alpine version supports is `2.0.3`. If you need a Flask version higher than that then you must switch to `slim` tags.
