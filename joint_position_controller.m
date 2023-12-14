%% SETUP STEPS

% for joint controller try:
% roslaunch ur_robot_driver dual_arm_ur10e_bringup_joint.launch
% for cartesian controller try:
% roslaunch ur_robot_driver dual_arm_ur10e_bringup_joint.launch


% save the calibration you get from your robots in ur_calibration/etc/
% folder and rename them with ur101_calibration.yaml for the first robot and
% ur102_calibration.yaml for the secound robot
% replace ---- with joint velocity controller or twist_controller 
% This function is for the time that you use joint velocity controller for both robots
% You can change the controller type in dual_arm_ur10e_bringup.launch file
% in the following repository: /home/workcell/catkin_ws/src/Universal_Robots_ROS_Driver/ur_robot_driver/launch

% Go into program tab and under URCaps, select the External Control
% program and run it on each tablet AFTER running the roslaunch command
% When finished with external control, close the roslaunch and then stop
% each External Control program after the roslaunch has terminated.

%% MAIN PROGRAM
% q1 is the desired joint position vector for robot 1
% q2 is the desired joint positoin vector for robot 2
% x1 is the desired cartesian velocity vector for robot 1
% x2 is the desired cartesian velocity vector for robot 2



function joint_position_controller(q1,q2)

kp = 0.05;
kd = 2*sqrt(kp);

jointstate_ur101 = rossubscriber('/ur101/joint_states');
jointstatedata_ur101 = receive(jointstate_ur101);

joint_position_ur101= jointstatedata_ur101.Position;
joint_velocity_ur101=jointstatedata_ur101.Velocity;


jointstate_ur102 = rossubscriber('/ur102/joint_states');
jointstatedata_ur102 = receive(jointstate_ur102);

joint_position_ur102= jointstatedata_ur102.Position;
joint_velocity_ur102=jointstatedata_ur102.Velocity;


%% publishing Joint velocity
joint_vel_ur101 = rospublisher('/ur101/joint_group_vel_controller/command','std_msgs/Float64MultiArray');
msg_ur101 = rosmessage(joint_vel_ur101);

joint_vel_ur102 = rospublisher('/ur102/joint_group_vel_controller/command','std_msgs/Float64MultiArray');
msg_ur102 = rosmessage(joint_vel_ur102);


msg_ur101.Data = kp*(q1-joint_position_ur101)-kd*joint_velocity_ur101;
msg_ur102.Data = kp*(q2-joint_position_ur102)-kd*joint_velocity_ur102;
   
send(joint_vel_ur101,msg_ur101);

send(joint_vel_ur102,msg_ur102);

end
