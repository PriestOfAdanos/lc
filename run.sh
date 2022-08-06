#! /bin/sh
docker run -it --net=host --privileged --user=root --mount type=bind,source="$(pwd)"/ws,target=/home/lc/ws \
--mount type=bind,source="$(pwd)"/bags,target=/bags  \
--mount type=bind,source=/var/run/dbus/system_bus_socket,target=/var/run/dbus/system_bus_socket \
--device=/dev/ttyUSB0 \
ghcr.io/priestofadanos/lc:image-push ./run_server.sh
# --device=/dev/ttyUSB0