#! /bin/sh
docker run -it --net=host --privileged --user=root \
--mount type=bind,source="$(pwd)"/bags,target=/bags \
--mount type=bind,source="$(pwd)"/results,target=/results \
--mount type=bind,source=/var/run/dbus/system_bus_socket,target=/var/run/dbus/system_bus_socket \
ghcr.io/priestofadanos/lc:image-push ./scan_assembler.sh
