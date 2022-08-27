#! /bin/sh

forward_parameters="--mount type=bind,source="$(pwd)"/ws,target=/home/lc/ws"
trailing_parameters=''

print_usage() {
  printf "Usage: 
  production_mode: ./run.sh -p
  development_mode: ./run.sh -d
  "
}
run_docker() {
  printf "running docker ..."
  docker run -it --net=host --privileged --user=root  $forward_parameters \
    --mount type=bind,source="$(pwd)"/bags,target=/bags  \
    --mount type=bind,source=/var/run/dbus/system_bus_socket,target=/var/run/dbus/system_bus_socket \
    --device=/dev/ttyUSB0 \
    ghcr.io/priestofadanos/lc:image-push ./run_server.sh \
    $trailing_parameters
}

while getopts 'pd' flag; do
  case "${flag}" in
    p) trailing_parameters='--device=/dev/ttyUSB0 ' 
       forward_parameters=''
       run_docker
    ;;
    d) run_docker
    ;;
    *) print_usage
       exit 1 ;;
  esac
done


