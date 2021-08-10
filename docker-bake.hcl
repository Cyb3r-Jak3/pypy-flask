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
}

target "alpine-release" {
    inherits = ["alpine", "docker-metadata-action"]
}