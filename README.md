# Main repo of LaserCube (lc), a device to measure interiors of rooms meant for custom furniture measurement
## it uses octotrees to build pointclouds from bags recorded by the device

Here You can find Dockerfiles that build to amd (intel) and arm (raspbery pi). Nodes can be found in lc_nodes project, they include:
  - bluetooth server: handles communication between mobile app and ros2
  - engine controller: gives controll comands to engine and publishes tf between base and top
  - laserscan to pointcloud2 converter: converts laser scans published by rplidar to PointCloud2 
  - tf_publisher: publishes static transform between top and lidar (see image)
  - scan controller: calls services in correct order to make the scan properly

### Status: 
It is still work in progress. Most components work, the device is spinning and taking measurements. 

### TBD:
  - Mobile app to control it 
  - a script to automate building a pointcloud map using octotree from .bag file
 
