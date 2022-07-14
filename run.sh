#! /bin/sh
docker run -it  -v /home/phabrzyk/lc/ws:/home/lc/ws -v /home/phabrzyk/.ssh:/home/lc/.ssh ghcr.io/lc/lc_amd:latest bash 
# --device=/dev/ttyUSB0