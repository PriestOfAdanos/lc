#! /bin/sh
docker build --no-cache --tag ghcr.io/lc/lc_arm64:latest --file  docker/arm.Dockerfile --platform  linux/arm64/v8 docker/
docker build --no-cache --tag ghcr.io/lc/lc_amd:latest --file  docker/amd.Dockerfile --platform linux/amd64 docker/