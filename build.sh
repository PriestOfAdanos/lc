#! /bin/sh
docker build --no-cache --platform linux/arm64/v8 --tag push ghcr.io/PriestOfAdanos/lc_arm64:latest docker/
docker build --no-cache --platform linux/amd64 --tag push ghcr.io/PriestOfAdanos/lc_amd:latest docker/