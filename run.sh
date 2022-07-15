#! /bin/sh
docker run -it  --privileged  -v /home/phabrzyk/lc/ws:/home/lc/ws -v /home/phabrzyk/.ssh:/home/lc/.ssh ghcr.io/priestofadanos/lc:image-push bash
# --device=/dev/ttyUSB0