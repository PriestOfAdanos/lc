FROM ubuntu:20.04
RUN apt clean
RUN apt-get update && apt-get install -y --no-install-recommends \
  wget nano build-essential libomp-dev clang lld git\
  ros-galactic-turtle-tf2-py ros-galactic-tf2-tools ros-galactic-tf-transformations
RUN apt-get update && apt-get install -y --no-install-recommends \
  libeigen3-dev \
  libpcl-dev \
  ros-galactic-geodesy ros-galactic-pcl-ros ros-galactic-nmea-msgs \
  ros-galactic-sensor-msgs
RUN apt-get update && apt-get install -y --no-install-recommends \
  ros-galactic-rviz2 ros-galactic-libg2o \
  ros-galactic-sensor-msgs-py \
  ros-galactic-octomap-mapping 
RUN apt-get update && apt-get install -y --no-install-recommends \
  python3-pip python3-dev python3-setuptools python3-wheel \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*


FROM ros:galactic AS base

ARG USERNAME=lc
ARG USER_UID=1000
ARG USER_GID=$USER_UID

USER root

RUN pip3 install RPi.GPIO

RUN mkdir -p /opt/lc/src

WORKDIR /opt/lc/src
# Comment it out until the repository supports ROS2 builds.
# RUN git clone https://github.com/SMRT-AIST/fast_gicp.git --recursive --depth=1
# RUN git clone https://github.com/koide3/hdl_graph_slam.git --depth=1

RUN git clone https://github.com/PriestOfAdanos/lc_nodes.git
RUN git clone https://github.com/Slamtec/rplidar_ros.git -b ros2 
RUN git clone https://github.com/ros-perception/laser_geometry.git -b ros2
RUN git clone https://github.com/OctoMap/octomap_mapping.git -b ros2


COPY . /opt/lc/src/ndt_omp/

WORKDIR /opt/lc
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