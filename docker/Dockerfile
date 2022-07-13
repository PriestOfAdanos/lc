FROM ros:galactic AS base

ARG USER_ID
ARG GROUP_ID

RUN apt-get update && apt-get install -y --no-install-recommends \
  wget nano build-essential libomp-dev clang lld git\
  ros-galactic-turtle-tf2-py ros-galactic-tf2-tools ros-galactic-tf-transformations \
  libeigen3-dev \
  libpcl-dev \
  ros-galactic-geodesy ros-galactic-pcl-ros ros-galactic-nmea-msgs \
  ros-galactic-sensor-msgs \
  ros-galactic-rviz2 ros-galactic-libg2o \
  ros-galactic-sensor-msgs-py \
  python3-pip python3-dev python3-setuptools python3-wheel \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

RUN pip3 install RPi.GPIO

RUN mkdir -p /opt/lc/src

WORKDIR /opt/lc/src
# Comment it out until the repository supports ROS2 builds.
# RUN git clone https://github.com/SMRT-AIST/fast_gicp.git --recursive --depth=1
# RUN git clone https://github.com/koide3/hdl_graph_slam.git --depth=1

RUN git clone https://github.com/PriestOfAdanos/lc_nodes.git -b engine_controller
RUN git clone https://github.com/Slamtec/rplidar_ros.git -b ros2 
RUN git clone https://github.com/ros-perception/laser_geometry.git -b ros2



COPY . /opt/lc/src/ndt_omp/

WORKDIR /opt/lc
RUN /bin/bash -c '. /opt/ros/galactic/setup.bash; colcon build'
RUN sed -i "6i source \"/opt/lc/install/setup.bash\"" /ros_entrypoint.sh

WORKDIR /

ENTRYPOINT ["/ros_entrypoint.sh"]
CMD ["bash"]





RUN addgroup --gid $GROUP_ID lc
RUN adduser --gecos '' --uid $USER_ID --gid $GROUP_ID lc
RUN echo "lc:lc" | chpasswd
RUN usermod -aG sudo lc

USER lc

WORKDIR /home/lc/ws