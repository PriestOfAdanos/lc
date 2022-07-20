#! /bin/sh
docker run -it --net=host --privileged --user=root --mount type=bind,source="$(pwd)"/ws,target=/home/lc/ws --mount type=bind,source="$(pwd)"/bags,target=/bags  ghcr.io/priestofadanos/lc:image-push
# --device=/dev/ttyUSB0