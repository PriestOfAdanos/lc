# Main repo of LaserCube (lc).
LaserCube is a device to measure interiors of rooms meant for custom furniture measurement
it uses octotrees to build pointclouds from bags recorded by the device

The project consists of:
  - lc (this repo) - Dockerfiles and run scripts
  - lc_nodes - nodes written in ros2
  - lc_ros_images - images of ros2 built so that they can be used to build multiplatform images
  - lc_cad_files (TBD) - cad files that are used to print the robot


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

### Urgent fixes:
  - current on raspbery pi's pins does not seem to be stable when lidar is connected 
  - tf tree is a mess
  - use smaller engine and provide it less energy for heating
 
![FDF03410-1C21-4F8C-9BC5-DB65CC78FA55-removebg-preview](https://user-images.githubusercontent.com/31793531/182208791-db0aaa0e-c2c2-47f5-af29-ac69b3f30597.png)
![BBC9BDC6-9708-4755-B16D-582C3CF8F9FB-removebg-preview](https://user-images.githubusercontent.com/31793531/182208798-50bb9a25-80fd-48b4-933c-f4b9f1bfa7f7.png)
![61B72A4B-EABB-41D8-BE4B-116C7B4A07B9-removebg-preview](https://user-images.githubusercontent.com/31793531/182208803-69f9151f-5c8c-4bd8-8948-b84db49dae74.png)
