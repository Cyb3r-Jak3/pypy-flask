target "slim" {
    dockerfile = "slim.Dockerfile"
}

target "alpine" {
    dockerfile = "alpine.Dockerfile"
}

// Special target: https://github.com/docker/metadata-action#bake-definition
target "docker-metadata-action" {
    platforms = [
        "linux/amd64",
        "linux/arm64",
        "linux/386",
    ]
}

target "slim-release" {
    inherits = ["docker-metadata-action", "slim"]
    cache-to = [
        "type=registry,mode=max,ref=ghcr.io/cyb3r-jak3/pypy-flask-cache:slim"
    ]
    cache-from = [
        "ghcr.io/cyb3r-jak3/pypy-flask-cache:slim"
    ]
    args = {
        "REGISTRY" = ""
    }
}

target "alpine-release" {
    inherits = ["docker-metadata-action", "alpine"]
    cache-to = [
        "type=registry,mode=max,ref=ghcr.io/cyb3r-jak3/pypy-flask-cache:alpine"
    ]
    cache-from = [
        "ghcr.io/cyb3r-jak3/pypy-flask-cache:alpine"
    ]
    platforms = [
        "linux/amd64",
        "linux/arm64",
    ]
    args = {
        "REGISTRY" = "ghcr.io/"
    }
}