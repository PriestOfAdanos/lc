#! /bin/sh
docker run -it  --privileged --user=root --mount type=bind,source="$(pwd)"/bags,target=/bags  ghcr.io/priestofadanos/lc:image-push
# --device=/dev/ttyUSB0