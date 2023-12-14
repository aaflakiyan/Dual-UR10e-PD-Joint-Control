# Dual-UR10e-PD-Joint-Control
This repository demonstrates dual-arm manipulation using two Universal Robot UR10e arms. Employing either joint velocity and PD controllers or cartesian velocity controllers, the code commands the UR10e robots through ROS to reach different joint positions or to have different cartesian velocities.

![dualur10](https://github.com/aaflakiyan/Dual-UR10e-PD-Joint-Control/assets/48828461/1f9e0089-fdb8-459e-96ab-ebcdd6842eac)

## Installation
- In your catkin workspace: 
```
git clone https://github.com/UniversalRobots/Universal_Robots_ROS_Driver.git
git clone https://github.com/rxjia/fmauch_universal_robot.git
```
- Copy launch files inside the launch folder of this repository and paste them in the following path:
```
Universal_Robots_ROS_Driver/ur_robot_driver/launch
```
- catkin_make and source the workspace

## usage
- For joint controller of both robots try:
```
roslaunch ur_robot_driver dual_arm_ur10e_bringup_joint.launch
```
- For cartesian controller of both robots try:
```
roslaunch ur_robot_driver dual_arm_ur10e_bringup_cartesian.launch
```
- Run matlab and rosinit, example.m file shows how to use the functions.

## Aditional Notes
You can always change the contollers inside the launch files to have seperate controllers for each arm.
