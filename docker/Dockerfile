ARG USERNAME=lc
ARG USER_UID=1000
ARG USER_GID=$USER_UID


FROM amd64/ros:galactic AS base
ARG USERNAME
ARG USER_UID
ARG USER_GID

RUN apt-get update && apt-get install -y --no-install-recommends \
  wget nano build-essential libomp-dev clang lld git\
  ros-galactic-tf2-tools ros-galactic-tf-transformations \
  libeigen3-dev \
  libpcl-dev \
  ros-galactic-geodesy ros-galactic-pcl-ros ros-galactic-nmea-msgs \
  ros-galactic-sensor-msgs \
  ros-galactic-sensor-msgs-py \
  ros-galactic-octomap-mapping \
  python3-pip python3-dev python3-setuptools python3-wheel \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

RUN pip3 install RPi.GPIO transforms3d

RUN mkdir -p /opt/$USERNAME/src

FROM base as compile
ARG USERNAME
ARG USER_UID
ARG USER_GID

WORKDIR /opt/$USERNAME/src

RUN git clone https://github.com/PriestOfAdanos/lc_nodes.git -b scan_assembler
RUN git clone https://github.com/Slamtec/rplidar_ros.git -b ros2 
RUN git clone https://github.com/ros-perception/laser_geometry.git -b ros2
RUN git clone https://github.com/OctoMap/octomap_mapping.git -b ros2

COPY . /opt/$USERNAME/src/ndt_omp/

WORKDIR /opt/$USERNAME
RUN /bin/bash -c '. /opt/ros/galactic/setup.bash; colcon build'
RUN sed -i "6i source \"/opt/$USERNAME/install/setup.bash\"" /ros_entrypoint.sh


FROM base AS final
ARG USERNAME
ARG USER_UID
ARG USER_GID

COPY --from=compile /opt/$USERNAME/install /opt/$USERNAME/install
COPY --from=compile /ros_entrypoint.sh /ros_entrypoint.sh

WORKDIR /

# Create the user
RUN addgroup --gid $USER_GID $USERNAME
RUN adduser --gecos '' --uid $USER_UID --gid $USER_GID $USERNAME
RUN echo "${USERNAME}:${USERNAME}" | chpasswd
RUN usermod -aG sudo $USERNAME

# ENTRYPOINT ["/ros_entrypoint.sh"]
# CMD ["bash"]

USER $USERNAME

WORKDIR /home/$USERNAME/ws