target "slim" {
    dockerfile = "slim.Dockerfile"
    tags = [
        "cyb3rjak3/pypy-flask",
        "ghcr.io/cyb3r-jak3/pypy-flask",
        "registry.gitlab.com/cyb3r-jak3/pypy-flask",
    ]
}

target "alpine" {
    dockerfile = "alpine.Dockerfile"
    tags = [
        "cyb3rjak3/pypy-flask",
        "ghcr.io/cyb3r-jak3/pypy-flask",
        "registry.gitlab.com/cyb3r-jak3/pypy-flask",
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
    inherits = ["slim", "docker-metadata-action"]
    cache-to = [
        "type=registry,mode=max,ref=ghcr.io/cyb3r-jak3/pypy-flask:slim-cache"
    ]
    cache-from = [
        "ghcr.io/cyb3r-jak3/pypy-flask:slim-cache"
    ]
// See https://github.com/Cyb3r-Jak3/pypy-flask/issues/20
    platforms = [
        "linux/amd64",
        "linux/arm64",
        "linux/386",
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