[![Project status](https://badgen.net/badge/project%20status/stable%20%26%20actively%20maintaned?color=green)](https://github.com/homecentr/docker-frigate-models/graphs/commit-activity) [![](https://badgen.net/github/label-issues/homecentr/docker-frigate-models/bug?label=open%20bugs&color=green)](https://github.com/homecentr/docker-frigate-models/labels/bug) [![](https://badgen.net/github/release/homecentr/docker-frigate-models)](https://hub.docker.com/repository/docker/homecentr/frigate-models)
[![](https://badgen.net/docker/pulls/homecentr/frigate-models)](https://hub.docker.com/repository/docker/homecentr/frigate-models) 
[![](https://badgen.net/docker/size/homecentr/frigate-models)](https://hub.docker.com/repository/docker/homecentr/frigate-models)

![CI/CD on master](https://github.com/homecentr/docker-frigate-models/workflows/CI/CD%20on%20master/badge.svg)


# Homecentr - frigate-models

## Usage

```yml
version: "3.7"
services:
  frigate-models:
    build: .
    image: homecentr/frigate-models
```

## Environment variables

| Name | Default value | Description |
|------|---------------|-------------|
| PUID | 7077 | UID of the user frigate-models should be running as. |
| PGID | 7077 | GID of the user frigate-models should be running as. |

## Exposed ports

| Port | Protocol | Description |
|------|------|-------------|
| 80 | TCP | Some useful details |

## Volumes

| Container path | Description |
|------------|---------------|
| /config | Some useful details |

## Security
The container is regularly scanned for vulnerabilities and updated. Further info can be found in the [Security tab](https://github.com/homecentr/docker-frigate-models/security).

### Container user
The container supports privilege drop. Even though the container starts as root, it will use the permissions only to perform the initial set up. The frigate-models process runs as UID/GID provided in the PUID and PGID environment variables.

:warning: Do not change the container user directly using the `user` Docker compose property or using the `--user` argument. This would break the privilege drop logic.