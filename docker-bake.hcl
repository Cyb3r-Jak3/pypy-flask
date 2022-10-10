target "slim" {
    dockerfile = "slim.Dockerfile"
}

// target "alpine" {
//     dockerfile = "alpine.Dockerfile"
// }

// Special target: https://github.com/docker/metadata-action#bake-definition
target "docker-metadata-action" {
    platforms = [
        "linux/amd64",
        "linux/arm64",
        "linux/386",
    ]
}

target "slim-release" {
    inherits = ["slim", "docker-metadata-action"]
    cache-to = [
        "type=registry,mode=max,ref=ghcr.io/cyb3r-jak3/pypy-flask-cache:slim"
    ]
    cache-from = [
        "ghcr.io/cyb3r-jak3/pypy-flask-cache:slim"
    ]
}

// target "alpine-release" {
//     inherits = ["alpine", "docker-metadata-action"]
//     cache-to = [
//         "type=registry,mode=max,ref=ghcr.io/cyb3r-jak3/pypy-flask-cache:alpine"
//     ]
//     cache-from = [
//         "ghcr.io/cyb3r-jak3/pypy-flask-cache:alpine"
//     ]
// }