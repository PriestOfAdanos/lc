#! /bin/sh
docker build --no-cache --platform linux/arm64/v8 --build-arg USER_ID=$(id -u) --build-arg GROUP_ID=$(id -g)  --tag push ghcr.io/PriestOfAdanos/lc_arm64:latest docker/
docker build --no-cache --platform linux/amd64 --build-arg USER_ID=$(id -u) --build-arg GROUP_ID=$(id -g)  --tag push ghcr.io/PriestOfAdanos/lc_amd:latest docker/