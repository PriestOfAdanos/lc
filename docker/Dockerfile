FROM amd64/ros:galactic AS base

ARG USERNAME=lc
ARG USER_UID=1000
ARG USER_GID=$USER_UID

RUN apt-get update && apt-get install -y --no-install-recommends \
  wget nano build-essential libomp-dev clang lld git\
  ros-galactic-turtle-tf2-py ros-galactic-tf2-tools ros-galactic-tf-transformations \
  libeigen3-dev \
  libpcl-dev \
  ros-galactic-geodesy ros-galactic-pcl-ros ros-galactic-nmea-msgs \
  ros-galactic-sensor-msgs \
  ros-galactic-rviz2 ros-galactic-libg2o \
  ros-galactic-sensor-msgs-py \
  ros-galactic-octomap-mapping \
  python3-pip python3-dev python3-setuptools python3-wheel \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

RUN pip3 install RPi.GPIO

RUN mkdir -p /opt/lc/src

WORKDIR /opt/lc/src


RUN git clone https://github.com/PriestOfAdanos/lc_nodes.git -b scan_assembler
RUN git clone https://github.com/Slamtec/rplidar_ros.git -b ros2 
RUN git clone https://github.com/ros-perception/laser_geometry.git -b ros2
RUN git clone https://github.com/OctoMap/octomap_mapping.git -b ros2


COPY . /opt/lc/src/ndt_omp/



WORKDIR /opt/lc
RUN rm -rf build/ && \
  rm -rf log/ && \
  rm -rf src/

FROM amd64/ros:galactic AS final

COPY --from=base /opt/lc/ /opt/lc/

RUN /bin/bash -c '. /opt/ros/galactic/setup.bash; colcon build'
RUN sed -i "6i source \"/opt/lc/install/setup.bash\"" /ros_entrypoint.sh

WORKDIR /

ENTRYPOINT ["/ros_entrypoint.sh"]
CMD ["bash"]

# Create the user
RUN groupadd --gid $USER_GID $USERNAME \
  && useradd --uid $USER_UID --gid $USER_GID -m $USERNAME
RUN usermod -aG sudo lc

USER lc

WORKDIR /home/lc/ws