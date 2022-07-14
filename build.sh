#! /bin/sh
docker build --no-cache --tag ghcr.io/priestofadanos/lc_arm64:latest --file  docker/arm.Dockerfile --platform  linux/arm64/v8 docker/
docker build --no-cache --tag ghcr.io/priestofadanos/lc_amd:latest --file  docker/amd.Dockerfile --platform linux/amd64 docker/