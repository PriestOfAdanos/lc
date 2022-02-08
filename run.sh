#! /bin/sh
docker run -it  -v /home/phabrzyk/lc/ws:/home/lc/ws -v /home/phabrzyk/.ssh:/home/lc/.ssh lc:latest bash 
# --device=/dev/ttyUSB0