%% SETUP STEPS
% roslaunch ur_robot_driver dual_arm_ur10e_bringup.launch controllers:="joint_state_controller twist_controller"

% You can change the controller type in dual_arm_ur10e_bringup.launch file
% in the following repository: /home/workcell/catkin_ws/src/Universal_Robots_ROS_Driver/ur_robot_driver/launch

% The 'controllers' argument can be changed to launch the desired
% controllers, e.g. Twist controller, joint velocity controller
% Go into program tab and under URCaps, select the External Control
% program and run it on each tablet AFTER running the roslaunch command
% When finished with external control, close the roslaunch and then stop
% each External Control program after the roslaunch has terminated.

%% MAIN PROGRAM
% q1 is the desired joint position vector for robot 1
% q2 is the desired joint positoin vector for robot 2

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
