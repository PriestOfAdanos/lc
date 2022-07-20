from launch import LaunchDescription
from launch_ros.actions import Node


def generate_launch_description():
    return LaunchDescription([
        Node(
            package='engine_controller',
            executable='engine_controller_node',
            name='engine_controller_node',
            output='both',
            respawn=False
        ),
        Node(
            package='rplidar_ros2',
            executable='rplidar_scan_publisher',
            name='rplidar_scan_publisher',
            output='both',
            respawn=False
        ),
        Node(
            package='scan_to_pointcloud2',
            executable='scan_to_pointcloud2_node',
            name='scan_to_pointcloud2_node',
            output='both',
            respawn=False
        ),
        Node(
            package='scan_to_pointcloud2',
            executable='scan_to_pointcloud2_node',
            name='scan_to_pointcloud2_node',
            output='both',
            respawn=False
        ),
        Node(
            package='top_to_lidar_tf_static_publisher',
            executable='top_to_lidar_tf_static_publisher_node',
            name='top_to_lidar_tf_static_publisher_node',
            output='both',
            respawn=False
        ),
        Node(
            package='bluetooth_scanner',
            executable='bluetooth_scanner_node',
            name='bluetooth_scanner_node',
            output='both',
            respawn=False,
        ),
        Node(
            package='scan_assembler',
            executable='scan_assembler_node',
            name='scan_assembler_node',
            output='both',
            respawn=False
        ),

    ])
