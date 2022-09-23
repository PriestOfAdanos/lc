#! /bin/sh

forward_parameters="--mount type=bind,source="$(pwd)"/ws,target=/home/lc/ws"
trailing_parameters=""
tag="master"
print_help=true

print_usage() {
  printf "Usage: 
  production mode: -p
  development mode: -d
  docker tag: -t [tag]
"
}
run_docker() {
  printf "running ghcr.io/priestofadanos/lc:$tag... \n"
  docker run -it --net=host --privileged --user=root  $forward_parameters \
    --mount type=bind,source="$(pwd)"/bags,target=/bags  \
    --mount type=bind,source=/var/run/dbus/system_bus_socket,target=/var/run/dbus/system_bus_socket \
    --device=/dev/ttyUSB0 \
    ghcr.io/priestofadanos/lc_sensor_grabber:$tag bash \
    $trailing_parameters
}

while getopts "pdt:" flag; do
  case "${flag}" in
    p) trailing_parameters="--device=/dev/ttyUSB0"
       forward_parameters=""
       print_help=false
    ;;
    d) trailing_parameters=""
       forward_parameters="--mount type=bind,source="$(pwd)"/lc_sensor_grabber,target=/home/lc/lc_sensor_grabber"
       print_help=false

    ;;
    t) tag="${OPTARG}" 
       print_help=false
       ;;
    *) print_usage
       print_help=false 
       exit 1
       ;;
  esac
done

if [ "$print_help" = true ] ; 
  then
      print_usage
  else
      run_docker
fi


