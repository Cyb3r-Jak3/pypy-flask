target "slim" {
    dockerfile = "slim.Dockerfile"
    tags = [
        "cyb3rjak3/pypy-flask:slim",
        "ghcr.io/cyb3r-jak3/pypy-flask:slim",
        "registry.gitlab.com/cyb3r-jak3/pypy-flask:slim",
    ]
}

target "alpine" {
    dockerfile = "alpine.Dockerfile"
    tags = [
        "cyb3rjak3/pypy-flask:alpine",
        "ghcr.io/cyb3r-jak3/pypy-flask:alpine",
        "registry.gitlab.com/cyb3r-jak3/pypy-flask:alpine",
    ]
}

// Special target: https://github.com/docker/metadata-action#bake-definition
target "docker-metadata-action" {
    platforms = [
        "linux/amd64",
        "linux/arm64",
        "linux/386",
        "linux/s390x"
    ]
}

target "slim-release" {
    inherits = ["docker-metadata-action", "slim"]
    cache-to = [
        "type=registry,mode=max,ref=ghcr.io/cyb3r-jak3/pypy-flask:slim-cache"
    ]
    cache-from = [
        "ghcr.io/cyb3r-jak3/pypy-flask:slim-cache"
    ]
}

target "alpine-release" {
    inherits = ["docker-metadata-action", "alpine"]
    cache-to = [
        "type=registry,mode=max,ref=ghcr.io/cyb3r-jak3/pypy-flask:alpine-cache"
    ]
    cache-from = [
        "ghcr.io/cyb3r-jak3/pypy-flask:alpine-cache"
    ]
}