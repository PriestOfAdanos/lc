#! /bin/sh
docker build --no-cache --tag ghcr.io/lc/lc_arm64:latest --platform linux/arm64/v8  docker/
docker build --no-cache --tag ghcr.io/lc/lc_amd:latest --platform linux/amd64 docker/